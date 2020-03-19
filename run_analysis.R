# install this library that allows flexible grammar of data manipulation
library(dplyr)

# download dataset
filename <- "mydata6.zip"
if (!file.exists(filename)){
    URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(URL, filename, method="curl")
}

# cheking if folder exists. if folder does exist unzip dataset
if (!file.exists("UCI HAR Dataset")) {
    unzip(filename)
}

# Reads a file in table format and creates a data frame from it, with cases corresponding to lines and variables to fields in the file.
# Set the row or column names
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
print(x_test)
print(y_test)
print(x_train)
print(y_train)

# binding data sets
# taking data frame arguments and combining it by rows (rbind) and  columns (cbind) respectivelly
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
# merging data sets X, Y
Merged_Data <- cbind(Subject, Y, X)
print(Merged_Data)


# Choose or rename variables from a tbl that keeps only the variables mentioned
# getting mean and standard deviation
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

# renaming activities in data table
TidyData$code <- activities[TidyData$code, 2]
print(TidyData$code)

# labeling data
# perform replacement of the  all matches
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))


# creating tidy data set
FinalData <- TidyData %>%
# takes an existing tbl and converts it into a grouped tbl where operations are performed (group_by)
    group_by(subject, activity) %>%
# apply the same transformation to multiple variables
    summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)

# variable names
# compactly display the contents of lists.
str(FinalData)

# final data
FinalData
print(FinalData)

