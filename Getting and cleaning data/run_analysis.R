
# Downloading the data
setwd("~")
if(file.exist("data_coursera.zip")) file.remove("data_coursera.zip")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="data_coursera.zip")
unzip("data_coursera.zip")
setwd("UCI HAR Dataset")

# 1. Merges the training and the test sets to create one data set.
test_X_set <- read.table("test/X_test.txt", dec=".", header=F)
test_y_set <- read.table("test/y_test.txt", dec=".", header=F)
test_subject_set <- read.table("test/subject_test.txt", dec=".", header=F)

train_X_set <- read.table("train/X_train.txt", dec=".", header=F)
train_y_set <- read.table("train/y_train.txt", dec=".", header=F)
train_subject_set <- read.table("train/subject_train.txt", dec=".", header=F)

X_set <- rbind(train_X_set, test_X_set)
y_set <- rbind(train_y_set, test_y_set)
subject_set <- rbind(train_subject_set, test_subject_set)



# Removing files from your computer
file.remove("data_coursera.zip")
unlink("UCI HAR Dataset", recursive=T)




