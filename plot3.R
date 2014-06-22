require(plyr)
require(ggplot2)
## 3 check changes by type over time in baltimore city.
balt_all = NEI[NEI$fips=="24510",]

baltsplit = ddply(balt_all,.(type,year),
                  summarize,TotEmissions=sum(Emissions))

png(filename="plot3.png",width=400,height=400,units = "px")
## Plot faceted versions. 
ggplot(data=baltsplit, aes(x=year,y=TotEmissions))+geom_bar(stat="identity")+
  scale_x_continuous(breaks=c(1999,2002,2005,2008))+facet_wrap(~type) + 
  xlab("By Year") + ylab("Tons Emissions") + 
  ggtitle("Emissions in Baltimore by Source")

dev.off()