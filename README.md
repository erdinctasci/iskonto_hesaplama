## İskonto yüzdesi hesaplama aracı
 `library(shiny)` ile gerekli olan kütüphane import ediliyor.  
Aşağıdaki kod bloğunda kullanıcının girdilerinin yazılacağı panel oluşturuluyor ve bu değerler okunuyor.  

```
ui <- fluidPage(
  titlePanel("Fiyat ve İskonto Hesaplama Aracı"),
  sidebarLayout(
    sidebarPanel(
      numericInput("price", "Fiyat:", value = 100, min = 0),
      numericInput("discount", "İskonto yapılacak tutar:", value = 10, min = 0)
    ),
    mainPanel(
      h3("İskonto tutarı fiyatın:", textOutput("percent_discount"))
    )
  )
)
```
Aşağıdaki kod bloğunda ise kullanıcının girdilerine göre iskonto yapılmak istenen tutar ana fiyatın yüzde kaçına denk geliyor ise bunu hesaplayıp daha sonra ekrana yazdırıyor.

```
server <- function(input, output) {
  
  
  percent_discount <- reactive({
    100 * input$discount / input$price
  })
  
  
  output$percent_discount <- renderText({
    paste(round(percent_discount(), 2), "%")
  })
}
```

Arayüz ve sunucuyu başlatabiliriz.
```
shinyApp(ui = ui, server = server)
```


![alt text](https://i.imgur.com/fpjmNuR.jpg)
