require(plyr)
require(ggplot2)
source("get_data.R")

totSumm = ddply(NEI,.(year),summarize,ToTEmissions=sum(Emissions))

## initial barplot, not vert axis change yet. Total country wide.
barplot(totSumm$ToTEmissions/1000,names=totSumm$year,
        xlab="Year",ylab="Total Emissions (1000's of Tons)",
        main="Yearly PM2.5 Emissions",
        col="red")

# Check baltimore city Maryland, FIPS 24510
balt_all = NEI[NEI$fips=="24510",]


baltSumm = ddply(balt_all,.(year),
                 summarize,ToTEmissions=sum(Emissions))

barplot(baltSumm$ToTEmissions,names=baltSumm$year,
        xlab="Year",ylab="Total Emissions (Tons)",
        main="Yearly PM2.5 Emissions Baltimore City",
        col="orange")

## 3 check changes by type over time in baltimore city.
baltsplit = ddply(balt_all,.(type,year),
                  summarize,TotEmissions=sum(Emissions))

## Plot faceted versions. Currently dot plot.
ggplot(data=baltsplit, aes(x=year,y=TotEmissions))+geom_bar(stat="identity")+
  scale_x_continuous(breaks=c(1999,2002,2005,2008))+facet_wrap(~type) + 
  xlab("By Year") + ylab("Tons Emissions") + 
  ggtitle("Emissions in Baltimore by Source")
