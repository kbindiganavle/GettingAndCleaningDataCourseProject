# Getting And Cleaning Data CourseProject

## Project Requirements
One of the most exciting areas in all of data science right now is wearable computing - see for example this [article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data available from the link below represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The goal is to tidy up data so it can be used for later analysis. Create a R script called run_analysis.R that does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Repository contents
* **CodeBook.md** - describes the variables, the data, and any transformations or work that you performed to clean up the data
* **README.md** - explains how all of the scripts work and how they are connected
* **run_analysis.R** - R script that creates a tidy data set
* **tidyData.txt** - contains results from running the script

## How to run the script
* Clone the [git project](https://github.com/kbindiganavle/GettingAndCleaningDataCourseProject.git) locally
* Open R console and set the directory where you cloned the project as the working directory
* Install plyr package if necessary
* Source run_analysis.R to generate tidyData.txt
