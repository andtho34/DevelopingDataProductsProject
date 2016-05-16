#ui.R Course Project


shinyUI(fluidPage(
        titlePanel("Course Project: Concrete Strength"),
        
        sidebarLayout(
                sidebarPanel(h4("Select a Variable"),
                             helpText("Plot concrete compressive strength versus one of the following predictors"),
                             radioButtons("radio", label = h4("Predictors"),
                                          choices = list("Cement", "Water", "Fine Aggregate", "Coarse Aggregate"))
                ),
                mainPanel(
                        tabsetPanel(
                                tabPanel("Plots",
                                         textOutput("text1"),
                                         plotOutput("plot")),
                                tabPanel("Prediction",
                                         h3("Enter Values"),
                                         helpText("Enter values for the following to generate a
                                                  prediction of concrete compressive strength.
                                                  Prediction is by a simple multivariate linear model."),
                                         numericInput('cem', 'Cement, kg/m^3', value=282, step=5, min=102, max=540),
                                         numericInput('wat', 'Water, kg/m^3', value=182, step=5, min=122, max=247 ),
                                         numericInput('fa', 'Fine Aggregate, kg/m^3', value=774, step=5, min=594, max=993),
                                         numericInput('ca', 'Coarse Aggregate, kg/m^3', value=973, step=5, min=801, max=1145),
                                         h5('Predicted Concrete Compressive Strength (MPa):'),
                                         verbatimTextOutput("prediction")
                                ),
                                tabPanel("Documentation/Help",
                                         h4("Plotting Panel:"),
                                         helpText("Use the radio buttons on the sidebar to change
                                                  the plots in the Plots panel. The four listed
                                                  predictors can all be plotted against compressive
                                                  strength."),
                                         h4("Prediction Panel:"),
                                         helpText("The Prediction panel allows the user to
                                                  select values of the four parameters in order
                                                  to generate a prediction of concrete compressive
                                                  strength, which is displayed at the bottom. 
                                                  Prediction is done using a simple multivariate linear 
                                                  model, which is carried out in the file helpers.R, in the 
                                                  function generatePrediction. Note: This prediction does not 
                                                  incorporate all variables in the dataset, and is a rough approximation."),
                                         h4("Data:"),
                                         helpText("Data is from the concrete dataset in the 
                                                  AppliedPredictiveModeling package, initially 
                                                  from the UCI Machine Learning Repository."),
                                         helpText("Citation: I-Cheng Yeh, Modeling of strength of high performance concrete using artificial neural networks, Cement and Concrete Research, Vol. 28, No. 12, pp. 1797-1808 (1998). "),
                                         helpText("Dataset Information at: http://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength"),
                                         h4("Shiny App"),
                                         helpText("This shiny app was developed by Andrew Thorsen
                                                   for the course project in the Developing Data Products 
                                                  course in the Data Science Specialization on Coursera, 
                                                  through Johns Hopkins University."))
                        )
                )
        )
))