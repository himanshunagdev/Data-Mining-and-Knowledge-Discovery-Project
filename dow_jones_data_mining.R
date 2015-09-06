library('stats')
library(class)

file<-read.csv("C:/Users/NAGDEV/Desktop/dow_jones_index.data")

# subsetting relevant variables
subset<-(file[c(9,10,14,15,16)])

#Normailzing
#Create the normalization function
normalize<- function (x)
{
  object<-(x-min(x))/(max(x)-min(x))
  return(object)
}

# remove NA values from percent_change_volume_over_last_wk


mean(subset[,2], na.rm=TRUE) # mean= 5.593

median(subset[,2], na.rm=TRUE) # median = 0.512

subset[,2][is.na(subset[,2])] <- 5.593
subset

subset_1<-subset[,-2]
subset

# normalize values
# nrm<-  function (x)
# {
#   object<-(x-min(x))/(max(x)-min(x))
#   return(object)
# }

# Create a training dataset(Stock data from January-March )
train_data<- subset[1:360,]

# create a test data(Stock data from January-March)
test_data<-subset[361:750,]


# True classfication of training set 

stock_name1<-train_data[ , 3]
stock_name1
# 
# 
# # Factor of classification of test set

stock_name2<-test_data[ , 3]
stock_name2

# Classify test data using knn()function

pred<-knn(train_data[,-3], test_data[,-3], stock_name1, k=1) # with k=1

df<-data.frame(pred)
hist(df,main="Distribution of PCP",breaks=10)
boxplot(df)
plot(df$pred)
qqnorm(DowJonesdata$percent_change_price)
table(stock_name2,pred)
