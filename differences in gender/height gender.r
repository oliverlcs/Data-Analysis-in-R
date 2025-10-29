# install.packages("ggplot2")
library(ggplot2)

# read CSV-file
data <- read.csv("data/Final_data.csv")

# Create bar plot
ggplot(data, aes(x = Height..m., fill=Gender)) + 
  geom_density(alpha = 0.6) + # alpha: adds transparency
  labs(
    title = "Verteilung der Größe pro Geschlecht",
    x = "Größe (m)",
    y = "Dichte",
    fill = "Gender"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))