#Set the working Directory
setwd("F:/Personal/Coursera/Data Science/Explratry Data Analysis/W4/Project")

#Read the Data Files in required Format
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Create subset of NEI data with Baltimore and Los Angeles as City and type of source as "On-ROAD". The On-Road Source will provide with data for all motor vehicles and rest of the sources do not contain Motor Vehicle data.
NEIsubOnRoad <- subset(NEI, (fips == "24510" | fips == "06037") & type == "ON-ROAD")

#Using aggregate function, create a matrix with Total Emissions in Baltimore and LA for each year for On-Road type
aggregateByYear <- aggregate(Emissions~year, NEIsubOnRoad, sum)

#Load ggplot2 library
library(ggplot2)

#Plot the bargraph with Year as X-Axis and Total Emissions of PM2.5 as Y-Axis. Set the grid columns to be equal to the number of Cities which is 2.
g <- ggplot(aggregateByYearandFips, aes(factor(year), Emissions))
g <- g + facet_grid(.~fips)
g <- g + geom_bar(stat="identity")  + xlab("Year") + ylab("Total PM2.5 Emissions") + ggtitle("Total Emissions from motor vehicle in Baltimore City, MD vs Los Angeles, CA from  1999-2008")
print(g)

#Copy the graph in a png file and shut off the device
dev.copy(png, file = "plot6.png", height=480, width=480)
dev.off()
