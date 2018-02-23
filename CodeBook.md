# Codebook
generated 2018-02-22 23:15:10 while processing `run_analysis.R`


## Process the raw data:
Merging all * _test.txt and * _train.txt files into single dataset:`data.train` 
Merge all training and test sets into one single data set
Merged data dimensions:10299 x 563
Subset `data.all` into `data.sub`. Keep key columns and features containing `std` or `mean`, dimensions : 10299 x 81
Use descriptive activity names to name the activities in the data set
Appropriately label the data set with descriptive variable names
* write `data.tidy` to file  `data_tidy.txt `




## `data.sub$activity` variable

### key columns

Variable name       | Description
--------------------|------------
`subject`           | ID of subject, int (1-30)
`activity_num`      | ID of activity, int (1-6)
`activity_name`     | Label of activity, Factor w/ 6 levels
### non-key columns

Variable name       | Description
--------------------|------------
`variable`          | comlete name of the feature, Factor w/ 66 levels (eg. tBodyAcc-mean()-X) 
`value`             | the actual value, num (range: -1:1)
`dimension`         | dimension of measurement, Factor w/ 2 levels: `t` (Time) or `f` (Frequency)
`source`            | source of measurement, Factor w/ 3 levels: `Body`,`BodyBody` or `Gravity`
`type`              | type of measurement, Factor w/ 2 levels: `Acc` (accelerometer) or `Gyro` (gyroscope)
`jerk`              | is 'Jerk' signal , Factor w/ 2 levels:  `Jerk` or `` (non Jerk)
`magnitude`         | is 'Magnitude' value , Factor w/ 2 levels:  `Mag` or `` (non Mag)
`method`            | result from method , Factor w/ 2 levels:  `mean` (average) or `std` (standard deviation)
`axis`              | FFT exrapolated to axis , Factor w/ 2 levels:  `` (no FFT-axis) or `X`, `Y` or `Z`

## `data.tidy` variable

### key columns

Variable name       | Description
--------------------|------------
`activity_name`     | Label of activity, Factor w/ 6 levels
`subject`           | ID of subject, int (1-30)
### non-key columns

Variable name       | Description
--------------------|------------
`TimeDomain_BodyAccelerometer_Mean_X`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyAccelerometer_Mean_Y`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyAccelerometer_Mean_Z`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyAccelerometer_StandardDeviation_X`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyAccelerometer_StandardDeviation_Y`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyAccelerometer_StandardDeviation_Z`   | the average value for this feature, num (range: -1:1)
`TimeDomain_GravityAccelerometer_Mean_X`   | the average value for this feature, num (range: -1:1)
`TimeDomain_GravityAccelerometer_Mean_Y`   | the average value for this feature, num (range: -1:1)
`TimeDomain_GravityAccelerometer_Mean_Z`   | the average value for this feature, num (range: -1:1)
`TimeDomain_GravityAccelerometer_StandardDeviation_X`   | the average value for this feature, num (range: -1:1)
`TimeDomain_GravityAccelerometer_StandardDeviation_Y`   | the average value for this feature, num (range: -1:1)
`TimeDomain_GravityAccelerometer_StandardDeviation_Z`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyAccelerometerJerk_Mean_X`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyAccelerometerJerk_Mean_Y`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyAccelerometerJerk_Mean_Z`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyAccelerometerJerk_StandardDeviation_X`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyAccelerometerJerk_StandardDeviation_Y`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyAccelerometerJerk_StandardDeviation_Z`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscope_Mean_X`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscope_Mean_Y`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscope_Mean_Z`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscope_StandardDeviation_X`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscope_StandardDeviation_Y`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscope_StandardDeviation_Z`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscopeJerk_Mean_X`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscopeJerk_Mean_Y`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscopeJerk_Mean_Z`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscopeJerk_StandardDeviation_X`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscopeJerk_StandardDeviation_Y`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscopeJerk_StandardDeviation_Z`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyAccelerometerMagnitude_mean`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyAccelerometerMagnitude_std`   | the average value for this feature, num (range: -1:1)
`TimeDomain_GravityAccelerometerMagnitude_mean`   | the average value for this feature, num (range: -1:1)
`TimeDomain_GravityAccelerometerMagnitude_std`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyAccelerometerJerkMagnitude_mean`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyAccelerometerJerkMagnitude_std`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscopeMagnitude_mean`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscopeMagnitude_std`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscopeJerkMagnitude_mean`   | the average value for this feature, num (range: -1:1)
`TimeDomain_BodyGyroscopeJerkMagnitude_std`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometer_Mean_X`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometer_Mean_Y`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometer_Mean_Z`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometer_StandardDeviation_X`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometer_StandardDeviation_Y`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometer_StandardDeviation_Z`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometer_meanFreq_X`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometer_meanFreq_Y`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometer_meanFreq_Z`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometerJerk_Mean_X`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometerJerk_Mean_Y`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometerJerk_Mean_Z`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometerJerk_StandardDeviation_X`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometerJerk_StandardDeviation_Y`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometerJerk_StandardDeviation_Z`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometerJerk_meanFreq_X`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometerJerk_meanFreq_Y`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyAccelerometerJerk_meanFreq_Z`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyGyroscope_Mean_X`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyGyroscope_Mean_Y`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyGyroscope_Mean_Z`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyGyroscope_StandardDeviation_X`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyGyroscope_StandardDeviation_Y`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyGyroscope_StandardDeviation_Z`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyGyroscope_meanFreq_X`   | the average value for this feature, num (range: -1:1)
`FrequencyDomain_BodyGyroscope_meanFreq_Y`   | the average value for this feature, num (range: -1:1)


