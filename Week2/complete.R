complete <- function(directory, id){
  
 results <- if(directory == "specdata")
 {
   directory_path <- paste("./", directory, "/", sep = "")
   
   files_list <- list.files(path = directory_path)
   
   file_paths <- paste(directory_path, files_list, sep = "")
   
   my_data <- data.frame();
   
   for (fileid in id)
   {
     file_data <- read.csv(file_paths[fileid], header = TRUE, sep = ",")
     complete_rows <- sum(complete.cases(file_data));
     
     record <- c( fileid, complete_rows)
     
     my_data <- rbind(my_data, record)
   }
  colnames(my_data) <- c("id", "nobs")
   my_data
  
   
 }
 else
 {
   "Invalid directory"
 }
 
 results
  
}