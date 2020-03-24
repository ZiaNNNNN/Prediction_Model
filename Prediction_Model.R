url = "https://raw.githubusercontent.com/jcbonilla/BusinessAnalytics/master/BAData/Progresso_Soup.csv"
PSS = read.csv(url)
PSS_df = as.data.frame(PSS)

PSS_df$winter <- ifelse(PSS_df$Month==10|PSS_df$Month==11|PSS_df$Month==12|PSS_df$Month==1|PSS_df$Month==2,as.logical(1), as.logical(0))
table(PSS_df$winter)

PSS_df$Month = factor(PSS_df$Month, levels = 1:12, labels = c("Jan","Feb","Mar","Apr",
                                                          "May","Jun","Jul","Aug",
                                                          "Sep","Oct","Nov","Dec"))

library(ggplot2)
library(dplyr)

qplot(PSS_df$Sales.Progresso, geom="histogram", binwidth=100,xlim=c(0,10000))

ggplot(PSS_df, aes(x=Month, y=PSS_df$Sales.Progresso)) + stat_summary(fun.y="sum"
                                                                      , geom="bar")

ggplot(PSS_df, aes(x=winter, y=PSS_df$Sales.Progresso)) + stat_summary(fun.y="sum"
                                                                       , geom="bar")

ggplot(PSS_df, aes(x=Region, y=PSS_df$Sales.Progresso)) + stat_summary(fun.y="sum"
                                                                       , geom="bar")
