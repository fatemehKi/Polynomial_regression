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
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
sc_y = StandardScaler()
y_train = sc_y.fit_transform(y_train)"""

#simple linear regression to compare with
from sklearn.linear_model import LinearRegression
Lin_reg = LinearRegression()
Lin_reg.fit(X,y)

#polynomial regression
#first creating a polynomial x
from sklearn.preprocessing import PolynomialFeatures
poly_reg = PolynomialFeatures(degree = 4)
X_poly = poly_reg.fit_transform(X)
#second is doing regression
Lin_reg_2 = LinearRegression()
Lin_reg_2.fit(X_poly, y)

#Visualizing the Linear Regression Result for comparison with poly
plt.scatter(X, y, color = 'red')
plt.plot(X, Lin_reg.predict(X), color = 'blue')
plt.title('Truth or Bluff (Linear Regression)')
plt.xlabel('level')
plt.ylabel('Salary')
plt.show() 

#Visualizing the Polynomial Regression Result for comparison with poly
# the prediction is done on X_poly
#addin the resolution to plot
#X_grid = np.arange(min(X), max(X), 0.1)
#X_grid = X_grid.reshape((len(X_grid),1))
plt.scatter(X, y, color = 'red')
# the prediction is done on X_poly
plt.plot(X, Lin_reg_2.predict(X_poly), color = 'blue')
plt.title('Truth or Bluff (Linear Regression)')
plt.xlabel('level')
plt.ylabel('Salary')
plt.show() 

# predicting a new result with the linear regression
Lin_reg.predict([[6.5]])


# predicting a new result with the polynomial regression
Lin_reg_2.predict(poly_reg.fit_transform([[6.5]]))
