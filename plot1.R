#attempt to do plot 1
#Assume subsetted data exists already called "subsetted".


hist(x=subsetted$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     col="red",main="Global Active Power")

png(filename="Plot1.png",width=480,height=480,units="px",type="cairo-png")