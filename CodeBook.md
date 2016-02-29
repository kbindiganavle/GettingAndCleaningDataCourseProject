# Code Book

## Data
The data set used for this project is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The data set represents data collected from the accelerometers from the Samsung Galaxy S smartphone. More detailed description for how the data is collected and such is available at the following site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The dataset includes the following files:
* *features_info.txt*: Shows information about the variables used on the feature vector.
* *features.txt*: List of all features.
* *activity_labels.txt*: Links the class labels with their activity name.
* *train/X_train.txt*: Training set.
* *train/y_train.txt*: Training labels.
* *train/subject_train.txt*: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* *test/X_test.txt*: Test set.
* *test/y_test.txt*: Test labels.
* *test/subject_test.txt*: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

The following image which apperently come from a forum posting by __Community TA David Hood__ explains the relationship between different data sets described above:
![alt text](https://github.com/kbindiganavle/GettingAndCleaningDataCourseProject/blob/master/data.jpg)

The following files are also available for the train and test data. Their descriptions are equivalent. But for purposes of this analysis, these files are not considered
* *train/Inertial Signals/total_acc_x_train.txt*: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the *total_acc_x_train.txt* and *total_acc_z_train.txt* files for the Y and Z axis. 
* *train/Inertial Signals/body_acc_x_train.txt*: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* *train/Inertial Signals/body_gyro_x_train.txt*: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Data Transformations
* Read data from the files specified above into data frames. The following variables store the data:
  * **activities** - activity_labels.txt
  * **features** - features.txt
  * **trainX** - X_train.txt
  * **trainY** - Y_train.txt
  * **trainSubject** - subject_train.txt
  * **testX** - X_test.txt
  * **testY** - Y_test.txt
  * **testSubject** - subject_test.txt
* Apply meaningful column names to each data frame. Given that the values in the features dataframe will be used used as column names for the **trainX** and **trainY**, update the values to be more meaningful before they are set as column names on those data frames.
* Replace the activity ids in **trainY** and **testY** with activity names gleaned from **activities** data frame.
* Create a column index vector **meanAndStdMeasurementCols** that identifies all columns that represent mean and standard deviation measurements. Use this vector to subset the **trainX** and **testX** data frames.
* Bind columns from the transformed **test**(*trainX*, *trainY*, *trainSubject*) and **train**(*testX*, *testY*, *testSubject*) data frames to create **testData** and **trainingData** dataframes. Bind the rows from **testData** and **trainingData** data frames to create a consolidated data frame **finalDataSet**
* Create a tidy data frame **tidyData1** with the average of each measurement column for each activity and each subject from **finalDataSet**
