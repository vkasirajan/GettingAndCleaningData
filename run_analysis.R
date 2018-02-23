# Clean up a little bit and set working directory.
rm(list = ls())
setwd("C:/Data Science/03 - Obtaining and Cleaning Data/Project")
file.remove("./CodeBook.md")

codebook <- function(...) {
    cat(..., "\n", file = "./CodeBook.md", append = TRUE, sep = "")
}
codebook("# Codebook")
codebook("generated ", as.character(Sys.time()), " while processing `run_analysis.R`")
codebook("")
codebook("")

# Step 0. Load the data set.

codebook("## Process the raw data:")

dataURL = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists('./UCI HAR Dataset.zip'))
{
    codebook("Download zip file: [", dataURL, "](", dataURL, ")")
    download.file(dataURL, './UCI HAR Dataset.zip', mode = 'wb')
    codebook("Extract zip file: UCI HAR Dataset.zip")
    unzip("UCI HAR Dataset.zip", exdir = getwd())
}


codebook("Merging all * _test.txt and * _train.txt files into single dataset:`data.train` ")

features <- read.csv('./UCI HAR Dataset/features.txt', header = FALSE, sep = ' ')
features <- as.character(features[, 2])

data.train.x <- read.table('./UCI HAR Dataset/train/X_train.txt')
data.train.activity <- read.csv('./UCI HAR Dataset/train/y_train.txt', header = FALSE, sep = ' ')
data.train.subject <- read.csv('./UCI HAR Dataset/train/subject_train.txt', header = FALSE, sep = ' ')

data.train <- data.frame(data.train.subject, data.train.activity, data.train.x)
names(data.train) <- c(c('subject', 'activity'), features)

data.test.x <- read.table('./UCI HAR Dataset/test/X_test.txt')
data.test.activity <- read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ')
data.test.subject <- read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ')

data.test <- data.frame(data.test.subject, data.test.activity, data.test.x)
names(data.test) <- c(c('subject', 'activity'), features)


# Step 1. Merges the training and the test sets to create one data set.

codebook("Merge all training and test sets into one single data set")

data.all <- rbind(data.train, data.test)

codebook("Merged data dimensions:", nrow(data.all), " x ", ncol(data.all))

# Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.

mean_std.select <- grep('mean|std', features)
data.sub <- data.all[, c(1, 2, mean_std.select + 2)]
codebook("Subset `data.all` into `data.sub`. Keep key columns and features containing `std` or `mean`, dimensions : ", nrow(data.sub), " x ", ncol(data.sub))

# Step 3. Uses descriptive activity names to name the activities in the data set

activity.labels <- read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)
activity.labels <- as.character(activity.labels[, 2])
data.sub$activity <- activity.labels[data.sub$activity]
codebook("Use descriptive activity names to name the activities in the data set")

# Step 4. Appropriately labels the data set with descriptive variable names.

name.new <- names(data.sub)
name.new <- gsub("[(][)]", "", name.new)
name.new <- gsub("^t", "TimeDomain_", name.new)
name.new <- gsub("^f", "FrequencyDomain_", name.new)
name.new <- gsub("Acc", "Accelerometer", name.new)
name.new <- gsub("Gyro", "Gyroscope", name.new)
name.new <- gsub("Mag", "Magnitude", name.new)
name.new <- gsub("-mean-", "_Mean_", name.new)
name.new <- gsub("-std-", "_StandardDeviation_", name.new)
name.new <- gsub("-", "_", name.new)
names(data.sub) <- name.new

codebook("Appropriately label the data set with descriptive variable names")

#Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

data.tidy <- aggregate(data.sub[, 3:81], by = list(activity = data.sub$activity, subject = data.sub$subject), FUN = mean)
write.table(x = data.tidy, file = "data_tidy.txt", row.names = FALSE)
codebook("* write `data.tidy` to file  `", "data_tidy.txt", " `")
codebook("")
codebook("")
codebook("")


codebook("")
codebook("## `data.sub$activity` variable\n")
codebook("### key columns\n")
codebook("Variable name       | Description")
codebook("--------------------|------------")
codebook("`subject`           | ID of subject, int (1-30)")
codebook("`activity_num`      | ID of activity, int (1-6)")
codebook("`activity_name`     | Label of activity, Factor w/ 6 levels")

codebook("### non-key columns\n")
codebook("Variable name       | Description")
codebook("--------------------|------------")
codebook("`variable`          | comlete name of the feature, Factor w/ 66 levels (eg. tBodyAcc-mean()-X) ")
codebook("`value`             | the actual value, num (range: -1:1)")
codebook("`dimension`         | dimension of measurement, Factor w/ 2 levels: `t` (Time) or `f` (Frequency)")
codebook("`source`            | source of measurement, Factor w/ 3 levels: `Body`,`BodyBody` or `Gravity`")
codebook("`type`              | type of measurement, Factor w/ 2 levels: `Acc` (accelerometer) or `Gyro` (gyroscope)")
codebook("`jerk`              | is 'Jerk' signal , Factor w/ 2 levels:  `Jerk` or `` (non Jerk)")
codebook("`magnitude`         | is 'Magnitude' value , Factor w/ 2 levels:  `Mag` or `` (non Mag)")
codebook("`method`            | result from method , Factor w/ 2 levels:  `mean` (average) or `std` (standard deviation)")
codebook("`axis`              | FFT exrapolated to axis , Factor w/ 2 levels:  `` (no FFT-axis) or `X`, `Y` or `Z`")

codebook("")
codebook("## `data.tidy` variable\n")
codebook("### key columns\n")
codebook("Variable name       | Description")
codebook("--------------------|------------")
codebook("`activity_name`     | Label of activity, Factor w/ 6 levels")
codebook("`subject`           | ID of subject, int (1-30)")


codebook("### non-key columns\n")
codebook("Variable name       | Description")
codebook("--------------------|------------")

tidyDataCols <- names(data.tidy)[3:68]
for (tdc in tidyDataCols) {
    codebook("`", tdc, "`   | the average value for this feature, num (range: -1:1)")
}

codebook("")
codebook("")
