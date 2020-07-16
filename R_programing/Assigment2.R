outcome <- read.csv("C:/Users/victo/Documents/Githut/Johns-Hopkins-DataScience/outcome-of-care-measures.csv", colClasses = 'character')
head(outcome)
colnames(outcome)

# Plot the 30-day mortality rates for heart attack
outcome[,11] <- as.numeric(outcome[,11]) 
hist(outcome[,11])



####################################################### Finding the best hospital in a state 

best <- function(state, outcome) {
    ## Read outcome data
    df_outcome <- read.csv("C:/Users/victo/Documents/Githut/Johns-Hopkins-DataScience/outcome-of-care-measures.csv", colClasses = 'character')
    df_outcome <- df_outcome[,c(2,7,11,17,23)]
    df_outcome[3:5] <- lapply(df_outcome[3:5], as.numeric) ## Fix numeric values
    
    ## Check state and outcome valid
    if (!outcome %in% c('heart attack', 'heart failure', 'pneumonia')){
        return(warning('Invalid Outcome'))
    }else if (!state %in% df_outcome$State){
        return(warning('Invalid State'))
    }else{
        # Subset Data and adjust Outcome
        df_outcome <- df_outcome[df_outcome$State == state,]
        
        if (outcome == 'heart attack'){
            outcome_list <- df_outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
            
        } else if (outcome == 'heart failure'){
            outcome_list <- df_outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
        } else {
            outcome_list <- df_outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
        }
        
        
        ## Return hospital name in that state with lowest 30-day death
        min_value <- min(outcome_list, na.rm = T)
        min_index <- which(outcome_list == min_value)
        if (length(min_index) > 1){
            return(sort(df_outcome[min_index,1])[1])
        }
        return(df_outcome[min_index,1])
        
    }
}



############### Ranking Hospitals

state <- 'TX'
outcome <- 'heart failure'
num = 4


rankhospital <- function(state, outcome, num) {
    ## Read outcome data
    df_outcome <- read.csv("C:/Users/victo/Documents/Githut/Johns-Hopkins-DataScience/outcome-of-care-measures.csv", colClasses = 'character')
    df_outcome <- df_outcome[,c(2,7,11,17,23)]
    df_outcome[3:5] <- lapply(df_outcome[3:5], as.numeric) ## Fix numeric values

    ## Check state and outcome valid
    if (!outcome %in% c('heart attack', 'heart failure', 'pneumonia')){
        return(warning('Invalid Outcome'))
    }else if (!state %in% df_outcome$State){
        return(warning('Invalid State'))
    }else{
        
        #Subset by state
        df_outcome <- df_outcome[df_outcome$State == state,]
        df_outcome$rank <- NA
        
        
        if (outcome == 'heart attack'){
            df_outcome$rank <- order(order(df_outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, df_outcome$Hospital.Name, runif(length(df_outcome$rank))))
            
        } else if (outcome == 'heart failure'){
            df_outcome$rank <- order(order(df_outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, df_outcome$Hospital.Name, runif(length(df_outcome$rank))))
        } else {
            df_outcome$rank <- order(order(df_outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, df_outcome$Hospital.Name, runif(length(df_outcome$rank))))
        }
        
        answer <- df_outcome[which(df_outcome$rank == num),1]
        return (answer)
        
        
    }
}



