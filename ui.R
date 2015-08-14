library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Visit to the Old Faithful"), 
    
    sidebarPanel(
      h4('Eruption predictions based on historical data'),
      plotOutput('newGraph')
    ),
    
   mainPanel(
        h4('Introduction'),
        p('Eruption Data has been collected over a period of time \
          and fitted into a model so that it can be used \
          to predict wait times to see eruptions of certain durations.'),
        p('Here is a plot of the waiting time vs eruption durations.\
        Eruptions of short durations are more common and have shorter waiting times, \
        while eruptions of longer durations have considerable waiting times, \
        as shown in the following diagram.'),
        p('Dots represent actual values, while the line shows a \
        linear model fitted to the data for estimation purposes.'),
        p('In the text box on the left, enter the number of minutes you plan to spend\
        at the geyser and push the submit button. The algorithm uses the linear model to \
          predict the duration of eruption you may be able to see in your time'),
        textInput('wait', 'wait time in minutes', 45),
        submitButton('Submit'),
        p('You entered'),
        verbatimTextOutput("inputValue1"),
        h4('You may be able to see '),
        verbatimTextOutput("prediction1"),
        p(' minute Faithful eruption.')
        
   )
       
  )
)

