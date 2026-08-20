library(knitr)
library(tidyverse)
library(odbc)
library(DBI)
library(glue)
library(dplyr)
library(tidyr)
library(dbplyr)
library(lubridate)
library(ggplot2)
library(plotly)
library(scales)
library(openxlsx)
library(readxl)
library(rmarkdown)
# -------------------------------------------------------- Load Data -------------------------------------------------------------------------


df <- readxl::read_excel(
  "System Data Mappings - Updated 4.7.26.xlsx",
  sheet = "Visit Type Grouper",
  range = "A1:D1330") 

names(df) <- c(
  "PRC_NAME",
  "ASSOCIATIONLISTA",
  "ASSOCIATIONLISTB",
  "ASSOCIATIONLISTT"
)

# OAO_PRODUCTION DB connection
con_prod <- dbConnect(odbc(), "OAO Cloud DB Production")

dbWriteTable(
  con_prod,
  "ONCOLOGY_PRC_GROUPINGS_TABLEAU",
  df,
  append = TRUE,
  row.names = FALSE
)