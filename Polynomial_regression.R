# Polynomial Regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
#only column 2 and 3 is required
dataset = dataset[2:3]  

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#fitting linear regression to the dataset
Lin_reg = lm(formula = Salary ~ Level,
             data = dataset)

#fitting polynomial regression to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ ., 
              data = dataset)

####plotting 

#install.packages('ggplot2')
library(ggplot2)

# plotting linear
ggplot() +
  geom_point(aes(x = dataset$Level, y= dataset$Salary),
             colour = 'red')+
  geom_line(aes(x=dataset$Level, y= predict(Lin_reg, newdata=dataset)),
            colour ='blue') +
  ggtitle('Truth or Bluff (Linear Regression') +
  xlab('Level') +
  ylab('Salary')


# plotting polynomial
ggplot() +
  geom_point(aes(x = dataset$Level, y= dataset$Salary),
             colour = 'red')+
  geom_line(aes(x=dataset$Level, y= predict(poly_reg, newdata=dataset)),
            colour ='blue') +
  ggtitle('Truth or Bluff (Polynomial Regression') +
  xlab('Level') +
  ylab('Salary')

# Predicting a new result with Linear Regression
#because we don't have 6.5 in the list, we need to use dataframe
y_pred = predict(Lin_reg, data.frame(Level =6.5))

# Prediction a new result witto dataserh polynmial
# we also need to add the level1, 2 and 3 
y_pred = predict(poly_reg, data.frame(Level =6.5,
                                      Level2 = 6.5^2,
                                      Level3 = 6.5^3,
                                      Level4 = 6.5^4))

  
