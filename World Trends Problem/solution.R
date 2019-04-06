data <- read.csv(file.choose())
library(ggplot2)
# To produce scatter plot for two years-1960 and 2013
# So two data frames need to be created

dataframe <- merge(
  data,
  data.frame(
    Code = Country_Code,
    Life_Expectancy_At_Birth_1960 = Life_Expectancy_At_Birth_1960,
    Life_Expectancy_At_Birth_2013 = Life_Expectancy_At_Birth_2013
  ),
  by.x = "Country.Code",
  by.y = "Code"
)

#scatter plot
myplot <- function(value,year)
{
  qplot(
    data = value,
    x = Fertility.Rate,
    y = Life_Expectancy_At_Birth_1960,
    size = I(2),
    shape = I(17),
    alpha = I(0.7),
    colour = Region,
    xlab = "Fertility Rate",
    ylab = "Life Expectancy",
    main = paste("Fertlity Rate Vs Life Expectancy - ",year)
  )+theme(
    plot.title = element_text( hjust = 0.5, face = "bold"))
}
#dataframe for the year 1960
dataframe_1960 <-
  dataframe[dataframe$Year == "1960", !names(dataframe) %in% c("Life_Expectancy_At_Birth_2013")]
head(dataframe_1960)
myplot(dataframe_1960,1960)

#dataframe for the year 2013
dataframe_2013 <-
  dataframe[dataframe$Year == "2013", !names(dataframe) %in% c("Life_Expectancy_At_Birth_1960")]
head(dataframe_2013)
myplot(dataframe_2013,2013)


