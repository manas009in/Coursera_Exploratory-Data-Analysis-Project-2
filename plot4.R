#Set the working Directory
setwd("F:/Personal/Coursera/Data Science/Explratry Data Analysis/W4/Project")

#Read the Data Files in required Format
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Create a Subset of SCC data with "Coal" in Column "Short.Name" by using grepl (Pattern Identification) function. Do not forget to input ignore.case = TRUE
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE),]

#Merge NEI and SCC.coal Data by SCC identifier
NEISCC.coal <- merge(NEI, SCC.coal, by = "SCC")

#Using aggregate function, create a matrix with Total Emissions (with coal sources) for each year 
aggregateByYear <- aggregate(Emissions~year, NEISCC.coal, sum)

#Load ggplot2 library
library(ggplot2)

#Plot the bargraph with Year as X-Axis and Total Emissions of PM2.5 as Y-Axis
g <- ggplot(aggregateByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat = "identity") + xlab("Year") + ylab("Total PM2.5 Emissions") + ggtitle('Total Emissions of coal sources from Year 1999 to 2008')
print(g)

#Copy the graph in a png file and shut off the device
dev.copy(png, file = "plot4.png", height=480, width=480)
dev.off()
