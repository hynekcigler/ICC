library(shiny)
library(psych)

shinyServer(function(input, output, session) {
  output$ICC <- renderPlot({plot(seq(-5,5,.01), input$c + (input$d-input$c) * 1/(1+exp(-input$a*(seq(-5,5,.01)-input$b))), 
                                 main="Item Characteristic Curve",lwd=3, type="l", xlab="latent trait",
                                 ylab="probability of correct response", ylim=c(0,1))
                            abline(v = input$theta, lty=2, col="gray")
                            abline(h = input$c + (input$d-input$c) * 1/(1+exp(-input$a*(input$theta-input$b))), 
                                   lty=2, col="gray")
                            if (input$d <= input$c) {
                              text(x=0, y=.7, labels = "Upper asymptote is lower or equal \nto the guessing parameter.\nThe ICC plot does not make \na lot of sense.", 
                                   pos=1, cex=2, par=(bg='white'))
                            }
                            }
                            )
  
  output$estimate <- renderText(round(input$c + (input$d-input$c) * 1/(1+exp(-input$a*(input$theta-input$b))), 2))
})