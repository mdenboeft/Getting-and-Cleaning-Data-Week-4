# Reading in the training data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Reading in the test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Reading the description of the data and activity labels 
variable_names <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# 1. Merging the training set and test set to create one data set
X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
Subject_total <- rbind(Subject_train, Subject_test)

# 2. Extracting only the measurements on the mean and standard deviation for each measurement
Selected_variables <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_total_new <- X_total[,Selected_variables[,1]]

# 3. Using descriptive activity names to name the activities in the data set
colnames(Y_total) <- "activity"
Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_total[,-1]

# 4. Appropriately labeling the data set with descriptive variable names
colnames(X_total_new) <- variable_names[Selected_variables[,1],2]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(Subject_total) <- "subject"
total <- cbind(X_total_new, activitylabel, Subject_total)
library(dplyr)
library(magrittr)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarise_all(funs(mean))
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
