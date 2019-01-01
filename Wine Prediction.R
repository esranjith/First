library(rpart)
library(rpart.plot)
library(dplyr)

#--Train
WineData = read.csv(file=file.choose())
(WineData)
testdata = read.csv(file=file.choose())
predictdata = read.csv(file=file.choose())
fit = rpart(WineClass ~ ., data = WineData, method = 'class')
fit
rpart.plot(fit, extra = 106, cex=.8,nn=T)  #plot
rpart.plot(fit)  #plot
printcp(fit) #select complexity parameter
prunetree = prune(fit, cp=.05)
rpart.plot(fit, cex=.8,nn=T)
prunetree
rpart.plot(prunetree) 

#--Test
ClassPredicted= predict(prunetree, newdata=testdata, type='class')
ClassPredictedProb = predict(prunetree, newdata=testdata, type='prob')
cbind(testdata,ClassPredicted,ClassPredictedProb)

#--Predit
FinalPredicted = predict(prunetree, newdata =predictdata, type = 'class')
FinalPredictedProb = predict(prunetree, newdata = predictdata, type ='prob')
cbind(predictdata,FinalPredicted,FinalPredictedProb)
