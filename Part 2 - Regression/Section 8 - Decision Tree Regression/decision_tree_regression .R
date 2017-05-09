#Decision Tree Regression 

#Importing the dataset
dataset= read.csv('Position_Salaries.CSV')
dataset=dataset[2:3]

#splitting the dataset into the Training set and Test set 
#install.packages('caTools')
#library(caTools)
#set.seed(123)
#split = sample.split(dataset$Purchased,SplitRatio = 0.8)
#training_set=subset(dataset,split==TRUE)
#test_set=subset(dataset,split==FALSE)

#Feature Scaling 
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3]=scale(test_set[, 2:3])

#Fitting Decision Tree Regression to tht dataset 
regressor =  rpart(formula = Salary ~ .,
                   data = dataset,
                   control = rpart.control(minsplit = 1))

#Predict a new result 
y_pred =  predict(regressor,data.frame(Level = 6.5))

#visualising Decision Tree Regression  result 
library(ggplot2)
ggplot()+
  geom_point(aes(x = dataset$Level ,y =dataset$Salary),
             colour = 'red')+
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue')+
  ggtitle('Truth or Bluff(Decision Tree Regression)')+
  xlab('Level')+
  ylab('Salary')

#visualising the Regression  Model result (for higher resolution and smoother curve)
library(ggplot2)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.01)
ggplot()+
  geom_point(aes(x = dataset$Level ,y =dataset$Salary),
             colour = 'red')+
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue')+
  ggtitle('Truth or Bluff(Decision Tree Regression)')+
  xlab('Level')+
  ylab('Salary')