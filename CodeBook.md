---
title: "Human Activity Recognition Using Smartphones Data Set"
output: html_document
---

# Summary of data set information:
 Experiment with 30 participants, age [19-48] years. 
 
 Experiments is consisting of six activities:
 
  - walking
  
  - waling upstairs
  
  - walking downstairs
  
  - sitting
  
  - standing
  
  - laying
  
  Activities were recorded wearing a smarthphone on the waist.
  
  The linear acceleration and angular velocity was measured at 50Hz frequency using accelerometer and gyroscope.
  
  Each recorded measurement in the dataset provides:
  
  - acceleration from the accelerometer and the estimated body acceleration
  
  - angular velocity from gyroscope
  
  - vector with 561 features with time and frequency domain variables
  
  - recorded activity name
  
  - identifyier of a subject in the experiment
  
  

# run_analysis.R

1. Downloading data sets (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to the folder __"UCI HAR Dataset"__ .

2. Assigning data to variables:

    - __features <- read.table("UCI HAR Dataset/features.txt")__     (database from the accelerometer and gyroscope 3axial raw signals tAcc-XYZ and tGyro-XYZ)
    - __activities <- read.table("UCI HAR Dataset/activity_labels.txt"__        (data of measurments during activities)
    - __subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt"__        (subject test data)
    - __subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt"__     (subjects train data)
    - __x_test <- read.table("UCI HAR Dataset/test/X_test.txt"__        (features of test data)
    - __y_test <- read.table("UCI HAR Dataset/test/y_test.txt"__        (test data of activities)
    - __x_train <- read.table("UCI HAR Dataset/train/X_train.txt"__     (features of train data)
    - __y_train <- read.table("UCI HAR Dataset/train/y_train.txt"__   (train data of activities)
    

3. Merges the training and the test sets to create one single data set __Merged_data__ :

    - __X__     (created merging __x_train__ and __x_test__ with __rbind__)
    - __Y__     (created merging __y_train__ and __y_test__ with __rbind__)
    - __subject__       (created merging __subject_train__ and __subject_test__ with __rbind__)
    - __Merged_data__        (created merging __X__, __Y__ , __subject__ with __cbind__)

4. Extracts only the measurements of the mean (__mean__) and standard deviation (__std__) for each measurement:

    - __TidyData__      (created with subsetting merged data (__Merged_Data__) and selecting columns: __subject__, __code__,  __contains("mean")__, __contains("std")__)

5. Uses descriptive activity names to name the activities in the data set:

    - values in code of __TidyData__ replaced by activities from activities variable of 2nd column

6. Appropriately labels the data set with descriptive variable names.

7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and subject.

8.  __FinalData__     (created by summarizing __TidyData__ by taking __mean__ of each variable in each __activity__ and __subject__ and grouped respectivelly).
