---
title: "Code book for run_analysis.R"
author: "Thomas How"
date: "Sunday, January 25, 2015"
output: html_document
---

# Objective of project
The objective of run_analysis.R program is to perform formatting or cleaning on the data collected from the accelerometers from the Samsung Galaxy S smartphone.  The steps is the program including
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Columns of the tidyData.txt
The text file has the following columns:
* Subject - An identifier of the subject who carried out the experiment
* Activity - One of the six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) performed by the volunteers involve in the experiment while wearing a smartphone (Samsung Galaxy S II) on the waist (when measurement was taken).
* Feature - The information about the variables used on the feature vector 
* mean - The mean of the value of the Feature across the Subject and Activity