# Project for Getting and Cleaning Data Course 

library(plyr)
library(reshape2)

# Read the Activity files
activityTest = read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
activityTrain = read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
activityLabels = read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE);

# Read the Feature files
featureTest = read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
featureTrain = read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
features = read.table('./UCI HAR Dataset/features.txt',header=FALSE);

# Read the Subject files
subjectTest = read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
subjectTrain = read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

# Please note that I perform step 3 and 4 first, then back to 2 and then 1.  This is because of efficiency, I found the program to run faster 
# this way as I remove the unwanted columns then perform the merging will reduce the effort required for merging the dataframe.
## 3.Uses descriptive activity names to name the activities in the data set
# here I name the activities in activityTest and activityTrain with the activityLabels
#   then store into the List ActivityTestList and ActivityTrainList
ActivityTestList<-factor(activityTest$V1,labels=activityLabels$V2)
ActivityTrainList<-factor(activityTrain$V1,labels=activityLabels$V2)

## 4.Appropriately labels the data set with descriptive variable names. 
# following command take from features to set as the variable name for featureTest and featureTrain
colnames(featureTest)<-features[,2]
colnames(featureTrain)<-features[,2]
colnames(subjectTest)=c("Subject")
colnames(subjectTrain)=c("Subject")

## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
featureTest<-featureTest[,grepl("mean()",names(featureTest),fixed=TRUE)|grepl("std()",names(featureTest),fixed=TRUE)]
featureTrain<-featureTrain[,grepl("mean()",names(featureTrain),fixed=TRUE)|grepl("std()",names(featureTrain),fixed=TRUE)]

## 1.Merges the training and the test sets to create one data set (AllData)
TrainData<-cbind(subjectTrain,featureTrain)
TestData<-cbind(subjectTest,featureTest)
TrainData$Activity=ActivityTrainList
TestData$Activity=ActivityTestList

AllData<-rbind(TrainData,TestData)

## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
meltedData<-melt(AllData,id=c("Subject", "Activity"),variable.name = "Feature", value.name = "Value")
tidyData<-ddply(meltedData,c("Subject","Activity","Feature"), summarise, mean=mean(Value))

## Finally, write to text file
write.table(tidyData, file = "./tidyData.txt", row.name=FALSE )


