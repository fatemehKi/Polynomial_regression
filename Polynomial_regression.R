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
poly_reg = lm(formula = Salary ~ ., 
              data = dataset)
