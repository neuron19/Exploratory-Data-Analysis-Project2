# Load library ggplot2
 library(ggplot2)

 # Load the data required for analysis and plotting
 NEI = readRDS("summarySCC_PM25.rds")
 SCC = readRDS("Source_Classification_Code.rds")

 # Sources related to Coal Combustion
 coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

 # Merge the 2 data sets and calculate the sum year wise
 coal.data = merge(NEI, coal, by = "SCC")
 coal.data.sum = aggregate(Emissions~year, coal.data, sum)
 coal.data.sum[,2] = round(coal.data.sum[,2]/1000,2)

 # Plot the results using ggplot2 to a .png file
 png("plot4.png", width=480, height=480, units="px")

 plot = ggplot(coal.data.sum, aes(factor(year), Emissions))+
               geom_bar(stat = "identity", fill="dodgerblue")+ guides(fill =F)+
               labs(x = "Year", y = expression(paste("PM", ""[2.5],"  ", "in Kilotons")))+
               labs(title = expression(paste("Total Emission of PM"[2.5], " ", "from Coal Combustion")))
 
 print(plot)
 dev.off()