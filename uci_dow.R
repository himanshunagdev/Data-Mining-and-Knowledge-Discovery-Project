
library('stats')
library(class)

file<-read.csv(file = "D:/MSIS books-syllabus/summer/mis 637/FINAL/Data Sets/Dow Jones/dow_jones_index.data")
#file<-na.omit(f)
# create a test data(Stock data from April-June )
test_data<-na.omit(file[361:373, ])
test_data


# Create a training dataset from 

train_data<-na.omit(file[1:36, ]) 
train_data


# True classfication of training set 

stock_name1<-train_data[ , 2]
stock_name1


# Factor of classification of test set

stock_name2<-test_data[ , 2]
stock_name2

#Classify test data using knn()function

pred<-knn(na.omit(train_data[,-(2:3)]), na.omit(test_data[,-(2:3)]), stock_name1, k=1) # with k=1
pred

table(stock_name2,pred)

