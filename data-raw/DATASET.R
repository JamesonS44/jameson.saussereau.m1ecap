url_jeu_de_donnees <- "https://www.kaggle.com/datasets/vijayuv/onlineretail"

library(readr)
library(dplyr)
library(lubridate)

retail <- read_csv("data-raw/OnlineRetail.csv") %>%
  mutate(InvoiceDate = dmy_hm(InvoiceDate)) %>%
  filter(format(InvoiceDate, "%Y-%m") == "2010-12") %>%
  filter(!is.na(Description), Quantity > 0, UnitPrice > 0) %>%
  select(Country, Description, Quantity, UnitPrice, InvoiceDate)

usethis::use_data(retail, overwrite = TRUE)
