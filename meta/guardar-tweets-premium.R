if (!require("pacman")) { install.packages("pacman") }
pacman::p_load(rtweet, httpuv, dplyr, lubridate, glue)

token <- create_token(
  app = "extract_data_with_r",
  consumer_key = api_key,
  consumer_secret = api_secret_key)

data <- search_fullarchive("#datosdemiercoles", n = 1000, fromDate = "201911010000", toDate = "201912100000",
                   env_name = "development", safedir = NULL, parse = TRUE, token = token)


semanas_45_a_50 <- data

save(semanas_45_a_50, file = paste0("meta/2019/", Sys.Date(), ".rda"))