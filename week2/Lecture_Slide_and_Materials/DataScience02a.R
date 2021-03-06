# DataScience02a
# Download R
# http://cran.r-project.org/bin/windows/base/R-3.0.1-win.exe
# http://cran.r-project.org/bin/windows/base/R-3.0.2-win.exe

# Download RStudio
# http://www.rstudio.com/ide/download/

# Get R version
R.Version()$version.string
# Get RStudio version
# Rstudio:  Toolbar at top > Help >  About RStudio

#
# To change default R working directory:
# Read: http://faculty.chicagobooth.edu/robert.gramacy/teaching/ara/setcwd.pdf
# Append the following three lines (yes, the third blank line is important) to:  C:\Program Files\R\R-3.0.1\etc\Rprofile.site
# Permanently set working directory
setwd("D:/R/WorkingDirectory") # Even for windows users the slashes must be forward-slashes: 

# Global setting for plots
par(mar=c(4,4,1,1))

#
# How to install and upgrade r
# installing/loading the package:
reposURL <-  "http://cran.rstudio.com"
if(!require(installr)) {install.packages("installr", dep=TRUE, repos=reposURL)} else {"Latest R version is already Installed."} #load / install+load installr
library(installr)
# using the package:
updateR() # this will start the updating process of your R installation.  It will check for newer versions, and if one is available, will guide you through the decisions you'd need to make.

# Save 
# save the workspace to the file .RData in the cwd
save.image()

# save specific objects to a file
# if you don't specify the path, the cwd is assumed
save.image(file="myfile.RData")

# or to save individual objectst
save(list=c("x","reposURL"), file="myfile.RData")

# load a workspace into the current session
# if you don't specify the path, the cwd is assumed
load("myfile.RData") 