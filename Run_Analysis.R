run_analysis <- function() {
  
  ##Read in the list of column names and remove parentheses and hyphens using sub/gsub
  names <-read.table("features.txt")
  names <- names[,2]
  names <- as.character(names)
  names <- sub("\\(","",names)
  names <- sub("\\)","",names)
  names <- gsub("-","",names)
  names <- tolower(names)
  
  ##Read in the data
  train <- read.table("X_train.txt", col.names = names, colClasses = c("numeric"))
  test <- read.table("X_test.txt", col.names = names, colClasses = c("numeric"))
  train_subj <- read.table("subject_train.txt", col.names = c("Subject"))
  test_subj <- read.table("subject_test.txt", col.names = c("Subject"))
  train_act <- read.table("y_train.txt", col.names = c("Activity"), colClasses = c("character"))
  test_act <- read.table("y_test.txt", col.names = c("Activity"), colClasses = c("character"))
  
  ##Merge the X and Y sets for the data, the subject list, and the activity list
  mergedX <- rbind(train,test)
  mergedY <- rbind(train_act, test_act)
  mergedSubj <- rbind(train_subj, test_subj)
  
  ##Label the Activities with English labels rather than numbers
  mergedY[,1] <- sub("1", "Walking", mergedY[,1])
  mergedY[,1] <- sub("2", "WalkingUpstairs", mergedY[,1])
  mergedY[,1] <- sub("3", "WalkingDownstairs", mergedY[,1])
  mergedY[,1] <- sub("4", "Sitting", mergedY[,1])
  mergedY[,1] <- sub("5", "Standing", mergedY[,1])
  mergedY[,1] <- sub("6", "Laying", mergedY[,1])
  
  ##Extract only columns from merged data set pertaining to mean or standard deviaton
  newX <- mergedX[,grep("mean|std",names,value=FALSE)]
  
  ##Merge the data set, activity set, and subject set
  data <- cbind(mergedSubj, mergedY, newX)
  
  ##Aggregate the data by subject, then by activity
  tidydata <- aggregate(data, by = list(data$Subject,data$Activity),FUN=mean, na.rm=TRUE)
  tidydata[,4] <- tidydata[,2]
  tidydata <- tidydata[,3:83]
  
  ##Export data to a text file
  write.table(tidydata, "CourseProject.txt", col.names = TRUE)
  
  
  
  
  
  
}
