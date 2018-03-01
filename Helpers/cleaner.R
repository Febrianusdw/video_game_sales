library(dplyr)
library(varhandle)

vgame <- read.csv("Data_input/Video_Games_Sales_as_at_22_Dec_2016.csv") %>%
  na.omit() %>%
  mutate(
    Name=as.character(Name),
    Year_of_Release = unfactor(Year_of_Release),
    Year_of_Release = as.integer(Year_of_Release))


