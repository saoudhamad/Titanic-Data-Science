#set directory
setwd("~/R/Titanic")

#open files from directory
titanic.train <- read.csv (file = "train.csv", stringsAsFactors = FALSE, header = TRUE)

titanic.test <- read.csv (file = "test.csv", stringsAsFactors = FALSE, header = TRUE)

#check median of each dataset
median (titanic.train$Age, na.rm = TRUE)
median (titanic.test$Age, na.rm = TRUE)

#we want to combine both data set but we wanna be able to separate them at the end
titanic.train$IsTrainSet <- TRUE
titanic.test$IsTrainSet <- FALSE

#check the values of new column "IsTrainSet"
tail (titanic.train$IsTrainSet)
tail (titanic.test$IsTrainSet)

#check if the two datasets are matched by their columns before combining
ncol(titanic.train)
ncol(titanic.test)
names(titanic.train)
names(titanic.test)

#test dataset doesn't have a "Survived" column so we add one so it can match with train dataset
titanic.test $ Survived <- NA

#combine both dataset to a single dataset
titanic.full <- rbind(titanic.train, titanic.test)

#check if the IsTrainSet is correct
names(titanic.full)
table(titanic.full$IsTrainSet)

#check missing values
table(titanic.full$Embarked)

# 2 missing values, so we have to input, we choose S

# we use query to select from the dataset and column embarked, only the entries with missing values
titanic.full[titanic.full$Embarked == '', "Embarked"]

#we got 2 missing values so input values into them
titanic.full[titanic.full$Embarked == '', "Embarked"] <- 'S'
#we check if the missing values disappeared
table(titanic.full$Embarked)

#check missing values for 'Age' column by using a filter
table(is.na(titanic.full$Age))

#we have 263 missing values, we replace the missing values with the median
#we define the median
age.median <- median(titanic.full$Age, na.rm = TRUE)
age.median
#we input the median to the missiing values by using the previous filter
titanic.full[is.na(titanic.full$Age), "Age"] <- age.median
table(is.na(titanic.full$Age))














