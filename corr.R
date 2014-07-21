corr <- function(directory, threshold = 0) {
  
  #set path by pasting directory
  path = paste(directory,sep="",collapse="")
  
  #get the list of files in path
  filelist = list.files(path)
  
  #add csv extension and store the values as numeric
  filenames = as.numeric(sub("\\.csv$","",filelist))
  
  nobsdataframe <- complete(directory)
  nobsthreshold <- nobsdataframe[nobsdataframe$nobs > threshold,]
  
  #default to vector of 0
  cr <- numeric()
  
  for(i in nobsthreshold$id){
    fileStr <- paste(directory,"/",sprintf("%03d",as.numeric(i)),".csv",sep="")
    data <- read.csv(fileStr)
    cr <- append(cr,cor(data$sulfate,data$nitrate,use="na.or.complete"))
  }
  
  #round to 5 digits
  round(cr,digits=5)
  
}