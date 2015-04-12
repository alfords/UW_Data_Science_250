# DataScience02f.R
#
# Clear Workspace
rm(list=ls())
# Clear Console:
cat("\014")

# Copy Quiz 3a question to R studio editor:

#Question 1.
#Replace outliers in numeric vector x
x <- x[(x > mean(x) + 2*sd(x)) | (x < mean(x) - 2*sd(x))]
x[(x > mean(x) + 2*sd(x)) | (x < mean(x) - 2*sd(x))] <- median(x)
x <- x[(x < mean(x) + 2*sd(x)) & (x > mean(x) - 2*sd(x))]
x <- (x - min(x))/(max(x) - min(x))

#Question 2.
#Replace all values that are too low in x with a lower bound:
x[x < mean(x) - 2*sd(x)] <- mean(x) + 2*sd(x)
x[x < mean(x) + 2*sd(x)] <- mean(x) + 2*sd(x)
x[x < mean(x) + 2*sd(x)] <- mean(x) - 2*sd(x)
x[x < mean(x) - 2*sd(x)] <- mean(x) - 2*sd(x)

#Question 3.
x[x > mean(x) + 2*sd(x)] <- mean(x) + 2*sd(x)
#This code will
#replace low outliers with a lower bound
#perform feature scaling
#z-normalize the values
#replace high outliers with an upper bound

#Question 4.
x <- (x - mean(x))/sd(x)
#This code will
#replace high outliers with an upper bound
#z-normalize the values
#replace low outliers with a lower bound
#perform feature scaling

#Question 5.
#Normalize vector x by Min-Max or Range (Feature Scaling)
x <- x[(x > mean(x) + 2*sd(x)) | (x < mean(x) - 2*sd(x))]
x <- (x - min(x))/(max(x) - min(x))
x[(x > mean(x) + 2*sd(x)) | (x < mean(x) - 2*sd(x))] <- mean(x)
x <- x[(x < mean(x) + 2*sd(x)) & (x > mean(x) - 2*sd(x))]

#Question 6.
#Remove from data frame x any row that has an NA in the first column/vector
x <- x[!is.na(x[,1]),]
x <- na.omit(x)
x <- x[!complete.cases(x), ]
x <- x[x[,1] != NA]