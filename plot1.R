require(plyr)
#source("get_data.R")
## Assumes NEI and SCC data have already been read in calling file.

totSumm = ddply(NEI,.(year),summarize,ToTEmissions=sum(Emissions))

png(filename="plot1.png",width=400,height=400,units = "px")

## initial barplot, not vert axis change yet. Total country wide.
barplot(totSumm$ToTEmissions/1000,names=totSumm$year,
        xlab="Year",ylab="Total Emissions (1000's of Tons)",
        main="Yearly PM2.5 Emissions",
        col="red")
dev.off()