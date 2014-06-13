require(plyr)
source(get_data.R)

summary_dat = ddply(NEI,.(year),summarize,ToTEmissions=sum(Emissions))

## initial barplot, not vert axis change yet.
barplot(summary_dat$ToTEmissions/1000,names=summary_dat$year,
        xlab="Year",ylab="Total Emissions (1000's of Tons)",
        main="Yearly PM2.5 Emissions",
        col="red")