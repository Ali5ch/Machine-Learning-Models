#Regression_template

"""
Created on Tue Mar 21 19:41:41 2017

@author: ali5c_000
"""
# Importing the libraries 
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd 
#Importing the dataset

dataset= pd.read_csv('Position_Salaries.csv')
X= dataset.iloc[:,1:2].values
y=dataset.iloc[:,2].values

#splitting the dataset into the Training set and Test set 
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, Y_test= train_test_split(X,y, test_size = 0.2, random_state=0)

#Feature Scaling 
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)"""
              
#Fitting  Regression Model to the Dataset
#create your regressor here 

#Predicting result 
y_pred = regressor.predict(6.5)

#Visuling the Regression results 
plt.scatter(X,y, color =  'red')
plt.plot(X,regressor.predict(X), color = 'blue')
plt.title('Truth or Bluff (Regression Model)')
plt.xlabel('Position level')
plt.ylabel('Salary')
plt.show()

#Visualing the Regression result (for higher resolution and smother curve)
X_grid = np.arange(min(X),max(X),0.1)
X_grid = X_grid.reshape(len(X_grid),1)
plt.scatter(X,y, color =  'red')
plt.plot(X_grid,regressor.predict(X_grid), color = 'blue')
plt.title('Truth or Bluff (Regression Model)')
plt.xlabel('Position level')
plt.ylabel('Salary')
plt.show()