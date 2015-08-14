library(shiny)

library(caret);data(faithful); 

#set.seed(333)
#inTrain <- createDataPartition(y=faithful$waiting,p=1.0, list=FALSE)
#trainFaith <- faithful[inTrain,]; 
lm1 <- lm(eruptions ~ waiting,data=faithful)


shinyServer(
  
  function(input, output) {
    
    output$newGraph <- renderPlot({ plot(faithful$waiting,faithful$eruptions,pch=19,col="blue",xlab="Waiting",ylab="Duration")
                                    lines(faithful$waiting,lm1$fitted,lwd=3)}) 
    x <- reactive({as.numeric(input$wait)})
    
   
    output$inputValue1 <- renderText({x()})
    #newdata <- data.frame(waiting=reactive({as.numeric(input$wait)}))
    
    output$prediction1 <- renderPrint(coef(lm1)[1] + coef(lm1)[2]*x())
    
  }
)

