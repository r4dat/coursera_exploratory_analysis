require(plyr)
require(ggplot2)
#source("get_data.R")

## Assumes NEI and SCC data have already been read in calling file.

## Get baltimore city.
balt_NEI = NEI[NEI$fips=="24510",]

vehicleIndex = which(  
                    grepl(pattern = "Vehicle",SCC$SCC.Level.Two,ignore.case=TRUE)
                    )


vehicleSCC = SCC[vehicleIndex,1]

vehicNEI = subset(balt_NEI, SCC %in% vehicleSCC)

vehicTotEm = aggregate(Emissions ~ year, data=vehicNEI, sum)

# Plot Vehicle emissions in Baltimore
png(filename="plot5.png",width=400,height=400,units = "px")

barplot(vehicTotEm$Emissions,names=vehicTotEm$year,
        xlab="Year",ylab="Total Emissions in Tons",
        main="PM2.5 Emissions from Vehicles in Baltimore",
        col="blue")

dev.off()