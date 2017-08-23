library(dplyr)
library(rpart)
library(caTools)
library(mlbench)

## Classification
## credit data
url="http://freakonometrics.free.fr/german_credit.csv"
credit=read.csv(url, header = TRUE, sep = ",")

F=c(1,2,4,5,7,8,9,10,11,12,13,15,16,17,18,19,20)
for(i in F) credit[,i]=as.factor(credit[,i])

sample.data = sample.split(credit$Creditability,SplitRatio = 0.7)
train = credit[sample.data,]
test  = credit[!sample.data,]

model.tree.credit = rpart(Creditability~.,data = train,maxdepth=6)

## lihat model
model.tree.credit
capture.output(model.tree.credit)

## cara baca modelnya nanti diskusi di kantor :)

## Regression
data("BostonHousing")

sample.boston = sample.split(BostonHousing,SplitRatio = 0.7)
train.boston = BostonHousing[sample.boston,]
test.boston  = BostonHousing[!sample.boston,]

model.tree.boston = rpart(medv~.,data = train.boston,maxdepth=6)

## lihat model
model.tree.boston
capture.output(model.tree.boston)
