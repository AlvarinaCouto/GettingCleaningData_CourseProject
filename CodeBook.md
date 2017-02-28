#Description
CodeBook shows the additional information about the data, variables and work that was performed to clean up the data. 
<br>    
        
#About the data      
    
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.           
           
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.     
       
A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones          
<br><br>     
        
##**For each record it is provided:**          
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.          
- Triaxial Angular velocity from the gyroscope.           
- A 561-feature vector with time and frequency domain variables.           
- Its activity label.           
- An identifier of the subject who carried out the experiment.          
<br><br>     
          
##**Files from source data**          
- 'features_info.txt': Shows information about the variables used on the feature vector.          
- 'features.txt': List of all features.          
- 'activity_labels.txt': Links the class labels with their activity name.          
- 'train/X_train.txt': Training set.          
- 'train/y_train.txt': Training labels.          
- 'test/X_test.txt': Test set.          
- 'test/y_test.txt': Test labels.          
The following files are available for the train and test data. Their descriptions are equivalent.           
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.           
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.           
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.           
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.           
<br><br>    
     
#**Description about the work that was performed to clean up the data**          
1. Training and the test sets were merged by rows; outputs are x_data, y_data and subject_data.     
2. Measurements on the mean and standard deviation for each measurement were extracted. Here, was retain only features of mean and standard deviation and then was corrected the column names of x_data using the correct names present in features, and stored in mean_std_features.         
3. Descriptive activity names were used to name the activities in y_data.      
4. All data (x_data, y_data, subject_data) were merged in one, big dataset, called all_data.    
5. The output desired (tidydata.txt dataset), with the average of each variable for each activity and each subject was created.        
<br><br>        
        