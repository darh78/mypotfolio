# Get and plor value of holding

get_quotes <- function(path_csv)  {

  lots <- read_csv(path_csv)

  # pending to add a cleaning step to include the selling date (if applicable)

  prices <- pbapply::pbmapply(lots$ticker, FUN = tq_get,
                              from = lots$buy_date,
                              get = "stock.prices",
                              to = today(),
                              SIMPLIFY = FALSE)

  prices <- mapply(cbind, prices,
                   "shares_hold" = lots$shares_hold,
                   "buy_date" = lots$buy_date,
                   "buy_price" = lots$buy_price,
                   SIMPLIFY = FALSE)

  prices <- do.call("rbind", prices)

  rownames(prices) <- NULL

  prices <- cbind(prices, "lot_value_at_buy" = prices$shares_hold * prices$buy_price)

  prices_cleaned <- prices %>%
    dplyr::select(symbol, date, close, shares_hold, buy_date, buy_price, lot_value_at_buy) %>% # compares with daily "close" price of the stock
    #dplyr::filter(date <= sell_date) %>%
    dplyr::mutate(lot_value_at_close = close * shares_hold,
                  gain_loss = round(lot_value_at_close - lot_value_at_buy, 3),
                  gl_pct = round(gain_loss / lot_value_at_buy, 4),
                  Lot_ID = paste0(symbol, "_", buy_date))

  prices_cleaned <- prices_cleaned

}
