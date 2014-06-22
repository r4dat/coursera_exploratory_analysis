require(plyr)
require(ggplot2)
source("multiplot.R")
## Assumes NEI and SCC data have already been read in calling file.

## Get baltimore city.
balt_NEI = NEI[NEI$fips=="24510",]
los_NEI = NEI[NEI$fips=="06037",]

vehicleIndex = which(  
  grepl(pattern = "Vehicle",SCC$SCC.Level.Two,ignore.case=TRUE)
)


vehicleSCC = SCC[vehicleIndex,1]

vehicbaltNEI = subset(balt_NEI, SCC %in% vehicleSCC)
vehiclosNEI = subset(los_NEI,SCC %in% vehicleSCC)

vehicbaltTotEm = aggregate(Emissions ~ year, data=vehicbaltNEI, sum)
vehiclosTotEm = aggregate(Emissions ~ year, data=vehiclosNEI, sum)

## Create single data frames.
losvehic=cbind(city="Los Angeles",vehiclosTotEm)
baltvehic=cbind(city="Baltimore",vehicbaltTotEm)

## Combine
cityVehic = rbind(losvehic,baltvehic)

# Plot vehic emissions by city?
png(filename="plot6.png",width=400,height=400,units = "px")

p1 = ggplot(data=cityVehic, aes(x=year, y=Emissions, fill=city)) + 
  geom_bar(stat="identity", position=position_dodge(), colour="black")+
  scale_x_continuous(breaks=c(1999,2002,2005,2008))+ xlab("By Year") + ylab("Tons Emissions") + 
  ggtitle("Vehicle Emissions in Los Angeles and Baltimore")

## Create log transformed version. This however makes it harder to view the increase in Los Angeles.
p2 = ggplot(data=cityVehic, aes(x=year, y=log(Emissions), fill=city)) + 
  geom_bar(stat="identity", position=position_dodge(), colour="black")+
  scale_x_continuous(breaks=c(1999,2002,2005,2008))+ xlab("By Year") + ylab("Log(Tons) Emissions") + 
  ggtitle("Log(Emissions) in Los Angeles and Baltimore")


multiplot(p1,p2)
dev.off()