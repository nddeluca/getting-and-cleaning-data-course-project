library(plyr)

activity_labels <- read.table('./data/activity_labels.txt')
feature_labels <- read.table('./data/features.txt')

training_subject_data <- read.table('./data/train/subject_train.txt')
training_x_data <- read.table('./data/train/X_train.txt')
training_y_data <- read.table('./data/train/y_train.txt')

test_subject_data <- read.table('./data/test/subject_test.txt')
test_x_data <- read.table('./data/test/X_test.txt')
test_y_data <- read.table('./data/test/y_test.txt')

total_subject_data <- rbind(training_subject_data, test_subject_data)
total_x_data <- rbind(training_x_data, test_x_data)
total_y_data <- rbind(training_y_data, test_y_data)

colnames(total_x_data) <- feature_labels$V2
data <- total_x_data[,grepl('mean|std', colnames(total_x_data))]

data <- cbind(total_y_data, data)
data <- cbind(total_subject_data, data)

colnames(data)[1] <- 'Subject'
colnames(data)[2] <- 'Activity'

data[,2] = activity_labels[data[,2],]$V2

data <- ddply(data, .(Subject, Activity), numcolwise(mean))

write.table(data, file="./data.txt", row.names=FALSE)
