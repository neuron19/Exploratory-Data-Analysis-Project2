 # Load ggplot2 library
 library(ggplot2)

 # Load the data required for analysis and plotting
 NEI = readRDS("summarySCC_PM25.rds")
 SCC = readRDS("Source_Classification_Code.rds")

 # Subset NEI data for City of Baltimore with source type
 data.baltimore = NEI[NEI$fips =="24510" & NEI$type == "ON-ROAD",]

 # Calculate the sum of emissions per Year
 emissionsYearly.baltimore           = aggregate(Emissions ~ year,data.baltimore, sum)
 
 # Plot the results using ggplot2 to a .png file
 png("plot5.png", width=480, height=480, units="px")
 
 plot = ggplot(emissionsYearly.baltimore, aes(factor(year), Emissions))+
               geom_bar(stat = "identity", fill="darkorange2")+ guides(fill =F)+
               labs(x = "Year", y = expression(paste("PM", ""[2.5],"  ", "in Tons")))+
               labs(title = expression(paste("Total Emission of PM"[2.5], " ", "from Motor Vehicles in Baltimore,MD")))
 
 print(plot)
 dev.off()
