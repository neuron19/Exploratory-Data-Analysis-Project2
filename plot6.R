 # Load ggplot2 library
 library(ggplot2)

 # Load the data required for analysis and plotting
 NEI = readRDS("summarySCC_PM25.rds")
 SCC = readRDS("Source_Classification_Code.rds")

 # Subset NEI data for City of Baltimore and Los Angeles County with source type
 data.baltimore = NEI[NEI$fips =="24510" & NEI$type == "ON-ROAD",]
 data.LA        = NEI[NEI$fips =="06037" & NEI$type == "ON-ROAD",]

 # Calculate the sum of emissions per Year for Baltimore & Los Angeles
 emissionsYearly.baltimore    = aggregate(Emissions ~ year,data.baltimore, sum)
 emissionsYearly.LA           = aggregate(Emissions ~ year,data.LA, sum)

 # Create a new city column for both data frames; Combine to the two data frames into one
 emissionsYearly.baltimore$City = "Baltimore"
 emissionsYearly.LA$City        = " Los Angeles"

 eY.BLA = rbind(emissionsYearly.baltimore,emissionsYearly.LA)

# Plot the results using ggplot2 to a .png file
 png("plot6.png", width=480, height=480, units="px")
 
 plot = ggplot(eY.BLA, aes(factor(year), Emissions, fill=City))+
               geom_bar(stat = "identity")+ guides(fill =F)+
               facet_grid(.~City, scales = "free", space = "free")+
               labs(x = "Year", y = expression(paste("PM", ""[2.5],"  ", "in Tons")))+
               labs(title = "Total Emissions for Motor Vehicles in Los Angeles vs. Baltimore")
 
 print(plot)
 dev.off()
