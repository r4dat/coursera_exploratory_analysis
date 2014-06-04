#attempt to do plot 1
#Assume subsetted data exists already called "subsetted".


# oddities: xlim limits our x-range and removes values > xlim.
# However it creates 0-6 x-axis, which is removed by xaxt parameter.
hist(x=subsetted$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     col="red",main="Global Active Power",
     xlim=range(0,6),xaxt="n")

# To create desired 0,2,4,6 axis we manually create it below.
axis(side=1,at=seq(0,6,2),labels=seq(0,6,2))

## NOT QUITE RIGHT, X AXIS limited, but sample pic 
## shows no bars?