## Import Dividend Table

library(readxl)
library(dplyr)

# Defining columns' types 
nms <- c(rep("text", 4), rep("numeric",2),
         rep("text", 2), rep("numeric", 5),
         "text", "numeric", rep("date", 2),
         rep("numeric", 7), "text", rep("numeric", 30),
         "text", rep("numeric", 3))

# Importing Excel file to a tibble
all_ccc <- read_xlsx("data/U.S.DividendChampions.xlsx",
                    sheet = "All CCC",
                    skip = 5,
                    col_types = nms)

# Refine names of tibble

var_nms <- names(all_ccc)
var_nms[6] <- "CCC_Seq"
var_nms[7] <- "Fees_DR"
var_nms[8] <- "Fees_SP"
var_nms[10] <- "Div_Yield"
var_nms[11] <- "Current_Div"
var_nms[12] <- "Payout_per_year"
var_nms[14] <- "Q_Sched"
var_nms[15] <- "Prev_Payout"
var_nms[16] <- "last_incr_ex_div"
var_nms[17] <- "last_incr_payout"
var_nms[18] <- "MR_inc_pct"
var_nms[19] <- "DGR_1yr"
var_nms[20] <- "DGR_3yr"
var_nms[21] <- "DGR_5yr"
var_nms[22] <- "DGR_10yr"
var_nms[23] <- "A_D_5-10"
var_nms[24] <- "Past_5yr_DEG"
var_nms[26] <- "EPS_pct_payout"
var_nms[27] <- "TTM_PE"
var_nms[28] <- "FYE_Month"
var_nms[29] <- "TTM_EPS"
var_nms[31] <- "TTM_P-Sales"
var_nms[32] <- "MRQ_P-Book"
var_nms[33] <- "TTM_ROE"
var_nms[34] <- "TTM_Growth"
var_nms[35] <- "NY_Growth"
var_nms[36] <- "Past_5yr_Growth"
var_nms[37] <- "Est_5yr_Growth"
var_nms[38] <- "Mrkt_Cap"
var_nms[39] <- "Inside_Own"
var_nms[40] <- "Debt_Equity"
var_nms[41] <- "Tweed_Factor"
var_nms[42] <- "Chowder_Rule"
var_nms[44] <- "Est_Div_2020"
var_nms[45] <- "Est_Div_2021"
var_nms[46] <- "Est_Div_2022"
var_nms[47] <- "Est_Div_2023"
var_nms[48] <- "Est_Div_2024"
var_nms[49] <- "Est_5yr_Total_payback"
var_nms[50] <- "Est_5yr_Total_payback_pct"
var_nms[51] <- "Beta_5yr"
var_nms[52] <- "Current_price_vs_52wkL_pct"
var_nms[53] <- "Current_price_vs_52wkH_pct"
var_nms[54] <- "Current_price_vs_50d_MMA_pct"
var_nms[55] <- "Current_price_vs_200d_MMA_pct"
var_nms[57] <- "Streak_Began"
var_nms[58] <- "Recessions_Survived"
var_nms[59] <- "TTM_ROA"

names(all_ccc) <- var_nms

head(all_ccc)
