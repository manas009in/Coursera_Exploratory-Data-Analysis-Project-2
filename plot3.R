#Set the working Directory
setwd("F:/Personal/Coursera/Data Science/Explratry Data Analysis/W4/Project")

#Read the Data Files in required Format
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Create a Subset of NEI dataframe for Baltimore City
NEIBaltisub <- subset(NEI, fips == 24510)

#Using aggregate function, create a matrix with Total Emissions in Baltimore for each year
aggregateByYearandType <- aggregate(Emissions ~ year + type, NEIBaltisub, sum)

#Load ggplot2 library
library(ggplot2)

#Plot the linegraph with Year as X-Axis and Total Emissions of PM2.5 as Y-Axis and segregated by type of sources
g <- ggplot(aggregateByYearandType, aes(year, Emissions, color = type))
g <- g + geom_line() + xlab("Year") + ylab("Total PM2.5 Emissions") + ggtitle("Total Emissions in Baltimore City, Maryland from 1999 to 2008")
print(g)

#Copy the graph in a png file and shut off the device
dev.copy(png, file = "plot3.png", height=480, width=480)
dev.off()
