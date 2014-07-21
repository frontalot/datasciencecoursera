complete <- function(directory, id = 1:332) {
  
  #set path by pasting directory
  path = paste(directory,sep="",collapse="")
  
  #get the list of files in path
  filelist = list.files(path)
  
  #add csv extension and store the values as numeric
  filenames = as.numeric(sub("\\.csv$","",filelist))
  
  #get the list of all files
  selectedfiles = paste(path,filelist,sep="/")

  #for and sum complete cases
  data <- rep(0,length(id))
  j <- 1 
  for (i in id) {
    
    currentfile <- read.csv(selectedfiles[i])
    data[j] <- sum(complete.cases(currentfile))
    j <- j + 1

  }

  print(data.frame(id=id,nobs=data))

}