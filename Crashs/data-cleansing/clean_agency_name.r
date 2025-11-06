library(dplyr)

# load data
data <- read.csv("./data/Crash_Reporting_Drivers_Data.csv")

data$Agency.Name <- recode(data$Agency.Name,
                            "TAKOMA" = "Police Takoma Park",
                            "Takoma Park Police Depart"   = "Police Takoma Park",
                            "Police Department Takomato"  = "Police Takomato",
                            "GAITHERSBURG"                = "Police Gaithersburg",
                            "Gaithersburg Police Depar"   = "Police Gaithersburg",
                            "MCPARK"                      = "Police Maryland-National Capital",
                            "Maryland-National Capital"   = "Police Maryland-National Capital",             
                            "MONTGOMERY"                  = "Police Montgomery County",
                            "Montgomery County Police"    = "Police Montgomery County",
                            "ROCKVILLE"                   = "Police Rockville",
                            "Rockville Police Departme"   =  "Police Rockville",
                           )

print(paste("Unique categories in agency name:", (sort(unique(data$Agency.Name)))))