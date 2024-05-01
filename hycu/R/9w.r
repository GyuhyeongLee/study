#1 ####
no = c(1:5)
test1 = c(3.5, 4.2, 3.3, 4.5, 3.9)
test2 = c(2.0, 4.0, 4.5, 3.8, 4.2)
test3 = c(3.7, 4.0, 3.9, 3.7, 4.4)

df = data.frame(id = no, jaja=test1, C= test2, py= test3)
df

df[,2]
df[,2:4]
df[,-1]
#2 ####
class_a = matrix(c(100,99,100,88,100,100), nrow = 2)
class_b = matrix(c(99,88,100,100,100,99),nrow = 2)
st = data.frame(class_a, class_b)
colnames(st) = c('JAVA','C','C++','python','ML','deepL')
st

#3 ####
score.1 = c(100,100,100)
score.2 = c(NA,90,100)
score.3 = c(100,100,100)
a = data.frame(score.1,score.2,score.3)
a

#4 ####
a = data.frame(name=c('a','b','c','d'), score=c(90,80,79,100))
a
a[,2]>=90
a[a[,2]>=90,]
a[a[,2]>=90,1]
a[a[,2]>=90,c(1,2)]

#5 ####
b = data.frame(name=c('김한양','이한양','정한양','한한양'),score1=c(100,99,88,100), score2 = c(89,79,100,90), score3 = c(100,99,88,100))
b$score1>=80 & b$score2>=80
b[b$score1>=80 & b$score2>=80]
b[b$score1>=80 & b$score2>=80,1]
b[b$score1>=80 & b$score2>=80,c(1,2)]

#6 ####
no = c(1:5)
test1 = c(3.5, 4.2, 3.3, 4.5, 3.9)
test2 = c(2.0, 4.0, 4.5, 3.8, 4.2)
test3 = c(3.7, 4.0, 3.9, 3.7, 4.4)
df = data.frame(id = no, java=test1, C= test2, py= test3)
df
df[df$id==2,]
df[df$java>=3.0,]
df[df$C>=mean(df$C),]
df[df$C>mean(df$C) & df$py>mean(df$py),]
df[df$C>mean(df$C) | df$py>mean(df$py),]

#7 ####
head(iris)
str(iris)
iris[iris$Sepal.Length >=6.5,]
iris[,c(1,3)]
iris[iris$Spcies]

#8 ####
a = c(1,3,NA,5,99,100)
a
sum(a)
sum(a,na.rm=T)

#9 ####
a = data.frame(score1 = c(100,NA,99,80), score2=c(99,80,100,100))
a
is.na(a)
mean(a$score1,na.rm=T)
sd(a$score1,na.rm=T)
complete.cases(a)
which(is.na(a))
which(is.na(a),T)
na.omit(a)

#10 결측치 확인하는 방법 ####
a = data.frame(score1 = c(100,NA,99,88), score2 = c("A",'B','A','B'))
a$score1
a$score2
mean(a$score1,na.rm=T)
sd(a$score1,na.rm=T)
sum(is.na(a))
#df a의 결측치를 t/f로 구분해서 테이블로 알려주기
table(is.na(a))
#df a에서 결측치 제외한 것
na.omit(a)
#데이터 프레임 a의 결측치 위치찾기
which(is.na(a),T)

#11 오픈데이터 활용한 결측치 활용 방법 ####
aq = data.frame(airquality)
str(aq)
head(aq)
is.na(aq)
sum(is.na(aq))
table(is.na(aq))
colSums(is.na(aq))
complete.cases(aq)
colMeans(aq)
colMeans(aq,na.rm=T)
aq = na.omit(aq)
str(aq)

#12 데이터프레임 만들기 복습 ####
name = c('h','y','c','u')
score = c(100,99,100,100)
st = data.frame(name,score) #st1
class_a = matrix(c(99,88,100,99,98,100), nrow=2) ;class_a
class_b = matrix(c(100,100,99,99,100,100), nrow=2) ;class_b
st2 = data.frame(class_a,class_b); st2
colnames(st2) = c('sub1','sub2','sub3','sub4','sub5','sub6') ;st2
rownames(st2) = c('kim hy','lee hy') ;st2

#13 MASS 라이브러리 활용####
library(MASS)
str(Cars93)
x = Cars93
is.na(x)
colSums(is.na(x))

# 결측값을 통계 분석 시 제외
sum(x$Rear.seat.room)
mean(x$Rear.seat.room)
sum(x$Rear.seat.room, na.rm=T)
mean(x$Rear.seat.room, na.rm=T)

#결측값이 들어있는 행 전체를 데이터 셋에서 제거
temp = na.omit(x)
str(temp)
summary(temp)

#14 ####
