#Multiple Linear Regression 

#Importing the dataset
dataset= read.csv('50_Startups.CSV')
# dataset=dataset[, 2:3]

#Encoding categorical data 
dataset$State = factor(dataset$State,
                        levels = c('New York','California','Florida'),
                        labels = c(1,2,3))
#splitting the dataset into the Training set and Test set
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit,SplitRatio = 0.8)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

#Feature Scaling 
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3]=scale(test_set[, 2:3])


#Fitting Multiple Linear Regression to the training set 
regression = lm(formula = Profit ~ .,
                data = training_set)
# Predicting the Test set results 
y_pred = predict(regression, newdata = test_set)

#Building the optimal model using Bckward Elimination 
regression = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
                data = dataset)
summary(regression)
regression = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
                data = dataset)
summary(regression)
regression = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
                data = dataset)
summary(regression)
regression = lm(formula = Profit ~ R.D.Spend ,
                data = dataset)
summary(regression)

