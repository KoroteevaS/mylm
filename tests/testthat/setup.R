x1 <-rnorm(25, mean = 5)
x2 <-rnorm(25, mean = 13)
x3 <-rnorm(25, mean = 7)
y <- rnorm(25, mean = 20)
interaction_term = rnorm(25, mean=25)
data <- data.frame(y, x1,x2,x3, interaction_term)
data1<-data.frame(y,x1)
worng_data<-NULL
wrong_data2<-data.frame(y)
formula<- y ~ x1
difficult_formula <- y ~ x1 + x2 + x1*x1 + interaction_term + x1:x2
wrong_formula <- "y ~ test"
subset1<-data$x1>0
subset2<-data$x1>5
subset3<-data$x1>6
wrong_subset1<-c(1,2,3,4,5,6,7,26)
wrong_subset2<-c(30)
model <- mylm(formula, data)
model2<-mylm(difficult_formula, data)