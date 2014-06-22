require(plyr)
# Check baltimore city Maryland, FIPS 24510
balt_all = NEI[NEI$fips=="24510",]


baltSumm = ddply(balt_all,.(year),
                 summarize,ToTEmissions=sum(Emissions))

png(filename="plot2.png",width=400,height=400,units = "px")

barplot(baltSumm$ToTEmissions,names=baltSumm$year,
        xlab="Year",ylab="Total Emissions (Tons)",
        main="Yearly PM2.5 Emissions Baltimore City",
        col="orange")

dev.off()