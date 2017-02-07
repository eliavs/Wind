library(shiny)
userdata <- list('Upload a file'=c(1))
# Define UI for random distribution application 
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Eliav's Wind Rose"),

  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the br()
  # element to introduce extra vertical spacing
  sidebarPanel(
  
  #textInput("pollutant","Please enter pollutant","no pollutant"),
  br(),
    fileInput("bugs", "Input Data"),
	br(),
	#selecting the wind direction
	selectInput("wd","Please enter Wind direction",names(userdata),selected="wd"),
	br(),
	selectInput("ws","Please enter Wind speed",names(userdata),selected="ws"),
	#selecting a pollutant
	selectInput("pollutant","Please enter pollutant",choices=c("no pollutant",names(userdata)),selected="no pollutant"),
	br(),
	selectInput("directions","Wind Directions",seq(from=4, to=36, by=4),selected=12),
	radioButtons("sorted", "Sort by:",
				 c("no sorting"="no sorting",
				 "season" ="season",
				 "hour"="hour",
				 "weekday"="weekday",
				 "day/night"="day_night")
 
   ),
     HTML("<hr>"),
	 h6("Instructions at", a("Luft Gescheft", 
            href="http://luftgesheft.wordpress.com/2013/08/13/eliavs-wind-rose-instructions/", target="_blank"))
			),
  # Show a tabset that includes a plot, summary, and table view
  # of the generated distribution
  mainPanel(
    tabsetPanel(
      tabPanel("Plot", plotOutput("plot"), verbatimTextOutput("summary")), 
      #tabPanel("data Summary", verbatimTextOutput("summary"),downloadButton('downloadPlot1', 'Download table')), 
      tabPanel("Wind Rose", plotOutput("windrose"),downloadButton('downloadPlot2', 'Download rose')),
	  tabPanel("Pollution Rose",plotOutput("pollutionrose"),selectInput("k", "K value" ,c(0,0.5,1,seq(from=10, to=100, by=10)),selected=100), downloadButton('downloadPlot3', 'Download rose'))
    )
  )
))
