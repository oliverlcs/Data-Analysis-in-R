library(janitor)

# load data
data <- read.csv("./data/Crash_Reporting_Drivers_Data.csv")

data %>%
  colnames()

data %>%
  clean_names() %>%
  colnames()