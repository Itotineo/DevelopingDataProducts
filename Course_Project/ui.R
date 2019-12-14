shinyUI(fluidPage(
    
    titlePanel("Developing Data Products - Course Project: Shiny Application and Reproducible Pitch"),

    sidebarLayout(
        sidebarPanel(
            
            # radio buttons x
            radioButtons(inputId = "radiobuttons_x",
                         label = h3("Select x-axis"),
                         choices = c("Year", "Runtime_Minutes", "Rating", "Votes", "Revenue_MillionUSD"),
                         selected = "Rating"),
            
            # radio buttons y
            radioButtons(inputId = "radiobuttons_y",
                         label = h3("Select y-axis"),
                         choices = c("Year", "Runtime_Minutes", "Rating", "Votes", "Revenue_MillionUSD"),
                         selected = "Votes"),
            
            # radio buttons color
            radioButtons(inputId = "radiobuttons_color",
                         label = h3("Select color parameter"),
                         choices = c("Year", "Runtime_Minutes", "Rating", "Votes", "Revenue_MillionUSD"),
                         selected = "Year"),
        ),
        
        mainPanel(
            h4("This is the first part of the assignement (the Shiny application)."),
            h5("It's a graph of a movies dataset. You are able to control the graph by selecting the x-axis, the y-axis and the color parameter. The graph changes everytime a new parameter is selected."),
            h5("The dataset contains data of 1000 popular movies on IMDB from 2006 to 2016. I have chosen some parameters from the dataset: The year that the film released, the duration of the film in minutes, user rating for the movie 0-10, number of votes, and movie revenue in million US dollars."),
            
            # the graph
            plotOutput("plot1"))
    )
    ))