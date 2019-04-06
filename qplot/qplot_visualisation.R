# To install the package and load
install.packages("ggplot2")
library(ggplot2)


getwd()
setwd("D:\\R program\\qplot")
value <- read.csv("P2-Demographic-Data.csv")
# A scatter plot  will be created
qplot(
  data = value,
  x = Internet.users,
  y = Birth.rate,
  xlim = c(0, 100),
  ylim = c(10, 50),
  size = I(2),
  shape = I(17),
  alpha = I(0.5),
  colour = Income.Group,
  xlab = "Internet Users",
  ylab = "Birth Rate",
  main = "Comparison of Birth Rate with Internet Users"
)
