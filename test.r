HR = read.csv('/Users/design/Downloads/HR_comma_sep.csv')
head(HR)
str(HR)
summary(HR)

summary(HR$left)

HR$Work_accident=as.factor(HR$Work_accident)
HR$left=as.factor(HR$left)
HR$promotion_last_5years=as.factor(HR$promotion_last_5years)

summary(HR$left)
