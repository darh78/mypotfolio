# Plot holding value

plot_holdings <- function(df) {

  df %>%
    highcharter::hchart(showInLegend = FALSE,
                        type = "areaspline",
                        highcharter::hcaes(x = date, y = gain_loss),
                        marker = list(enabled = FALSE),
                        color = "#4B5463",
                        fillColor = "#5FA147",
                        negativeFillColor = "#CC3D2D",
                        fillOpacity = 0.4) %>%
    highcharter::hc_tooltip(useHTML = TRUE,
                            headerFormat = "",
                            pointFormat = "{point.symbol} <br>
                            Date: {point.date} <br>
                            Stock value: {point.close} <br>
                            Gain_Loss: {point.gain_loss}",
                            borderWidth = 1,
                            borderColor = "#000000") %>%
    highcharter::hc_add_theme(hc_theme_smpl()) %>%
    highcharter::hc_xAxis(title = list(text = "Date")) %>%              # X axis definition
    highcharter::hc_yAxis(title = list(text = "Gain Loss")) %>%         # Y axis definition
    highcharter::hc_credits(enabled = TRUE,                             # add credits
                            text = "Source: Yahoo Financial, through `tidyquant`package")
  
}
