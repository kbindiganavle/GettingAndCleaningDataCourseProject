library(plyr)

# download and unzip dataset
dataDir <- "./UCI HAR Dataset"
if (!file.exists(dataDir)) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./courseProjectDataSet.zip", method = "curl")
    unzip("./courseProjectDataSet.zip", exdir = ".")
}

# read common data
activities <- read.table(paste(dataDir,"/activity_labels.txt", sep=""))
features <- read.table(paste(dataDir,"/features.txt", sep=""))

# read training data
trainX <- read.table(paste(dataDir,"/train/X_train.txt", sep=""))
trainY <- read.table(paste(dataDir,"/train/Y_train.txt", sep=""))
trainSubject <- read.table(paste(dataDir,"/train/subject_train.txt", sep=""))

# read test data
testX <- read.table(paste(dataDir,"/test/X_test.txt", sep=""))
testY <- read.table(paste(dataDir,"/test/Y_test.txt", sep=""))
testSubject <- read.table(paste(dataDir,"/test/subject_test.txt", sep=""))

##########################################################################
# Requirement 4: label the data sets with descriptive variable names.
##########################################################################
colnames(features) <- c("index", "featureName")
colnames(activities) <- c("activityId", "activityName")

colnames(trainX) <- features$featureName
colnames(trainY) <- c("activity")
colnames(trainSubject) <- c("subjectId")

colnames(testX) <- features$featureName
colnames(testY) <- c("activity")
colnames(testSubject) <- c("subjectId")

##########################################################################
# Requirement 3: replace activityIds with  descriptive names to name the 
# activities in the Y data sets
##########################################################################
for(i in 1:nrow(activities)) {
    activityId <- activities$activityId[i]
    activityName <- as.character(activities$activityName)[i]
    testY$activity[testY$activity == activityId] <- activityName
    trainY$activity[trainY$activity == activityId] <- activityName
}

##########################################################################
# Requirement 2: Extract only the measurements on the mean and standard 
# deviation for each measurement X dataSets
##########################################################################
meanAndStdMeasurementCols <- grep("-(mean|std)\\(\\)", features$featureName)
testX <- testX[meanAndStdMeasurementCols]
trainX <- trainX[meanAndStdMeasurementCols]

##########################################################################
# Requirement 1: (merge) the training and the test sets to create one final 
# data set.
##########################################################################
# bind columns from all test and training tables respectively first
testData <- cbind(testSubject, testY, testX)
trainingData <- cbind(trainSubject, trainY, trainX)

# bind rows from testData and trainingData
finalDataSet <- rbind(testData, trainingData)

##########################################################################
# Requirement 5: create a second, independent tidy data set with the average 
# of each variable for each activity and each subject.
##########################################################################
# The following keeps all columns in the data frame
tidyData1 <- ddply(finalDataSet, .(subjectId, activity), function(x) colMeans(x[,3:68]))

# The following removes the activity and subjectId columns in the data frame
tidyData2 <- data.frame(do.call("rbind", 
                                by(finalDataSet[, 3:68], 
                                   list(finalDataSet$activity, finalDataSet$subjectId), colMeans)))
# export tidyData to a file
write.table(tidyData1, file = "./tidyData.txt", row.names = FALSE)