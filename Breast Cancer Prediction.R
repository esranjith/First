library(rpart)
library(rpart.plot)
library(dplyr)

Classdata = read.csv(file=file.choose())
(Classdata)
testdata = read.csv(file=file.choose())
fit <- rpart(class ~ ., data = Classdata, method = 'class')
fit
rpart.plot(fit, extra = 106, cex=.8,nn=T)  #plot
rpart.plot(fit)  #plot
printcp(fit) #select complexity parameter
prunetree = prune(fit, cp=.2)
rpart.plot(fit, cex=.8,nn=T)
?rpart.plot
prunetree


ClassPredicted= predict(prunetree, newdata=testdata, type='class')
ClassPredictedProb = predict(prunetree, newdata=testdata, type='prob')
cbind(testdata,ClassPredicted,ClassPredictedProb)
ClassPredicted= predict(prunetree, newdata=Classdata, type='class')
cbind(WineData,ClassPredicted)
