#Set the working Directory
setwd("F:/Personal/Coursera/Data Science/Explratry Data Analysis/W4/Project")

#Read the Data Files in required Format
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Find Total Emission for each Year (1999 to 2008)
totalpm25 <- with(NEI, tapply(Emissions, year, sum, na.rm = TRUE))

#Convert the logical vector into a dataframe with 2 Columns
df <- data.frame(year = names(totalpm25), totalpm = totalpm25)

#Plot the Barplot
par(mfrow = c(1,1), mar = c(4,4,2,1))
with(df, barplot(height = totalpm, names.arg = year, xlab = "Year", ylab = "Total PM2.5 Emissions", main = "Total PM2.5 Emissions for the Years 1999 to 2008"))
dev.copy(png, file = "plot1.png", height = 480, width=480)
dev.off()
