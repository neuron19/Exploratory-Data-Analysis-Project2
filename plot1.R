
 # Load the data required for analysis and plotting
 NEI = readRDS("summarySCC_PM25.rds")
 SCC = readRDS("Source_Classification_Code.rds")

 # Calculate the sum of emissions per Year
 emissionsYearly           = aggregate(Emissions ~ year,NEI, sum)
 emissionsYearly$Emissions = round(emissionsYearly[,2]/1000,2)

 # Plot the results using base plotting system to a .png file
 png("plot1.png", width=480, height=480, units="px")
 
 barplot(emissionsYearly[,2], names.arg=emissionsYearly[,1], 
         main=expression("Total Emission of PM"[2.5]), xlab="Year",
         ylab=expression(paste("PM", ""[2.5],"  ", "in Kilotons")))

 dev.off()