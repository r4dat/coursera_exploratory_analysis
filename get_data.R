
# Set string Variables
localdir=getwd()
filename="summarySCC_PM25.rds"

# IF file doesn't exist in working direcotry, dl to tmp and expand in wd.
if(!(file_test(op="-f",x=paste(localdir,'/',filename,sep='')))){
# create a temporary file and a temporary directory on your local disk
tf <- tempfile()
td <- tempdir()

# run the download file function, download as binary..  save the result to the temporary file
download.file(
  "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
  tf ,
  mode = 'wb' 
)

# unzip the files to the temporary directory
files <- unzip( tf , exdir = getwd() )
}

# Read in data files.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")