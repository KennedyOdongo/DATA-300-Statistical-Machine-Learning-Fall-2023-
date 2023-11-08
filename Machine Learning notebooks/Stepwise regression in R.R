library(MASS)

df<-read.csv("C:/Users/rodge/Downloads/California_Houses.csv")
ls(df)

fullmodel<-lm(Median_House_Value~., data =df)
fullmodel

intmodel<-lm(Median_House_Value~1, data=df)
intmodel

summary(stepAIC(intmodel, # start with a model containing no variables
                direction = 'forward', # run forward selection
                scope = list(upper = fullmodel, # the maximum to consider is a model with all variables
                             lower = intmodel), # the minimum to consider is a model with no variables
                trace = 1)) # do not show the step-by-step process of model selection

summary(stepAIC(fullmodel, # start with a model containing all the variables
                direction = 'backward', # run backward selection
                scope = list(upper = fullmodel, # the maximum to consider is a model with all variables
                             lower = intmodel), # the minimum to consider is a model with no variables
                trace = 1)) # do not show the step-by-step process of model selection
length(ls(df))
