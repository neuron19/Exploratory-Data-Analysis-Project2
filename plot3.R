 # Load library ggplot2
 library(ggplot2)

 # Load the data required for analysis and plotting
 NEI = readRDS("summarySCC_PM25.rds")
 SCC = readRDS("Source_Classification_Code.rds")

 # Subset NEI data for City of Baltimore
 data.baltimore = NEI[NEI$fips =="24510",]

 # Calculate the sum of emissions per Year
 emissionsYearly.baltimore           = aggregate(Emissions ~ year,data.baltimore, sum)
 
 # Plot the results using ggplot2 to a .png file
 png("plot3.png", width=480, height=480, units="px")

 plot = ggplot(data.baltimore, aes(factor(year), Emissions, fill=type))+
               geom_bar(stat = "identity")+ guides(fill =F)+
               facet_grid(.~type, scales = "free", space = "free")+
               labs(x = "Year", y = expression(paste("PM", ""[2.5],"  ", "in Tons")))+
               labs(title = expression(paste("Total Emission of PM"[2.5], " ", "in Baltimore City,MD by Source Type")))
 
 print(plot)
 dev.off()