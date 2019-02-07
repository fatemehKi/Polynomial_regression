# -*- coding: utf-8 -*-
"""
Created on Thu Feb  7 09:34:36 2019

@author: Fatemeh
"""

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
# we chenge the x vector to the metrics 
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

#since we have small sample size, we do not split
# Splitting the dataset into the Training set and Test set
"""from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)"""

# Feature Scaling
# no need scaling for polynomial regression.. regressor does it
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
sc_y = StandardScaler()
y_train = sc_y.fit_transform(y_train)"""
