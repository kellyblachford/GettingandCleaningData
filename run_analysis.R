##Create one R script called run_analysis.R that does the following 
##1.  Merges the training and the test sets to create one data set.
##2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
##3.	Uses descriptive activity names to name the activities in the data set
##4.	Appropriately labels the data set with descriptive variable names. 
##5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##reads training data set, adds labels and subject variables
trainX = read.table("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
trainY = read.table("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
trainS = read.table("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

##reads testing data set, adds labels and subject variables
testX = read.table("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testY = read.table("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
testS = read.table("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

##reads activity labels 
activity = read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

##reads features
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

##sets the testX and trainX column names equal to the features: adds the column headers
names(testX) = features
names(trainX) = features


##subset the feature variable columns logically with mean and standard deviation measures
subfeatures <- grepl(".*mean.*|.*std.*|.*Mean.*|.*Std.*", features)

##Subset the testX and trainX data by mean and std dev measures
subtestX = testX[,subfeatures]
subtrainX = trainX[,subfeatures]

##Add activity column names to testY and trainY
testY[,2] = activity[testY[,1]]
names(testY) = c("ActivityID", "ActivityName")
trainY[,2] = activity[trainY[,1]]
names(trainY) = c("ActivityID", "ActivityName")

##Add subject column name to testS and trainS
names(testS) = "Subject"
names(trainS) = "Subject"

##CBind the activity, subject and data for test and train
test <- cbind(testS,testY, subtestX)
train <- cbind(trainS,trainY, subtrainX)

##RBind test and train data
alldata <- rbind(train, test)

##transform data so that there is only 1 measure in each row
idnames = c("Subject", "ActivityID", "ActivityName")
measurenames = setdiff(colnames(alldata), idnames)
meltalldata = melt(alldata, id = idnames, measure.vars = measurenames)

##Apply mean function to meltalldata measure
finaldata   = dcast(meltalldata, Subject + ActivityName ~ variable, mean)

##Write out table of tidydata to 
write.table(finaldata, file = "finaldata.txt", row.name=FALSE)


