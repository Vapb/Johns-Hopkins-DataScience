
### Return Polmean Part 1

my_di <- 'C:/Users/victo/Documents/Githut/Johns-Hopkins-DataScience/specdata'
 

polmean <- function(directory, pol, id = 1:322) {
    monitors_list <- dir(directory, full.names=T) # List with all files paths
    
    if (pol == 'nitrate'){ 
        coluna <- 3
    }else if (pol == 'sulfate'){
        coluna <- 2
    }else{
        return('ERROR IN POL')
    }
    
    total_mean <- 0
    df <- data.frame()
    for (i in id) {
        print(monitors_list[i])
        df <- rbind(df,read.csv(monitors_list[i]))
    }

    print(df)
    return(mean(df[,coluna],na.rm = T))
    
    
}


x <- data.frame("SN" = 1:2, "Age" = c(21,15), "Name" = c("John","Dora"))
###########

# return dataframe ID,Cols 

complete <- function(directory, id= 1:322) {
    monitors_list <- dir(directory, full.names=T) # List with all files paths
    
    df_al <- data.frame()
    for (i in id) {
        df <- read.csv(monitors_list[i])
        df <- na.omit(df)
        len <- nrow(df)
        df_al <- rbind(df_al, c(i,len))
    }
 return(df_al)   
}


#########

cor_thr <- function(directory, threshold){
    monitors_list <- dir(directory, full.names=T) # List with all files paths
    
    df_all <- data.frame(matrix(ncol = 3,nrow = 0))
    
    
    for (i in 1:322){
        df <- read.csv(monitors_list[i])
        df <- na.omit(df)
        len <- nrow(df)
        corr <- cor(df[,2],df[,3])
        id <- i
        new_row <- c(id,len,corr)
        df_all <- rbind(df_all,new_row)
        print(new_row)
    }
    
    colnames(df_all) <- c('ID','Threshold','Cor')
    df_all <- df_all[df_all$Threshold >= threshold,]
    return(df_all)
    
}


##########
