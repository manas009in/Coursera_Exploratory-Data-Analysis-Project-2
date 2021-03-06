#Set the working Directory
setwd("F:/Personal/Coursera/Data Science/Explratry Data Analysis/W4/Project")

#Read the Data Files in required Format
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Create a Subset of NEI dataframe for with Baltimore City
NEIBaltisub <- subset(NEI, fips == 24510)

#Using aggregate function, create a matrix with Total Emissions for each year
aggregateByYear <- aggregate(Emissions~year, NEIBaltisub, sum)

#Plot the bargraph with Year as X-Axis and Total Emissions of PM2.5 as Y-Axis
par(mfrow = c(1,1), mar = c(4,4,2,1))
barplot(height = aggregateByYear$Emissions, names.arg = aggregateByYear$year, xlab = "Year", ylab = "Total PM2.5 Emissions", main = "Total PM2.5 Emission of Baltimore, Maryland city from 1999 to 2008")

#Copy the graph in a png file and shut off the device
dev.copy(png, file = "plot2.png", height=480, width=480)
dev.off()
