# Load the data required for analysis and plotting
 NEI = readRDS("summarySCC_PM25.rds")
 SCC = readRDS("Source_Classification_Code.rds")

 # Subset NEI data for City of Baltimore
 data.baltimore = NEI[NEI$fips =="24510",]

 # Calculate the sum of emissions per Year
 emissionsYearly.baltimore           = aggregate(Emissions ~ year,data.baltimore, sum)
 
 # Plot the results using base plotting system to a .png file
 png("plot2.png", width=480, height=480, units="px")
 
 barplot(emissionsYearly.baltimore[,2], names.arg=emissionsYearly.baltimore[,1], 
         main=expression(paste("Total Emission of PM"[2.5], " ", "in Baltimore City,MD")), 
         xlab="Year", ylab=expression(paste("PM", ""[2.5],"  ", "in Tons")))

 dev.off()