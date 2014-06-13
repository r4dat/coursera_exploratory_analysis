require(plyr)
source(get_data.R)

totSumm = ddply(NEI,.(year),summarize,ToTEmissions=sum(Emissions))

## initial barplot, not vert axis change yet. Total country wide.
barplot(totSumm$ToTEmissions/1000,names=totSumm$year,
        xlab="Year",ylab="Total Emissions (1000's of Tons)",
        main="Yearly PM2.5 Emissions",
        col="red")

# Check baltimore city Maryland, FIPS 24510

baltSumm = ddply(NEI[NEI$fips=="24510",],.(year),
                 summarize,ToTEmissions=sum(Emissions))

