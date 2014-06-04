
# Set string Variables
localdir=getwd()
filename="household_power_consumption.txt"

# IF file doesn't exist in working direcotry, dl to tmp and expand in wd.
if(!(file_test(op="-f",x=paste(localdir,'/',filename,sep='')))){
# create a temporary file and a temporary directory on your local disk
tf <- tempfile()
td <- tempdir()

# run the download file function, download as binary..  save the result to the temporary file
download.file(
  "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
  tf ,
  mode = 'wb' 
)

# unzip the files to the temporary directory
files <- unzip( tf , exdir = getwd() )
}

require(lubridate)
require(dplyr)

#Read in and subset
full_power = read.csv(paste(localdir,'/',filename,sep=''),
  sep=";",stringsAsFactors=FALSE,na.strings="?")

full_power$Date=dmy(full_power$Date)
subpower=filter(full_power,
                Date>=mdy("02012007"),Date<=mdy("02022007"))
