GettingandCleaningData
======================

Course project for getting and cleaning data

Description

The data cleansing script (run_analysis.R) performs the following tasks:
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Process

Run the script with the R file:  run_analysis.R.
The script creates a tidy dataset is in this repository : finaldata.txt. 
This file contains one row for each subject/activity unique combination and columns for the average of all mean and standard deviation features.

Code Book

The following average features are included in the output file for each subject/activity:
tBodyAcc-mean()-Y                  
tBodyAcc-std()-X                  
tBodyAcc-std()-Z                   
tGravityAcc-mean()-Y                
tGravityAcc-std()-X                 
tGravityAcc-std()-Z                 
tBodyAccJerk-mean()-Y               
tBodyAccJerk-std()-X                
tBodyAccJerk-std()-Z                
tBodyGyro-mean()-Y                  
tBodyGyro-std()-X                   
tBodyGyro-std()-Z                   
tBodyGyroJerk-mean()-Y              
tBodyGyroJerk-std()-X               
tBodyGyroJerk-std()-Z               
tBodyAccMag-std()                   
tGravityAccMag-std()                
tBodyAccJerkMag-std()               
tBodyGyroMag-std()                  
tBodyGyroJerkMag-std()              
fBodyAcc-mean()-Y                   
fBodyAcc-std()-X                    
fBodyAcc-std()-Z                    
fBodyAcc-meanFreq()-Y               
fBodyAccJerk-mean()-X               
fBodyAccJerk-mean()-Z               
fBodyAccJerk-std()-Y                
fBodyAccJerk-meanFreq()-X           
fBodyAccJerk-meanFreq()-Z           
fBodyGyro-mean()-Y                  
fBodyGyro-std()-X                   
fBodyGyro-std()-Z                   
fBodyGyro-meanFreq()-Y              
fBodyAccMag-mean()                  
fBodyAccMag-meanFreq()              
fBodyBodyAccJerkMag-std()           
fBodyBodyGyroMag-mean()             
fBodyBodyGyroMag-meanFreq()         
fBodyBodyGyroJerkMag-std()          
angle(tBodyAccMean,gravity)         
angle(tBodyGyroMean,gravityMean)    
angle(X,gravityMean)                
angle(Z,gravityMean)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable.
