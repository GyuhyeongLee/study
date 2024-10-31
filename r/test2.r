#1 ####
name = c('k','l','o','k','l')
score = c(100,99,88,100,100)
st = data.frame(name=name,score=score)
st
unique(name)
duplicated(st)

#2 ####
table(st$name)
table(st$score)
