# Getting and Cleaning Data Course Project

# Data

The data set used was provided by UCI Machine Learning Repository and represents accelerometer and gyroscope measurements collected from volunteers performing different activities.

Full information about the data set can be obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

# Using This Project

Clone this repository, download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, and extract the archive to the `./data` directory within the repository.

Then run the `run_analysis.R` script.  The script will read the data from the `./data` directory and output to a `data.txt` file.

## The Analysis Script

The analysis script will perform the following operations:

- Require the ddply library
- Load the label definitions, training data, and test data into memory
- Merge the test and training data sets
- Name the columns for each each measuremnt
- Keep all the mean and std measurements while removing other measurements
- Merge the Subject and Actitivy data with column names
- Convert the activity data from integers to descriptive strings
- Summarize the data by taking the mean of every measurement for each subject and activity
- Output the resulting data to data.txt

