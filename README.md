# Getting-and-Cleaning-Data-Week-4

The run_analysis.R code has been written based on the Coursera instruction of this assignment: 

1. Merges the training and the test sets to create one data set. Use command rbind to combine training and test set
2. Extracts only the measurements on the mean and standard deviation for each measurement. Use grep command to get column indexes for variable name contains "mean()" or "std()"
3. Uses descriptive activity names to name the activities in the data set Convert activity labels to characters and add a new column as factor
4. Appropriately labels the data set with descriptive variable names. Give the selected descriptive names to variable columns
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package

Before starting with the assignment, a few steps had to be taken: 
First, creating an R project "Get Clean Week 4"
Second, downloading and unzipping the provided data file into the newly created R project
Then, reading in the training data, the test data, the description of the data and the activity labels
Finally, the assignment mentioned above with the aim to execute an R code to generate a tidy data file

Data description
The variables in the X data are sensor signals measured with a waist-mounted smartphone from 30 subjects
The variable in the Y data indicates the activity type that the subjects performed during recording

Code explaination
The code combines the training set and test set and extracted variables to create another dataset with the averages of each variable for each activity

New dataset
The newly tidydata dataset containes variables calculated based on the mean and standard deviation
Each row is an average of each activity type for all subjects

