
#_________________
####  SET UP  ####
#_________________

# renv::init()
# renv::activate()

library(MASS)
library(mice)

#renv::snapshot()


install

#_______________
####  FUNC  ####
#_______________


# Define all the function used in the code

MeanImputation = function(vec){
  vec[is.na(vec)] = mean( vec[!is.na(vec)] ) 
  return(vec)
}

MedianImputation = function(vec){
  vec[is.na(vec)] = median( vec[!is.na(vec)] ) 
  return(vec)
}

ModeImputation = function(vec){
  not_na = vec[!is.na(vec)]
  freq_table = as.data.frame(table(not_na))
  pos = which.max(freq_table$Freq)
  vec[is.na(vec)] = as.numeric(levels(freq_table$not_na)[pos])
  return(vec)
}


normalize = function(x){
  out = (x - min(x,na.rm = T)) / (max(x,na.rm = T) - min(x,na.rm = T))
  return(out)
}

#_______________
####  CODE  ####
#_______________


# DATASET
df_miss = airquality


##### Mean imputation  ####


#save inplace 
for(col in colnames(df_miss)){
  df_miss[col] = MeanImputation(df_miss[col])
}

#save in new dataframe 
df_mean = data.frame(
  apply(df_miss, 2, FUN = MeanImputation)
)


##### Median imputation  ####

#save inplace 
for(col in colnames(df_miss)){
  df_miss[col] = MedianImputation(df_miss[col])
}

#save in new dataframe 
df_median = data.frame(
  apply(df_miss, 2, FUN = MedianImputation)
)


##### Mode imputation  ####

#save inplace 
for(col in colnames(df_miss)){
  df_miss[col] = ModeImputation(df_miss[col])
}

#save in new dataframe 
df_mode = data.frame(
  apply(df_miss, 2, FUN = ModeImputation)
)


##### KNN imputation ####

# TODO

##### MICE imputation ####



