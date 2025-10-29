# install.packages("ggplot2")
library(ggplot2)

# read CSV-file
data <- read.csv("data/Final_data.csv")

# Create bar plot
ggplot(data, aes(x=Workout_Frequency..days.week., fill=Gender)) + 
  geom_density(alpha = 0.6) + # alpha: adds transparency
  labs(
    title = "Verteilung der täglichen Kalorienaufnahme pro Geschlecht",
    x = "Kalorien",
    y = "Anzahl",
    fill = "Gender"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))