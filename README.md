DataCourseProject
=================
Note: This script works under the assumption that all of the data files are unzipped directly into the working directory, NOT inside a separate folder inside the directory. The script makes use of the following files:
- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

All of the data cleaning is done in one script, called "run_analysis.R". The script cleans the data in twelve steps:

1. Load the column names of the main dataset into R by reading in the "features.txt" file.
2. Remove the parentheses and hyphens present in the names using the sub and gsub functions.
3. Read in the test and training data using read.table, and setting the col.names argument to be the vector of names that were cleaned in steps 1 and 2. 
4. Read in the list of subjects and activies for the test and training set. 
5. Merge the training and test data together using rbind
6. Merge the training and test subject data together using rbind
7. Merge the training and test activity data together using rbind
8. Re-label the activities using English names such as "Walking" rather than numeric indicators using the sub function
9. Extracts only the measurements on mean and standard deviation from the merged data set using the grep function.
10. Merges the extracted measurements with their corresponding subject and activity to make one large table
11. Aggregates the data first by subject, then by activity. It finds the mean of each subject/activity combination.
12. Writes the aggregated data into a .txt file and puts it into the working directory.  
 
