# Simple Linear Regration

#Importing the dataset
dataset= read.csv('Salary_Data.CSV')
# dataset=dataset[, 2:3]

#splitting the dataset into the Training set and Test set 
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary,SplitRatio = 2/3)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

#Feature Scaling 
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3]=scale(test_set[, 2:3])

#Fitting Simple Linear Regration to the Training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

#Predicting the Test set Result 
y_pred = predict(regressor, newdata = test_set)

#Visualing the Trainging set result 
#install.packages('ggplot2')
library(ggplot2)
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour='red') +
  geom_line(aes(x = training_set$YearsExperience, y =  predict(regressor, newdata = training_set)),
            colour='blue') +
  ggtitle('Salary vs Experince (Training set)')+
  xlab('years of exprience')+
  ylab('Salary')

#Visualing the Test set result 
#install.packages('ggplot2')
library(ggplot2)
ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour='red') +
  geom_line(aes(x = training_set$YearsExperience, y =  predict(regressor, newdata = training_set)),
            colour='blue') +
  ggtitle('Salary vs Experince (Test set)')+
  xlab('years of exprience')+
  ylab('Salary')












