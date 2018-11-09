#1

#read the data (already in working directory)
beerdata<-read.csv("beerdata.txt",sep="")

#load ggplot2 package
library(ggplot2)
#create a variable to hold the data to be used in the graph
beergraph<- ggplot(data=beerdata, aes(x=Beer,y=Income))
#Combine the variable with geom_jitter function to create the scatter plot, coord_cartesian to select
#the system, select a classic theme and add the geom_smooth function to create the trendline
beergraph+geom_jitter()+coord_cartesian()+theme_classic()+geom_smooth(method = "lm")

#2

#read & review the data
data<-read.csv("data.txt",sep=",")
summary(data)
#select the rows that correspond to each region and store in variables
north<-data[data[,1] == "north",]
south<-data[data[,1] == "south",]
east<-data[data[,1] == "east",]
west<-data[data[,1] == "west",]
#calculate the mean for each set of observations
north_mean<-mean(north$observations)
south_mean<-mean(south$observations)
east_mean<-mean(east$observations)
west_mean<-mean(west$observations)
#create empty variable to later hold the averages calculated
all_means<-numeric(4)
all_means<-c(north_mean,south_mean,east_mean,west_mean)
#create a variable to hold names for each average
#these are arranged in the same order as the observations
regions<-c("n" "s" "e" "w")
#compile both vectors into a dataframe
df<-data.frame(regions,all_means)
#create a graph which uses the dataframe created,
#is organized as a bar chart and adds text to the bars indicating their values
graph<-ggplot(data=df,aes(x=regions,y=all_means))+geom_bar(stat="identity",width=0.5)+geom_text(aes(label=all_means), vjust=-0.3, size=3.5)+
  theme_minimal()

graph
