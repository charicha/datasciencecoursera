# run_analysis.R
#
# Date: 6/16/15
#
# This script performs the following:
# 1. Merges the training and test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard 
#    deviation for each measurement.
# 3. Uses descriptive activity names to name the activities
#    in the data set.
# 4. Appropriately labels the data set with descriptive
#    variable names.
# 5. From the data set in step 4, creates a second, indepen-
#    dent tidy data set with the average of each variable for
#    each activity and each subject.

library(dplyr)
# set working directory
# setwd("~/R/Data/UCI HAR Dataset/")

# 1. Merge training and test sets

     # import training data 
subject_train <- read.table("./train/subject_train.txt", sep="")
y_train <- read.table("./train/y_train.txt", sep="")
X_train <- read.table("./train/X_train.txt", sep="")

train <- cbind(subject_train, y_train, X_train)

# 4. Appropriately labels the data set with descriptive variable names.

features <- read.table("./features.txt", sep="", as.is=TRUE)
features <- features[,2]
trainNames <- c("SubjectID", "activitylabel", features)
names(train) <- trainNames

     # import test data 
subject_test <- read.table("./test/subject_test.txt", sep="")
y_test <- read.table("./test/y_test.txt", sep="")
X_test <- read.table("./test/X_test.txt", sep="")

test <- cbind(subject_test, y_test, X_test)

testNames <- c("SubjectID", "activitylabel", features)
names(test) <- testNames

     # merge training and test data sets
merged <- rbind(train,test)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.

merged_main <- cbind(merged[,1:2], merged[, grep("mean|std", colnames(merged), value=TRUE)])
merged_main <- merged_main[ !duplicated(names(merged_main))]   # to ensure no dupe columns

# 3. Use descriptive activity names to name the activities in the data set.

activity_labels <- read.table("./activity_labels.txt", sep="")
names(activity_labels) <- c("activitylabel", "activity")
merged_main_withlabels <- merge(activity_labels, merged_main, by.x="activitylabel", by.y="activitylabel", all=TRUE)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for
#    each activity and each subject.

x1 <- cbind(merged_main_withlabels[,1:3], 
            merged_main_withlabels[, grep("mean", colnames(merged_main_withlabels), value=TRUE)])
