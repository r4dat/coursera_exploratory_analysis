require(plyr)
source(get_data.R)

summary_dat = ddply(NEI,.(year),summarize,ToTEmissions=sum(Emissions))

## initial barplot, not vert axis change yet.
barplot(summary_dat$ToTEmissions,names=summary_dat$year,
        xlab="Year",ylab="Total Emissions (Tons)",
        main="Total Yearly Emissions",
        col="red")