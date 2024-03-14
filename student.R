stud <- read.csv('C:\\Users\\Vikas\\OneDrive\\Desktop\\datasets\\student data.csv')
View(stud)

stud1 <- stud[stud$Gender == "female",]
View(stud1)

stud2 <- stud1[stud1$MathScore > 50,]
View(stud2)

stud2 <- stud1[stud1$MathScore > 50, c(1,3,5,7)]

# exclude the 7,8,9 variables #
stud2 <- stud1[stud1$MathScore > 50, -c(7:9)]
View(stud2)

# creating a subset having only gender female and married #
stud3 <- stud[stud$Gender == "female" & stud$ParentMaritalStatus == "married",]
View(stud3)  

# creating subset directly by command #
stud4 <- subset(stud, LunchType == "standard" & PracticeSport == "regularly")
View(stud4) 

stud5 <- subset(stud, LunchType == "standard" & PracticeSport == "regularly", c(1,5,7))
View(stud5)

# Sorting data frames #
asc <- stud[order(stud$MathScore),]
View(asc)

asc1 <- stud2[order(stud2$MathScore),]
View(asc1)

des <- stud2[order(-stud2$MathScore),]
View(des)

asc2 <- stud[order(stud$ReadingScore, stud$WritingScore),c(14,15)]
View(asc2)

asc3 <- stud[order(stud$ReadingScore,-stud$WritingScore),c(14,15)]
View(asc3)


# Statistical analysis #

min(stud$MathScore)
max(stud$MathScore)
range(stud$MathScore)
max(stud$MathScore) - min(stud$MathScore)

mean(stud$MathScore)

sd(stud$MathScore)

var(stud$MathScore)

mad(stud$MathScore)

quantile(stud$MathScore)
median(stud$MathScore)

IQR(stud$MathScore) # inter quantile result #
78-56


# Data visualization #

library("ggplot2")

## Histogram ##
ggplot() + geom_histogram(data = stud, aes(x=MathScore), bins = 10, binwidth = 5)

ggplot() + geom_histogram(data = stud, aes(x=MathScore), fill = "blue", color = "black", bins = 10, binwidth = 5)


## create facet grid ##
ggplot() + geom_histogram(data = stud, aes(x=MathScore), fill = "blue", color = "black", bins = 10, binwidth = 5) + facet_grid(Gender~ParentMaritalStatus)

## stacked histogram ##
ggplot() + geom_histogram(data = stud, aes(x=MathScore, fill = Gender), color = "black", bins = 10, binwidth = 5)

## create bar chart ##
ggplot(stud, aes(x=ParentEduc, y=MathScore, fill=ParentEduc)) + stat_summary(fun=mean,geom="bar")

## histogram - Ethnic Group and Lunch Type ##
#ggplot(stud, aes(EthnicGroup, fill=LunchType)) + geom_histogram(binwidth = 30)

## create cluster bar chart ##
ggplot(stud, aes(x= ParentEduc, y=MathScore, fill=Gender)) + stat_summary(fun=mean, geom = "bar",position=position_dodge())


# Box plot #
ggplot() + geom_boxplot(data = stud, aes(x=Gender , y=MathScore),outlier.colour = "red",outlier.shape = 4)+ scale_x_discrete(labels=c("female","male"))


ggplot(data=stud, aes(EthnicGroup, MathScore))+ geom_violin(color="green")
ggplot(data=stud, aes(EthnicGroup, MathScore))+ geom_boxplot(color="red") +geom_violin(color="green")


hist(stud$MathScore, col="grey", probability = TRUE)
lines(density(stud$MathScore,adjust = 3, lwd=3, color="blue"))

# create crosstable for mathscore and gender #
library(gmodels)
CrossTable(stud$MathScore, stud$Gender)
CrossTable(stud$MathScore, stud$Gender,prop.t=FALSE, prop.c=FALSE, prop.chisq = FALSE)

## scatter plot ##
plot(x=stud$ReadingScore, y=stud$MathScore, type= 'p', col="red")
