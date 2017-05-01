
# Downloading the data
if(file.exist("data_coursera.zip")) file.remove("data_coursera.zip")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="data_coursera.zip")
unzip("data_coursera.zip")
setwd("UCI HAR Dataset")

train_set <- read.csv("")
test_set <- read.csv("")




# Removing files from your computer
file.remove("data_coursera.zip")
unlink("UCI HAR Dataset", recursive=T)
