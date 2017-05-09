#SVR
"""
Created on Tue Mar 21 23:12:03 2017

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
"""from sklearn.cross_validation import train_test_split
X_train, X_test, Y_train, Y_test= train_test_split(X,Y, test_size = 0.2, random_state=0)"""

#Feature Scaling 
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
sc_y = StandardScaler()
X = sc_X.fit_transform(X)
y = sc_y.fit_transform(y)

              
#Fitting  SVR to the Dataset
from sklearn.svm import SVR
regressor = SVR(kernel = 'rbf')
regressor.fit(X,y)

#Predicting result 

y_pred =sc_y.inverse_transform(regressor.predict(sc_X.transform(np.array([[6.5]]))))

#Visuling the SVR results 
plt.scatter(X,y, color =  'red')
plt.plot(X,regressor.predict(X), color = 'blue')
plt.title('Truth or Bluff (SVR)')
plt.xlabel('Position level')
plt.ylabel('Salary')
plt.show()

#Visualing the Regression result (for higher resolution and smother curve)
X_grid = np.arange(min(X),max(X),0.1)
X_grid = X_grid.reshape(len(X_grid),1)
plt.scatter(X,y, color =  'red')
plt.plot(X_grid,regressor.predict(X_grid), color = 'blue')
plt.title('Truth or Bluff (SVR)')
plt.xlabel('Position level')
plt.ylabel('Salary')
plt.show()