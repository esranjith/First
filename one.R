women
sort(women)
x=c(1,2,3,4,5,6,7,8,9,10)
sort (x)
sort (x [-c(1,2)])
x= seq(1,25)
sort (x)
(x=seq(1,5, length.out = 15))
plot (density(x))
x = seq(1,100)
quantile(x,seq.1,.01)

x=c(1,2,3,4,5)
(x)
sort(x)
x = 2:6
sort(x)
x = c(8,8,9)
x=seq(1,100)
(x)

x[2:4]
plot (density(x))
plot (hist(x))
x= rnorm(10000)
(x)
plot(density(x))
lineab(-2,2)
plot(hist(x),freq=F)

x = c(1,2,3)
(x)
x = seq(1,100)
(x)

x[3:4]
plot(x)
stem(x)


matrix(1,ncol=3,nrow=4)
matrix(1:12,ncol=3,nrow=4)
m1=matrix(1:12,ncol=3,nrow=4, byrow = T)
m1[1,]
class(x)
class(m1)
dim(m1)
(m1)
m1
m1[,-1]
m1[,2]
m1[,2,drop=F]
m1[c(1,3)]
m1
m1[m1>5&m1<=12]

(colnames(m1) = paste('c',1:3, sep=''))
colnames(m1)=c('c1','c2','c3')
m1
m1[,c('c1','c3')]

v1=seq(1,24)
m3=1:24
dim(m3)=c(6,4)
m3
m3[1:5]
rbind(m3,m3)
cbind(m3,m3)
rowSums(m3)
sweep(m3, MARGIN =1, STATS=c(1,2,3,4,5,6),FUN = "+")
addmargins(m3,2,mean)
addmargins(m3,c(1,2),mean)
round(addmargins(m3,c(1,2),list(list(mean,sum,max,min),list(sd,var))))
?addmargins

#datafram----
rollno=1:30
sname=paste('Student',1:30,sep='')
gender=sample(c('M','F'),size = 30, replace = T,prob = c(.7,.3))
(gender)
table(gender)
prop.table(table(gender))
marks1=floor(rnorm(30,mean=40,sd=10))
marks2=floor(rnorm(30,mean=40,sd=10))
course=sample(c('MBA','BBA'),size=30,replace=T,prob=c(.5,.5))
rollno
df1=data.frame(rollno,sname,gender,marks1,marks2,course)
(df1)
dim(df1)
str(df1)
head(df1)
tail(df1,n=3)
summary(df1)
df1$sname
nrow(df1)
df1$sname = as.character(df1$sname)
df1$rollno = as.character(df1$rollno)
summary(df1)
boxplot(df1$marks1)
boxplot(marks1 ~ course+gender, data=df1)
df1[marks1>50,]
df1[marks1>50|marks2>50,]
aggregate(df1$marks1, by = list(df1$gender),FUN=sum)
aggregate(df1$marks1, by = list(df1$gender),FUN=mean)
aggregate(cbind(marks1,marks2)~gender+course,FUN=mean)

#Factor----

grades=sample(c('A','B','C','D'),size=30,replace=T,prob=c(.3,.2,.4,.1))
summary(grades)
grades = factor(grades)
grades = factor(grades, order=T, levels=c('D','C','B','A'))
summary(grades)
grades
grades = factor(grades,order=T)
pie(summary(grades))
barplot(summary(grades),col=1:4)
barplot(summary(grades),col=c(2,4,7,10))
