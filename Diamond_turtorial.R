
# Load Package ------------------------------------------------------------

library(tidyverse)    # load the tidyverse package 

Diamond_data <- diamonds 

# Renaming Variables  -----------------------------------------------------

rename(diamonds, length = x, width = y, height = z)

# Create new variables ----------------------------------------------------

d2 <- select(diamonds, carat, price) #selcting to show certain columns
d2  

mutate(d2, ppc = price / carat) #Adding a calculated column

mutate(diamonds, price = price * 1.27) #Change an existing column

summarize(diamonds, mean_carat = mean(carat), sd_carat = sd(carat)) #taking all data from 'carat' column and taking average of it and placing label

summarize(diamonds, sampl_size = n()) #shows the sample size (number of rows)
