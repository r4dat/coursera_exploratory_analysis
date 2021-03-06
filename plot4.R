require(plyr)
require(ggplot2)
## Assumes NEI and SCC data have already been read in calling file.

#source("get_data.R")
## 4 Across the United States, how have emissions from coal combustion-related 
## sources changed from 1999–2008?

## Create subset of SCC id's with coal and lignite (brown coal) (and not charcoal.)
## Return line if LevelThree is (coal OR lignite AND NOT charcoal)
coalIndex = which( 
  (grepl(pattern = "coal",SCC$SCC.Level.Three,ignore.case=TRUE)
   | 
     grepl(pattern = "lignite",SCC$SCC.Level.Three,ignore.case=TRUE))
  &
    !grepl(pattern="charcoal",SCC$SCC.Level.Three,ignore.case=TRUE)
)

coalSCC = SCC[coalIndex,1]

coalNEI = subset(NEI, SCC %in% coalSCC)

coalTotEm = aggregate(Emissions ~ year, data=coalNEI, sum)

# Plot coal emissions
png(filename="plot4.png",width=400,height=400,units = "px")

barplot(coalTotEm$Emissions/1000,names=coalTotEm$year,
        xlab="Year",ylab="Total Emissions (1000's of Tons)",
        main="PM2.5 Emissions of US coal combustion",
        col="green")

dev.off()