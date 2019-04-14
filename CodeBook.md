# Code Book

This Code Book explains the variables and types (meta data) of the data and transformations done to the raw data prior analysis.

## Data collection

The raw data-set can be obtained from:   
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Raw data collection process is quoted here from the source README.txt file for ease of reference:
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


## Pre-processing
  
> The sensor signals (accelerometer and gyroscope) were *pre-processed* by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.


## Processing

The raw data was merged using `cbind()` and sanitized to obtain a tidy date-set, from which only the mean() and std() values were extracted. Grouping of the resulting data-set
was performed using `split()` based on `subject` and `activity` and the resulting independant tidy dataset was obtained by calling `colMeans()` for each group using `lapply()`. See [README.md](./README.md) for details on script execution.



## Transformations

Original variables from the raw data-set found in [features.txt](./features.txt) went through a tidying process as per Week 4 lecture of Getting and Cleaning data, summarized here:

1. Names of variables should be:
   * All lower case when possible
   * Descriptive
   * Not duplicated
   * Not have underscores, dots or whitespaces (or punctuation marks)

2. Variables with character values:
   * Should usually be made info factors
   * Should be descriptive


Specifically, this means:  

1. column names have been made lower-cased
2. commas and underscores have been dropped (this includes the text values in column `activity`)
3. function names as [described here](./features_info.txt) have been replaced with their *descriptive* names (std() to 'StandardDeviation')
4. domain measurement prefixes 'f' and 't' have been replaced with 'frequency' and 'time' respectively
5. shorthands as Acc have been replaced with more descriptive names ie. 'acceleration'


For the purposed of this project *only mean and standard deviation* values have been extracted from the merged and tidyed dataset obtained by a process describer in the [README.md](./README.md)

## Variables
Provided is the list of sanitized variable names as they appear in independent_tidy_data.csv  
The listing is split for better readability.

| Variable name | Variable position | Variable                     | Values and notes        |
| ------------- | -----------------:| ---------------------------- | ----------------------- |
| subject | 1 | numeric | The id of the test subject. The independant tidy dataset contains subjects `1` to `30` |
| activity| 2 | factor  | The actual activity being performed during the experiament. Possible values are: `sitting`, `walking`, `walkingupstairs`, `walkingdownstairs`, `laying`, `standing` |


## Variables (cont.)

| Variable name | Variable position | Variable                     | Units                   |
| ------------- | -----------------:| ---------------------------- | ----------------------- |
|timebodyaccelerationmeanx | 3 |numeric|G|
|timebodyaccelerationmeany | 4 |numeric|G|
|timebodyaccelerationmeanz | 5 |numeric|G|
|timebodyaccelerationstandarddeviationx | 6 |numeric|G|
|timebodyaccelerationstandarddeviationy | 7 |numeric|G|
|timebodyaccelerationstandarddeviationz | 8 |numeric|G|
|timegravityaccelerationmeanx | 9  |numeric|G|
|timegravityaccelerationmeany | 10  |numeric|G|
|timegravityaccelerationmeanz | 11  |numeric|G|
|timegravityaccelerationstandarddeviationx | 12  |numeric|G|
|timegravityaccelerationstandarddeviationy | 13  |numeric|G|
|timegravityaccelerationstandarddeviationz | 14  |numeric|G|
|timebodyaccelerationjerkmeanx | 15  |numeric|m/s<sup>3</sup>|
|timebodyaccelerationjerkmeany | 16  |numeric|m/s<sup>3</sup>|
|timebodyaccelerationjerkmeanz | 17  |numeric|m/s<sup>3</sup>|
|timebodyaccelerationjerkstandarddeviationx | 18  |numeric|m/s<sup>3</sup>|
|timebodyaccelerationjerkstandarddeviationy | 19  |numeric|m/s<sup>3</sup>|
|timebodyaccelerationjerkstandarddeviationz | 20  |numeric|m/s<sup>3</sup>|
|timebodygyromeanx | 21  |numeric|G|
|timebodygyromeany | 22  |numeric|G|
|timebodygyromeanz | 23  |numeric|G|
|timebodygyrostandarddeviationx | 24  |numeric|G|
|timebodygyrostandarddeviationy | 25  |numeric|G|
|timebodygyrostandarddeviationz | 26  |numeric|G|
|timebodygyrojerkmeanx | 27  |numeric|m/s<sup>3</sup>|
|timebodygyrojerkmeany | 28  |numeric|m/s<sup>3</sup>|
|timebodygyrojerkmeanz | 29  |numeric|m/s<sup>3</sup>|
|timebodygyrojerkstandarddeviationx | 30  |numeric|m/s<sup>3</sup>|
|timebodygyrojerkstandarddeviationy | 31  |numeric|m/s<sup>3</sup>|
|timebodygyrojerkstandarddeviationz | 32  |numeric|m/s<sup>3</sup>|
|timebodyaccelerationmagnitudemean | 33  |numeric|G|
|timebodyaccelerationmagnitudestandarddeviation | 34  |numeric|G|
|timegravityaccelerationmagnitudemean | 35  |numeric|G|
|timegravityaccelerationmagnitudestandarddeviation | 36  |numeric|G|
|timebodyaccelerationjerkmagnitudemean | 37  |numeric|m/s<sup>3</sup>|
|timebodyaccelerationjerkmagnitudestandarddeviation | 38  |numeric|m/s<sup>3</sup>|
|timebodygyromagnitudemean | 39  |numeric|G|
|timebodygyromagnitudestandarddeviation | 40  |numeric|G|
|timebodygyrojerkmagnitudemean | 41  |numeric|m/s<sup>3</sup>|
|timebodygyrojerkmagnitudestandarddeviation | 42  |numeric|m/s<sup>3</sup>|
|frequencybodyaccelerationmeanx | 43  |numeric|G|
|frequencybodyaccelerationmeany | 44  |numeric|G|
|frequencybodyaccelerationmeanz | 45  |numeric|G|
|frequencybodyaccelerationstandarddeviationx | 46  |numeric|G|
|frequencybodyaccelerationstandarddeviationy | 47  |numeric|G|
|frequencybodyaccelerationstandarddeviationz | 48  |numeric|G|
|frequencybodyaccelerationjerkmeanx | 49  |numeric|m/s<sup>3</sup>|
|frequencybodyaccelerationjerkmeany | 50  |numeric|m/s<sup>3</sup>|
|frequencybodyaccelerationjerkmeanz | 51  |numeric|m/s<sup>3</sup>|
|frequencybodyaccelerationjerkstandarddeviationx | 52  |numeric|m/s<sup>3</sup>|
|frequencybodyaccelerationjerkstandarddeviationy | 53  |numeric|m/s<sup>3</sup>|
|frequencybodyaccelerationjerkstandarddeviationz | 54  |numeric|m/s<sup>3</sup>|
|frequencybodygyromeanx | 55  |numeric|G|
|frequencybodygyromeany | 56  |numeric|G|
|frequencybodygyromeanz | 57  |numeric|G|
|frequencybodygyrostandarddeviationx | 58  |numeric|G|
|frequencybodygyrostandarddeviationy | 59  |numeric|G|
|frequencybodygyrostandarddeviationz | 60  |numeric|G|
|frequencybodyaccelerationmagnitudemean | 61  |numeric|G|
|frequencybodyaccelerationmagnitudestandarddeviation | 62  |numeric|G|
|frequencybodybodyaccelerationjerkmagnitudemean | 63  |numeric|m/s<sup>3</sup>|
|frequencybodyaccjerkmagnitudestandarddeviation | 64  |numeric|m/s<sup>3</sup>|
|frequencybodybodygyromagnitudemean | 65  |numeric|G|
|frequencybodybodygyromagnitudestandarddeviation | 66  |numeric|G|
|frequencybodybodygyrojerkmagnitudemean | 67  |numeric|m/s<sup>3</sup>|
|frequencybodybodygyrojerkmagnitudestandarddeviation | 68  |numeric|m/s<sup>3</sup>|

The raw data excerpt is quoted here for convenience.
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

See original [features_info.txt](./features_info.txt) for details.
