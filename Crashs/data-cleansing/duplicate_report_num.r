# Load necessary library
# install.packages("dplyr")
library(dplyr)
library(knitr)
library(janitor)
library(formattable)
library(DT)

# Get current working directory
# current_directory <- getwd()
# print(current_directory)

# load data
data <- read.csv("./data/Crash_Reporting_Drivers_Data.csv")

# Using janitor to achieve a similar result
library(janitor)
duplicate_reports <- data %>%
  get_dupes(`Report.Number`) %>%
  arrange(`Report.Number`)

print(head(duplicate_reports, 5))

# # Select specific columns and display the first 5 rows in a nice table
# duplicate_reports %>%
#   head(5) %>%
#   select(Report.Number, dupe_count, Person.ID) %>% # Select the columns you want
#   kable(
#     col.names = c("Report Number", "Dupe Count", "Person ID"), # Custom column names
#     caption = "Top 5 Duplicate Reports" # Add a table caption
#   )

# # Create the beautiful table using formattable
# duplicate_reports %>%
#   head(5) %>%
#   select(`Report.Number`, dupe_count, `Person.ID`) %>%
#   formattable(
#     list(
#       # Define formatting for specific columns
#       `Report.Number` = formatter("span"),
#       dupe_count = color_bar("lightblue"),
#       `Person.ID` = formatter("span", style = "font-family: monospace;")
#     ),
#     # Rename columns for the final display
#     col.names = c("Report Number", "Duplicate Count", "Person ID")
#   )



duplicate_reports %>%
  arrange(desc(dupe_count)) %>%
  distinct(`Report.Number`, .keep_all = TRUE) %>%
  head(5) %>%
  select(`Report.Number`, dupe_count, `Person.ID`) %>%
  formattable(
    list(
      `Report.Number` = formatter("span"),
      `Person.ID` = formatter("span", style = "font-family: monospace;")
    ),
    col.names = c("Report Number", "Duplicate Count", "Person ID")
  )

# Create the beautiful, interactive table using DT 
# ! Resource heavy, do not use in .qmd
# duplicate_reports %>%
#   select(`Report.Number`, `Person.ID`, dupe_count) %>%
#   datatable(
#     # --- Basic Table Setup ---
#     colnames = c("Report Number", "Person ID", "Duplicate Count"), # Rename columns
#     caption = "Interactive Table of Duplicate Reports",
#     filter = 'top', # Add column filters
#     options = list(
#       pageLength = 5, # Show 5 entries per page
#       autoWidth = TRUE
#     )
#   )

