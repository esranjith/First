#vector
sales1 = rnorm(100, mean=80, sd=10)
sales1
sales1 = trunc(sales1)
summary(sales1)
boxplot(sales1)
hist(sales1)
plot(density(sales1))
range(sales1)
m1 = matrix(100:123, ncol = 2)
m1[,1]
colnames(m1)=c('A','B')
head(m1)
tail(m1)
#DF
sname = paste('Student', 1:30, sep='-')
sname
marks = trunc(runif(30,50,90))
marks
gender = sample(c('M','F'),replace=T,size=30,prob=c(.7,.3))
df1 = data.frame(sname, marks, gender)
df1
plot(density(marks))


library(dplyr)
df1 %>% group_by(gender) %>% summarise(mean(marks), n(), min(marks), max(marks))

?select
df1 [(order(df1$marks, decreasing = T))]
df1 %>% select($sname,$marks) %>%($marks)
