# Polynomial Regression template

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


#fitting Regression Model to the dataset
#create your own regressor here
# for instae for the polynomial regression is lie below:
# dataset$Level2 = dataset$Level^2
# dataset$Level3 = dataset$Level^3
# dataset$Level4 = dataset$Level^4
# poly_reg = lm(formula = Salary ~ ., 
#               data = dataset)



# Prediction a new result 
y_pred = predict(regressor, data.frame(Level =6.5))
                 

# plotting regression model
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y= dataset$Salary),
             colour = 'red')+
  geom_line(aes(x=dataset$Level, y= predict(regressor, newdata=dataset)),
                colour ='blue') +
              ggtitle('Truth or Bluff (Regression Model') +
              xlab('Level') +
              ylab('Salary')           
                
                 
                 
# plotting regression model- visualizing the regression model results (for higher resolution and smoother curve)
library(ggplot2)
# creating the 99 steps by the distance of 0.1
x_grid = seq(min(dataset$Level), max(dataset$level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y= dataset$Salary),
             colour = 'red')+
  geom_line(aes(x=x_grid, y= predict(regressor, newdata=data.frame(Level= x_grid)),
            colour ='blue') +
  ggtitle('Truth or Bluff (Regression Model') +
  xlab('Level') +
  ylab('Salary')
