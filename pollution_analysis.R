require(plyr)
source(get_data.R)

summary_dat = ddply(NEI,.(year),summarize,ToTEmissions=sum(Emissions))

