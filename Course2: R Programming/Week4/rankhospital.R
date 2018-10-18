rankhospital <- function(state, outcome, num = "best")
{
  outcomedata <<- read.csv("./Data/outcome-of-care-measures.csv")
  permissible_outcomes <- c("heart attack", "heart failure","pneumonia")
  col_names <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  if( !state %in% unique(outcomedata$State) )
  {
    stop("invalid state")
  }
  
  if(num == "best")
  {
    num <-1
  }
  
  if( !outcome %in% permissible_outcomes )
  {
    stop(" invalid outcome")
  }
  col <- col_names[which(permissible_outcomes == outcome)]
  
  
  state_data <- outcomedata[outcomedata[,"State"] == state,]
  results <- state_data[, c("State","Hospital.Name", col)]
  colnames(results) <- c("State", "Hospital.Name", "Rate")
  results$Rate <- as.numeric(as.character(results$Rate))
  results <- results[order(results[,3], results[,2]), ]
  results <- results[complete.cases(results),]
  if( num == "worst")

    {
    tail(results,1)
  }
  else
  {
    results[num, ]
  }

}