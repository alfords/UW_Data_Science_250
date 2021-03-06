####################### Assignment [1] ##########################

# Loading data from the internet data source into ILPD variable
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00225/Indian%20Liver%20Patient%20Dataset%20%28ILPD%29.csv"
ILPD <- read.csv(url, header=FALSE, stringsAsFactors=FALSE)

# Constracting a vector of names and assigning column names to the ILPD data set
headers = c("Age", "Gender", "TotalTB_Brbn", "DBDirect_Brbn", "AlkpAlkaPhosphate", "SgptAlamAnino", "SgotAsparAmino", "TPTotalProt", "ALBAbmn", "AGRatio", "Selector")
colnames(ILPD) <- headers

####################### Assignment [2] ##########################

# Displaying first 6 rows of the ILPD data set
head(ILPD, 6)

# Displaying mean, median and standard diviation for appropriate variables
sapply(ILPD, sd, na.rm=TRUE)
sapply(ILPD, mean, na.rm=TRUE)
sapply(ILPD, median, na.rm=TRUE)

# na.rm=TRUE removes N/A or equivalets (if specified) of N/A from vectors being analyzed.

# Using plot(ILPD) function. Converted Mail<>Femail to 1<>2
ILPD$Gender[ILPD$Gender == "Male"] <- 1
ILPD$Gender[ILPD$Gender == "Female"] <- 2
plot(ILPD)

# a.What can you say about the data?
#   There appers to be strong linear relationships between several variables, namesly
#   TotalTB_Bntn & DBDirect_Bntn, TPTotalProt & ALBAbmn, and ALBAdmn & AGRatio.
# b.How can you tell if a vector contains continuous numbers or binary data?
#   Binary data has descrete boundaries, the prime example is Gender with vaues
#   of 1 and 2.
# c.How can you tell if two vectors are correlated?
#   Positive slope line is displayed when two vectors are correlated.  TotalTB_Bntn
#   and DBDirect_Bntn is a good example of strong correlation when evaluated
#   visually.

####################### Assignment [3] ##########################

# Remove outliers
c <- c(-1, 1, 5, 1, 1, 17, -3, 1, 1, 3)
hlm <- mean(c) + 2*sd(c)
llm <- mean(c) - 2*sd(c)
good <- (c < hlm) & (c > llm)
c <- c[good]
c

# Re-label the variables
c1 <- c('BS', 'MS', 'PhD', 'HS', 'Bachelors', 'Masters', 'High School', 'BS', 'MS', 'MS')
c1[c1 == "Bachelors"] <- "BS"
c1[c1 == "Masters"] <- "MS"
c1[c1 == "High School"] <- "HS"
c1[c1 == "PhD"] <- "PHD"
c1

# Normalize data

   # Min Max Normalizations
c2 <- c(-1, 1, 5, 1, 1, 17, -3, 1, 1, 3)
a <- min(c2)
b <- max(c2) - min(c2)
normalized <- (c2 - a) / b
normalized

   # Z-Score Normalization
c3 <- c(-1, 1, 5, 1, 1, 17, -3, 1, 1, 3)
a <- mean(c3)
b <- sd(c3)
normalized <- (c3 - a) / b
normalized

# Binarize data
c4 <- c('Red', 'Green', 'Blue', 'Blue', 'Blue', 'Blue', 'Blue', 'Red', 'Green', 'Blue')
red <- c4 == "Red"
red <- as.numeric(red)
green <- c4 == "Green"
green <- as.numeric(green)
blue <- c4 == "Blue"
blue <- as.numeric(blue)
red
green
blue

# Discretize data
x <- c(3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 9, 12, 23, 23, 25, 81)

   # Equal Range

   # First, remove outliers.  Without removal of outliers, the discretization of the
   # vector x will have only two categoris.
hlm1 <- mean(x) + 2*sd(x)
llm1 <- mean(x) - 2*sd(x)
good <- (x < hlm1) & (x > llm1)
x <- x[good]
x
   # I modified your code here - it was easier to do than write my own, but
   # I got the idea - 3 bins of roughly equal size.
range <- max(x) - min(x)
range
binWidth <- range / 3
binWidth
bin1Min <- -Inf
bin1Max <- min(x) + binWidth
bin2Max <- min(x) + 2*binWidth
bin3Max <- Inf
xDiscretized <- rep(NA, length(x))
xDiscretized
xDiscretized[bin1Min < x & x <= bin1Max] <- "Very Low"
xDiscretized[bin1Max < x & x <= bin2Max] <- "Low"
xDiscretized[bin2Max < x & x <= bin3Max] <- "High"
xDiscretized

# 3 bins of roughly equal amount
x1 <- c(3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 9, 12, 23, 23, 25, 81)
bin <- sum(x1) / 3 # a weight of each bucket

   # The vector is sorted, so I can use simple accumulators to get 3 bins of roughly
   # equal wegith. This is a rough approximation. At the end of processing, the
   # three buckets will have roughly the same weight. This algorithm works best with size 
   # of teh buckets rather that with number of the buckets.

bucket1 <- c()
bucket2 <- c()
bucket3 <- c()
for (i in x1) {
  if (sum(bucket1) <= bin) {
    bucket1 <- c(bucket1, i)
  } else if (sum(bucket1) + i > bin && sum(bucket2) + i <= bin) {
    bucket2 <- c(bucket2, i)
  } else if (sum(bucket2) + i > bin) {
    bucket3 <- c(bucket3, i)
  }
}
sum(bucket1)
sum(bucket2)
sum(bucket3)

# From here, I can replace the content of the buckets with any text, add names and etc.
# if needed.

