
library(dplyr)

# 0. Download, extract and load the data sets.

# Downloading the data
setwd("~")
if(file.exist("data_coursera.zip")) file.remove("data_coursera.zip")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="data_coursera.zip")

# Extract
unzip("data_coursera.zip")
setwd("UCI HAR Dataset")

# Load
test_X_set <- read.table("test/X_test.txt", dec=".", header=F)
test_y_set <- read.table("test/y_test.txt", dec=".", header=F)
test_subject_set <- read.table("test/subject_test.txt", dec=".", header=F)

train_X_set <- read.table("train/X_train.txt", dec=".", header=F)
train_y_set <- read.table("train/y_train.txt", dec=".", header=F)
train_subject_set <- read.table("train/subject_train.txt", dec=".", header=F)

# 1. Merges the training and the test sets to create one data set.
X_set <- rbind(train_X_set, test_X_set)
y_set <- rbind(train_y_set, test_y_set)
subject_set <- rbind(train_subject_set, test_subject_set)

X_set <- X_set %>% mutate(subject = as.numeric(subject_set$V1)) # Useful for Q5

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt", dec=".", header=F)
to_extract <- grep("mean|std", as.character(features$V2))
X_set_filt <- X_set[,c(to_extract, ncol(X_set))]

# 3.Uses descriptive activity names to name the activities in the data set.
activities <- read.table("activity_labels.txt", header=F, stringsAsFactors = F)
activities_set <- y_set %>% left_join(activities, by="V1") # Left join to keep the order of y_set
X_set_filt <- X_set_filt %>% mutate(activities = as.character(activities_set$V2))
head(X_set_filt) # Checking activites are added

#4. Appropriately labels the data set with descriptive variable names.
names(X_set_filt)[1:79] <- as.character(features$V2[to_extract])
head(X_set_filt) # Checking names are added

#5. From the data set in step 4, creates a second, independent tidy data set
#  with the average of each variable for each activity and each subject.
X_set_summary <- X_set_filt %>% group_by(subject, activities) %>% summarize_each(funs(mean))

# Removing files and data from your computer
rm(list=ls(all=TRUE)) # Be careful with this instruction, delete everything in R workspace
gc()
file.remove("data_coursera.zip")
unlink("UCI HAR Dataset", recursive=T)




