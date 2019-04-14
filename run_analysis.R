################################################################################
##
##              John Hopkins Data Science Specialization via Coursera
##
##                      Getting and cleaning data Course project
##                 
################################################################################
## Check working directory to be sure where data files are saved & change as required if necessary.
getwd()
setwd("C:/Users/ehaso/Documents/R/data/UCI HAR Dataset")
## Clear global variables to free memory
rm( list=ls() )


## Assign the default data directory
##
data_directory <- 'UCI HAR Dataset'

#Check if folders exixt
if( dir.exists( "train" ) & dir.exists( "test" ) ){
  data_directory <- '.'
}


## 1. Merges the training and the test sets to create one data set. ############


## Load training data *sample of 10 rows* to determine column classes.
## This considerably speeds-up the loadtime.
##
train_x <- read.table( file.path( data_directory, "train", "X_train.txt" ), nrows=10, comment.char="" )


## Load training data - complete dataset
##
train_x <- read.table (
  file.path( data_directory, "train", "X_train.txt" ),
  header       = FALSE,
  dec          = ".",
  fill         = TRUE,
  comment.char = "",
  colClasses   = sapply( train_x, class )
)


## Load test data - sample
##
test_x <- read.table(
  file.path( data_directory, "test", "X_test.txt" ),
  nrows=10,
  comment.char=""
)


## Load training data - complete dataset
##
test_x <- read.table (
  file.path( data_directory, "test", "X_test.txt" ),
  header       = FALSE,
  dec          = ".",
  fill         = TRUE,
  comment.char = "",
  colClasses   = sapply( test_x, class )
)



## Merge train with test
##
x <- rbind( train_x, test_x )

## These are no longer needed. Free-up memory.
rm( train_x, test_x )



## Merge activities.
##
train_y <- read.table ( file.path( data_directory, "train", "y_train.txt" ) )
test_y <- read.table ( file.path( data_directory, "test", "y_test.txt" ) )
y <- rbind( train_y, test_y )
names( y )[1] <- "activity"
rm( train_y, test_y )



## Merge subjects
##
train_subj <- read.table(file.path(data_directory,"train","subject_train.txt"))
test_subj <- read.table(file.path(data_directory, "test", "subject_test.txt" ))

subjects <- rbind( train_subj, test_subj )
rm( train_subj, test_subj )




##
## 2. Extracts the measurements on mean and standard deviation #################
##


## Load features
features <- read.table(
  file.path( data_directory, 'features.txt' ),
  col.names = c( 'id', 'name' )
)


## Exstract only the std() and mean() columns
data <- x[, grep( 'std\\(\\)|mean\\(\\)', features[,2] )]
rm( x )

## Create a vector of names to tidy-up
sanitized_names = grep( 'std\\(\\)|mean\\(\\)', features[,2], value=TRUE )


## Sanitize the names.
##
## A list containing regular exspression to be looked-up paired with it's
## sanitized replacement.
##
transform_map <- list(
  '^t([A-Z]{1})'   = 'Time\\1',
  '^f([A-Z]{1})'   = 'Frequency\\1',
  'mean\\(\\)'     = 'Mean',
  'std\\(\\)'      = 'StandardDeviation',
  'Acc'            = 'Acceleration',
  'Mag'            = 'Magnitude'
)

for( regex in names( transform_map ) ){
  sanitized_names <- sub( regex, transform_map[regex], sanitized_names, fixed=FALSE )
}

## Remove '-' and '_' globaly
sanitized_names <- gsub( '-', '', sanitized_names, fixed=TRUE )
sanitized_names <- gsub( '_', '', sanitized_names, fixed=TRUE )

## Lowercase the column names
names( data ) <- tolower( sanitized_names )




##
## 3. Uses descriptive activity names ##########################################
##

## Load activities
activities <- read.table(file="./activity_labels.txt",header=FALSE)

## Tidy the strings: lowercase and no underscores
activities[,2] <- tolower( activities[,2] )
activities[,2] <- gsub( '_', '', activities[,2], fixed=TRUE )


## Character variables when applicable should be factors
y[,1] = as.factor( activities[y[,1], 2] )


## 4. Appropriately labels the data set with descriptive variable names ########


## Other descriprive variable names were already handled above #2.
names( subjects ) <- "subject"


## Bind all the columns togeder to form tidy_data
tidy_data <- cbind( subjects, y, data )





## 5. Creates a second, independent tidy data set ##############################
##    with the average of each variable for each activity and each subject.


## Generate subject.activity groups
##
grouped <- split(
  tidy_data,
  as.factor( paste( tidy_data$subject, tidy_data$activity, sep="." ) )
)


## sapply() the Colmeans to generate the report. t() transposes the result.
##
report <- data.frame(
  t(
    sapply( grouped, function(x){ colMeans( x[, 3:68 ], na.rm=TRUE ) } )
  )
)


## Reinsert subject and activity columns
##
activity <- as.factor( sub( '(\\d+)\\.(.*)', '\\2', rownames( report ) ) )
subject  <- as.numeric( sub( '(\\d+)\\.(.*)', '\\1', rownames( report ) ) )
rownames( report ) <- NULL


## Bind all the rows into a single report
report <- cbind( "subject" = subject, "activity" = activity, report )
report <- report[ order( report$subject, report$activity ), ]

dim(report)

## Write the report file
##
write.table( report, file="independent_tidy_data.txt", row.names=FALSE )



print( "All done. Thank you for your time in reviewing my R data clean-up script" )
