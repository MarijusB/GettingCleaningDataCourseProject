---
title: "CodeBook"
output: html_document
---



# "run_analysis.R"

1. Downloading data sets to the folder __"UCI HAR Dataset"__ .

2. Assigning data to variables:

    - __features <- read.table("UCI HAR Dataset/features.txt")__     (database from the accelerometer and gyroscope 3axial raw signals tAcc-XYZ and tGyro-XYZ)
    - __activities <- read.table("UCI HAR Dataset/activity_labels.txt"__        (activities during measurements taking)
    - __subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt"__        (subject test data)
    - __subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt"__     (subjects train data)
    - __x_test <- read.table("UCI HAR Dataset/test/X_test.txt"__        (features test data)
    - __y_test <- read.table("UCI HAR Dataset/test/y_test.txt"__        (test data of activities)
    - __x_train <- read.table("UCI HAR Dataset/train/X_train.txt"__     (features train data)
    - __y_train <- read.table("UCI HAR Dataset/train/y_train.txt"__   (train data of activities)
    

3. Merges the training and the test sets to create one data set:

    - __X__     (created merging __x_train__ and __x_test__ with __rbind__)
    - __Y__     (created merging __y_train__ and __y_test__ with __rbind__)
    - __subject__       (created merging __subject_train__ and __subject_test__ with __rbind__)
    - __Merge_data__        (created merging __X__, __Y__ , __subject__ with __cbind__)

4. Extracts only the measurements of the mean and standard deviation for each measurement:

    - __TidyData__      (created with subsetting Merged_Data and selecting columns: subject, code,  contains("mean"), contains("std"))

5. Uses descriptive activity names to name the activities in the data set:

    - values in code of __TidyData__ replaced by activities from activities variable of 2nd column

6. Appropriately labels the data set with descriptive variable names.

7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and subject.

8.  __FinalData__     (created by summarizing __TidyData__ by taking mean of each variable in each activity and subject and grouped respectivelly).
