#Set the working Directory
setwd("F:/Personal/Coursera/Data Science/Explratry Data Analysis/W4/Project")

#Read the Data Files in required Format
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Create subset of NEI data with Baltimore as City and type of source as "On-ROAD". The On-Road Source will provide with data for all motor vehicles and rest of the sources do not contain Motor Vehicle data.
NEIBaltisubOnRoad <- subset(NEI, fips == 24510 & type == "ON-ROAD")

#Using aggregate function, create a matrix with Total Emissions in Baltimore for each year for On-Road type
aggregateByYear <- aggregate(Emissions~year, NEIBaltisubOnRoad, sum)

#Load ggplot2 library
library(ggplot2)

#Plot the bargraph with Year as X-Axis and Total Emissions of PM2.5 as Y-Axis
g <- ggplot(aggregateByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat = "identity") + xlab("Year") + ylab("Total PM2.5 Emissions") + ggtitle("Total Emissions from motor vehicles in Baltimore City, Maryland from 1999 to 2008")
print(g)

#Copy the graph in a png file and shut off the device
dev.copy(png, file = "plot5.png", height=480, width=480)
dev.off()
