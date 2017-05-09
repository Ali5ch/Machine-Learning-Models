# Data preprocessing
"""
Created on Fri Feb 24 22:13:54 2017

@author: ali5c_000
"""
# importing the libraries 
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Importing the dataset
dataset= pd.read_csv('Data.CSV')
X= dataset.iloc[:,:-1].values
Y=dataset.iloc[:,3].values

#splitting the dataset into the Training set and Test set 
from sklearn.cross_validation import train_test_split
X_train, X_test, Y_train, Y_test= train_test_split(X,Y, test_size = 0.2, random_state=0)

#Feature Scaling 
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)"""














