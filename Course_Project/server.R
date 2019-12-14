library(shiny)
library(dplyr)
library(readr)
library(ggplot2)

shinyServer(function(input, output) {
    
    IMDB_Movie_Data <- read_csv("IMDB-Movie-Data.csv") # dataset from https://www.kaggle.com/PromptCloudHQ/imdb-data 
    data_movies <- IMDB_Movie_Data[,c(2,7,8,9,10,11)] # select some of the parameters
    names(data_movies)[3] <- "Runtime_Minutes" # rename runtime column
    names(data_movies)[6] <- "Revenue_MillionUSD" # rename revenue column
    
    # the output graph
    output$plot1 <- renderPlot({
        x_axis <- input$radiobuttons_x # input from radio buttons x
        y_axis <- input$radiobuttons_y # input from radio buttons y
        color_axis <- input$radiobuttons_color # input from radio buttons color
        
        # plot with ggplot
        gg <- ggplot(data = data_movies,
                     aes_string(x = x_axis, y = y_axis, color = color_axis))
        gg <- gg + geom_point() + scale_color_gradientn(colors = rainbow(4)) +  theme_gray(base_size = 16)
        gg
        })
})