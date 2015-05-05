# Clear objects from Memory
rm(list=ls())
# Clear Console:
cat("\014")
source("D:\\BusinessIntelligence\\DataScientist\\2015.03.30_Spring\\Lecture_05\\Homework\\ClassificationHelper.R")
#source("D:\\BusinessIntelligence\\DataScientist\\2015.03.30_Spring\\Lecture_05\\Homework\\ClassificationIn.R")

testData = data.frame(1:1000, 1:1000)
fractionOfTestx = 0.2
IterMax <- 100

print(" ")
print("----------------------------------")
print("Test 0:  BadPartition started")
tryCatch({
  for (testNo in 1:10)
  {
    basicTest <- BadPartition(testData, fractionOfTest = fractionOfTestx)
    if(identical(names(basicTest), c("trainSet", "testSet")) || identical(names(basicTest), c("testSet", "trainSet")))
    {
      # Test total rows
      if (nrow(basicTest$trainSet) + nrow(basicTest$testSet) != nrow(testData))
      {
        print(paste("Test 0:  Partition Error trainSet has:", nrow(basicTest$trainSet)))
        print(paste("Test 0:  Partition Error testSet  has:", nrow(basicTest$testSet)))
        break
      } # if else
      
      # Test Exclusive
      testData2 <- rbind(basicTest$trainSet, basicTest$testSet)
      testData2 <- testData2[order(testData2[,1]), ]
      row.names(testData2) <- NULL
      if(!identical(testData, testData2))
      {
        print(paste("Test 0:  Partition Error non-exclusive:"))
        break
      }
    } else
    {
      print(paste("Test 0: Partition should return list of trainSet, testSet; not: ", paste(names(basicTest), collapse=', ') ) )
      break
    } # if else
  } # for
  
  lengths <- rep(NA, IterMax)
  for (iterNo in 1:IterMax)
  {
    lengths[iterNo] <- nrow(BadPartition(testData, fractionOfTest = fractionOfTestx)$testSet)
  } # for
  absDiffSd <- abs(sd(lengths) - 13)
  absDiffmean <-abs(mean(lengths) - 200)
  if ((absDiffSd > 4) || (absDiffmean > 5))
  {
    print(paste("Test 0:  BadPartition does not distribute around:", fractionOfTestx))
  } else
  {
    print(paste("Test 0:  BadPartition distribute around:", mean(lengths)/nrow(testData)))
  }
}, error=function(e){print("Test 0:  BadPartition throws error")}) # tryCatch

# Test distribution
results <- c()
for (iter in 1:IterMax)
{
  resultIter <- BadPartition(testData, fractionOfTest = fractionOfTestx)$testSet
  results <- c(results, resultIter[,1])
}
if (sd(hist(results, breaks=10)$counts) > 2*sqrt(fractionOfTestx*nrow(testData)*IterMax/10))
{
  print("Test 0:  Error  ---  non uniform distribution in BadPartition")
}
if (abs(mean(results)-mean(testData[,1])) > sqrt(mean(testData[,1])))
{
  print(paste("Test 0:  Error  ---  unexpected mean of distribution:  ", mean(results), "; should be: ", mean(testData[,1])))
}

print(" ")
print("----------------------------------")
print("Test 1:  FastPartition started")
tryCatch({
  for (testNo in 1:10)
  {
    basicTest <- FastPartition(testData, fractionOfTest = fractionOfTestx)
    if(identical(names(basicTest), c("trainSet", "testSet")) || identical(names(basicTest), c("testSet", "trainSet")))
    {
      # Test total rows
      if (nrow(basicTest$trainSet) + nrow(basicTest$testSet) != nrow(testData))
      {
        print(paste("Test 1:  Partition Error trainSet has:", nrow(basicTest$trainSet)))
        print(paste("Test 1:  Partition Error testSet  has:", nrow(basicTest$testSet)))
        break
      } # if else
      
      # Test Exclusive
      testData2 <- rbind(basicTest$trainSet, basicTest$testSet)
      testData2 <- testData2[order(testData2[,1]), ]
      row.names(testData2) <- NULL
      if(!identical(testData, testData2[order(testData2[,1]), ]))
      {
        print(paste("Test 1:  Partition Error non-exclusive:"))
        break
      }
    } else
    {
      print(paste("Test 1: Partition should return list of trainSet, testSet; not: ", paste(names(basicTest), collapse=', ') ) )
      break
    } # if else
  } # for
  
  lengths <- rep(NA, IterMax)
  for (iterNo in 1:IterMax)
  {
    lengths[iterNo] <- nrow(FastPartition(testData, fractionOfTest = fractionOfTestx)$testSet)
  } # for
  absDiffSd <- abs(sd(lengths) - 13)
  absDiffmean <-abs(mean(lengths) - 200)
  if ((absDiffSd > 4) || (absDiffmean > 5))
  {
    print(paste("Test 1:  FastPartition does not distribute around:", fractionOfTestx))
  } else
  {
    print(paste("Test 1:  FastPartition distribute around:", mean(lengths)/nrow(testData)))
  }
}, error=function(e){print("Test 1:  FastPartition throws error")}) # tryCatch

# Test distribution
results <- c()
for (iter in 1:IterMax)
{
  resultIter <- FastPartition(testData, fractionOfTest = fractionOfTestx)$testSet
  results <- c(results, resultIter[,1])
}
if (sd(hist(results, breaks=10)$counts) > 2*sqrt(fractionOfTestx*nrow(testData)*IterMax/10))
{
  print("Test 1:  Error  ---  non uniform distribution in FastPartition")
}
if (abs(mean(results)-mean(testData[,1])) > sqrt(mean(testData[,1])))
{
  print(paste("Test 1:  Error  ---  unexpected mean of distribution:  ", mean(results), "; should be: ", mean(testData[,1])))
}

print(" ")
print("----------------------------------")
print("Test 2:  ExactPartition started")
tryCatch({
  for (testNo in 1:10)
  {
    basicTest <- ExactPartition(testData, fractionOfTest = fractionOfTestx)
    if(identical(names(basicTest), c("trainSet", "testSet")) || identical(names(basicTest), c("testSet", "trainSet")))
    {
      # Test fraction of test
      approxFraction <- nrow(basicTest$testSet)/nrow(testData)
      if (abs(1 - approxFraction/fractionOfTestx) > 1/nrow(testData))
      {
        print(paste("Test 2:  Partition wrong test proportion:  ", approxFraction))
        break
      } # if else
      
      # Test total rows
      if (nrow(basicTest$trainSet) + nrow(basicTest$testSet) != nrow(testData))
      {
        print(paste("Test 2:  Partition Error trainSet has:", nrow(basicTest$trainSet)))
        print(paste("Test 2:  Partition Error testSet  has:", nrow(basicTest$testSet)))
        break
      } # if else
      
      # Test Exclusive
      testData2 <- rbind(basicTest$trainSet, basicTest$testSet)
      testData2 <- testData2[order(testData2[,1]), ]
      row.names(testData2) <- NULL
      if(!identical(testData, testData2[order(testData2[,1]), ]))
      {
        print(paste("Test 2:  Partition Error non-exclusive:"))
        break
      }
    } else
    {
      print(paste("Test 1: Partition should return list of trainSet, testSet; not: ", paste(names(basicTest), collapse=', ') ) )
      break
    } # if else
  } # for
  print(paste("Test 2:  Partition test proportion:  ", approxFraction))
}, error=function(e){print("Test 2:  ExactPartition throws error")}) # tryCatch

# Test distribution
results <- c()
for (iter in 1:IterMax)
{
  resultIter <- ExactPartition(testData, fractionOfTest = fractionOfTestx)$testSet
  results <- c(results, resultIter[,1])
  if (nrow(resultIter) != fractionOfTestx*nrow(testData))
  {
    print("Test 2:  ExactPartition length is incorrect")
    break;
  }
}
if (sd(hist(results, breaks=10)$counts) > 2*sqrt(fractionOfTestx*nrow(testData)*IterMax/10))
{
  print("Test 2:  Error  ---  non uniform distribution in ExactPartition")
}
if (abs(mean(results)-mean(testData[,1])) > sqrt(mean(testData[,1])))
{
  print(paste("Test 2:  Error  ---  unexpected mean of distribution:  ", mean(results), "; should be: ", mean(testData[,1])))
}
