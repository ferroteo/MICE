# MICE
learning the MICE package for data imputation in R

see the package vignette [here](https://amices.org/mice/)

# CREDITS
this code is inspired by a video by "Liquid Brain Bioinformatics" 

# RENV
## *environment creation*

install.packages("renv") <br>
renv::init() <br>
renv::activate()

## *package update*
to update the packages in use into the lockfile: 

renv::snapshot()

## *environment copy*
to initialize an environment given my **renv.lock** file use: 

renv::init() 


