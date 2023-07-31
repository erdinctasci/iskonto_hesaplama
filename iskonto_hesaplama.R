library(shiny)


ui <- fluidPage(
  titlePanel("Fiyat ve İskonto Hesaplama Aracı"),
  sidebarLayout(
    sidebarPanel(
      numericInput("price", "Fiyat:", value = 100, min = 0),
      numericInput("discount", "İskonto yapılacak tutar:", value = 10, min = 0)
    ),
    mainPanel(
      h3("İskonto tutarı fiyatın:", textOutput("percent_discount")),
    )
    tags$footer(
    tags$div(style = "text-align: center;", "by Erdinç Taşçı"),
    style = "position: fixed; bottom: 0; font-size: 12px;"
  )
)

server <- function(input, output) {
  
  
  percent_discount <- reactive({
    100 * input$discount / input$price
  })
  
  
  output$percent_discount <- renderText({
    paste(round(percent_discount(), 2), "%")
  })
}


shinyApp(ui = ui, server = server)
