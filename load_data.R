#
# Common reading part
#
sSelectedDataFileName = "selected_data.txt" 
sDataFileName         = "household_power_consumption.txt"

bSelDatdFileExist = file.exists(sSelectedDataFileName, showWarnings = FALSE)[1]

colsClass <- c("character", "character", rep_len("numeric", 7))

if( bSelDatdFileExist == TRUE ){
  print("Loading an existing selection of the database")
  #
  # Load data form existing subset
  #
  dataSubset <- read.csv(sSelectedDataFileName, colClasses = colsClass, na.strings=c("?"), sep=",")
}else{
  print("Loading database at first time")
  #
  # Load data at the first time  
  #
  dataSrc <- read.csv(sDataFileName, colClasses = colsClass, sep = ";", na.strings = "?")
  
  print("Converting the date format...")
  dataSrc$Date <- as.Date(dataSrc$Date, "%d/%m/%Y")      
  
  print("Selecting needed subset...")
  dataSubset <- subset(dataSrc, dataSrc$Date >= '2007-02-01' & dataSrc$Date <= '2007-02-02') 
 
  write.csv(dataSubset, sSelectedDataFileName, row.names = F)    
}








  