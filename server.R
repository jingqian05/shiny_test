#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plotly)
mygenes <- read.csv('/Users/qianjing/www/shiny-server/mytest/shiny_test2/gene_dist_head.tsv', header= TRUE, sep = "\t",fill = TRUE)
autosomes<-c("1","2","3","4","5","6","7","8","9","10",
             "11","12","13","14","15","16","17","18","19","20","21","22")


 

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  
  genefunction <-reactive({
    genes<- mygenes[ which(mygenes$chr %in% input$mycheckbox), ]
    genes$chr <- factor(genes$chr, levels = input$mycheckbox)
    genes  
  })
  
  output$plot <- renderPlot({
    
    # genefunction()
    ggplot(data = genefunction()) +
      geom_bar(mapping = aes(x = chr, fill = feature), width = 1)

  })
  
})
