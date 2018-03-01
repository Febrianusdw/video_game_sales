library(lubridate)
library(dplyr)
library(ggplot2)
library(shinydashboard)
library(varhandle)
library(shiny)
library(tidyr)

source("Helpers/chart.R")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {


  toppub <- vgame %>% 
    group_by(Publisher) %>% 
    tally() 

  output$toppub <- renderInfoBox({
    infoBox(
      title = "Most Release", 
      value = toppub[match(max(toppub$n),toppub$n),"Publisher"],width=6,
      icon=icon("cubes"), 
      subtitle = "Top publisher by games title launch")
    })
  
  avgsales <-vgame %>%
    summarize(avgs=mean(Global_Sales))
  
  output$avgsales <-renderInfoBox({
    infoBox(
      title = "Average Sales", 
      value = round(avgsales$avgs,digits=2),"orange", width=6,
      icon=icon("shopping-cart"), 
      subtitle = "Annual video game sales until 2016")
  })
  
  output$plot2 <- renderPlot({
    vgsales <- vgame%>%
      filter(Publisher == input$input.pub)%>%
      ggplot(aes(x=Year_of_Release,y=Global_Sales))+
      geom_col()
    vgsales
  })
  
  output$plot1 <- renderPlot({
    vgsales <- vgame%>%
      filter(Publisher == input$input.pub)%>%
      select(Year_of_Release, NA_Sales,EU_Sales)%>%
      gather(key="key",value="value",Year_of_Release)%>%
      mutate(key=as.factor(key))%>%
      ggplot(aes(x=Year_of_Release,y=value,group=key))+
      geom_col(aes(fill=key,position="fill"))
    vgsales
  })
  
  
})

