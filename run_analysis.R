#Get the data     

##Download dataset file    
datafile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(datafile, destfile = "UCI-HAR-dataset.zip", method="curl")
# unzip file
unzip('./UCI-HAR-dataset.zip') 

################################################################
# Merges the training and the test sets to create one data set.#      
################################################################
##Read data      
x_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')

x_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
subject_test <-read.table('./UCI HAR Dataset/test/subject_test.txt')

## Merge data by rows
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

##########################################################################################
# Extracts only the measurements on the mean and standard deviation for each measurement.#
##########################################################################################
## Read features.txt
features <- read.table('./UCI HAR Dataset/features.txt')

## Retain only features of mean and standard deviation
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# correct column names of x_data
x_data <- x_data[, mean_std_features]
names(x_data) <- features[mean_std_features, 2]


#########################################################################
# Uses descriptive activity names to name the activities in the data set#
#########################################################################
## Read descriptive activity names from activity_labels.txt
activities <- read.table('./UCI HAR Dataset/activity_labels.txt')

# correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name of y_data
names(y_data) <- "activity"


#####################################################################
# Appropriately labels the data set with descriptive activity names.#
#####################################################################
# correct column name
names(subject_data) <- "subject"

# merge all data in one data set
all_data <- cbind(x_data, y_data, subject_data)

##################################################################################################################################################
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.#
##################################################################################################################################################
library(plyr)

averages <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

## write tidy data file
write.table(averages, "tidydata.txt", row.name=FALSE)

