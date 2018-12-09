# Decision Tree - Classification
#we want predict for combination of input variables, is a person likely to servive or not

#import data from online site
path = 'https://raw.githubusercontent.com/thomaspernet/data_csv_r/master/data/titanic_csv.csv'
titanic <-read.csv(path)
head(titanic)
names(titanic)
data = titanic[,c(2,3,5,6,7)]  #select few columns only
head(data)
dim(data)
#load libraries
library(rpart)
library(rpart.plot)

#Decision Tree
names(data)
fit <- rpart(survived ~ ., data = data, method = 'class')
fit
rpart.plot(fit, extra = 106, cex=.8,nn=T)  #plot

printcp(fit) #select complexity parameter
prunetree2 = prune(fit, cp=.014)
rpart.plot(prunetree2, cex=.8,nn=T)
prunetree2
nrow(data)
table(data$survived)
#Predict class category or probabilities
(testdata = sample_n(data,2))
survivepred= predict(prunetree2, newdata=testdata, type='class')
survivepred = predict(prunetree2, newdata=testdata, type='prob')
cbind(testdata,survivepred)
#Use decision trees for predicting
#customer is likely to buy a product or not with probabilities
#customer is likely to default on payment or not with probabilities
#Student is likely to get selected, cricket team likely to win etc
#Imp steps
#select columns for prediction
#load libraries, create model
#prune the tree with cp value
#plot the graph
#predict for new cases


head(iris)
table(iris$Species)

fit1 = rpart(Species~., data=iris, method = 'class')
fit1
rpart.plot(fit1)

fit2 = rpart(Petal.Length~.,data=iris, method = 'anova')
fit2
rpart.plot(fit2, nn=T, fallen.leaves = T)
printcp(fit2)
(testdata=sample_n(iris,2,replace = F))
(speciespredit = predict(fit1,data = testdata, type = 'class'))
cbind(testdata,speciespredit)
