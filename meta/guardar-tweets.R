if (!require("pacman")) { install.packages("pacman") }
pacman::p_load(rtweet, httpuv, dplyr, lubridate, glue)

token <- create_token(
  app = "extract_data_with_r",
  consumer_key = api_key,
  consumer_secret = api_secret_key)

data <- search_tweets("#datosdemiercoles", n = 1000, type = "recent", retryonratelimit = TRUE, include_rts = TRUE)

assign(glue("semana", week(Sys.Date() - days(1))),
       data %>%
         filter(created_at > Sys.Date() - days(8) &
                  created_at < Sys.Date()
         )
)

try(dir.create("meta"))
try(dir.create(glue("meta/{year(Sys.Date())}")))

save(semana50, file = glue("meta/{year(Sys.Date())}/{Sys.Date() - days(1)}.rda"), compress = "xz")
