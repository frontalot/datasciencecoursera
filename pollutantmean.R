pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  #set path by pasting directory
  path = paste(directory,sep="",collapse="")
  
  #get the list of files in path
  filelist = list.files(path)
  
  #add csv extension and store the values as numeric
  filenames = as.numeric(sub("\\.csv$","",filelist))
  
  #get the list of files to be evaluated
  selectedfiles = filelist[match(id,filenames)]
  
  #read csv data
  data = lapply(file.path(path,selectedfiles),read.csv)
  
  #convert into data frame
  data = do.call(rbind.data.frame,data)
  
  #remove NA, calculate mean, and round to 3 digits
  round(mean(data[,pollutant],na.rm=TRUE),digits=3)
  
}