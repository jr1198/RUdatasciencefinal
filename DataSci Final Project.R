setwd("/Users/julienrosenbloom/SP20 Data Science for PoliSci")
covid19 <- read.csv("pew.csv")

## get dimensions of dataset
dim(covid19)

## create subset of "economically vulnerable" respondents
covid19a <- subset(covid19, COVIDWORK_W63.5 == 3)

## get dimensions of new subset
dim(covid19a)

## create table of economically vulnerable respondents by race
table(covid19a$COVIDWORK_W63.5, covid19a$F_RACETHN)

## create table of total respondents by race
table(covid19$F_RACETHN)

## input total sums by race into vector
totalRace <- c(6211, 668, 1422, 487, 116)

## input economically vulnerable sums by race into vector
unpaidRace <- c(807, 164, 455, 88, 20)

## create proportions of economically vulnerable respondents by race
percentWhite <- (unpaidRace[1]/totalRace[1]) * 100
percentBlack <- (unpaidRace[2]/totalRace[2]) * 100
percentHispanic <- (unpaidRace[3]/totalRace[3]) * 100
percentOther <- (unpaidRace[4]/totalRace[4]) * 100

## create output for bar plot
outs <- c(percentWhite, percentBlack, percentHispanic, percentOther)
outs


## create bar plot
barplot(outs,
        ylim =  c(0, 100), # y-axis dimensions
        names= c("White", "Black", "Hispanic", "Other"), 
        col = c("red", "red", "red", "red"), # color of bars
        border = NA, # removes bar borders
        main = "Vulnerability to Loss of Income by Race", # plot title
        cex.main = .8, # size of plot title
        ylab = "Percentage of Total Respondents", # yaxis label
        cex.lab = .8,# size of yaxis label
        las = 1) # controls angle of axis labels
abline(h=0, lty=2, col = "gray") # adds horizontal line at 0 with dashes 

## create subset of uninsured respondents 
covid19b <- subset(covid19, INSURANCE_W63.5 == 2)

## create table of uninsured respondents by race
table(covid19b$INSURANCE_W63.5, covid19b$F_RACETHN)

## input total sums by race into vector
totalRaceHealth <- c(6211, 668, 1422, 487, 116)
totalRaceHealth[1]

## input total sums of uninsured by race into vector
noHealthRace <- c(261, 65, 224, 38, 8)

## create proportions of uninsured by race
percentWhiteHealth <- (noHealthRace[1]/totalRaceHealth[1]) * 100
percentBlackHealth <- (noHealthRace[2]/totalRaceHealth[2]) * 100
percentHispanicHealth <- (noHealthRace[3]/totalRaceHealth[3]) * 100
percentOtherHealth <- (noHealthRace[4]/totalRaceHealth[4]) * 100

## create output for bar plot
outs2 <- c(percentWhiteHealth, percentBlackHealth, percentHispanicHealth, percentOtherHealth)
outs2

## create bar plot
barplot(outs2,
        ylim =  c(0, 100), # y-axis dimensions
        names= c("White", "Black", "Hispanic", "Other"), 
        col = c("red", "red", "red", "red"), # color of bars
        border = NA, # removes bar borders
        main = "Individuals Without Health Insurance by Race", # plot title
        cex.main = .8, # size of plot title
        ylab = "Percentage of Total Respondents", # yaxis label
        cex.lab = .8,# size of yaxis label
        las = 1) # controls angle of axis labels
