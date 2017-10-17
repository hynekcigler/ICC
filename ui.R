library(shiny)

shinyUI(pageWithSidebar(
  # Application title
  headerPanel("Item Characteristic Curve Simulator"),
  sidebarPanel(
    sliderInput("b", label = "Difficulty parameter (b)", min=-4, max=4, value=0, step=.01),
    sliderInput("a", label = "Discrimination parameter (a)", min=-1, max=2, value=1, step=.01),
    sliderInput("c", label = "Pseudo-guessing parameter (c)", min=0, max=1, value=0, step=.01),
    sliderInput("d", label = "upper asymptote (d)", min=0, max=1, value=1, step=.01),
    sliderInput("theta", label = "Respondent's latent trait (theta)", min=-4, max=4, value=0, step=.01),
    HTML("<hr><p><i>This simple tool was developed to help teaching about Item Response Theory (IRT). 
It simulates the item characteristic curve (ICC) under four-parameters (4PL) binary IRT model.</i></p>
         <p>&copy; 2017 Hynek Cígler<br>
         Department of psychology, Faculty of Social Studies<br>
         Masaryk University, Brno, Czech Republic<br>
         <a href='https://github.com/hynekcigler/ICC' target='_blank'>Source code on GitHub</a></p>")
    ),
  mainPanel(h3("Respondent's probability of correct response is", textOutput("estimate", inline=T), "."),
            plotOutput("ICC"),
            p("The item response function of the 4PL model is:"),
            HTML("<p style='text-align: center;'><img src='http://bit.ly/2gprCAL'></p>")
            
  ))
  
  )
