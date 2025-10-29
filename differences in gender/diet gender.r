# install.packages("ggplot2")
# install.packages("dplyr") 
library(ggplot2)
library(dplyr)

# read CSV-file
data <- read.csv("data/Final_data.csv")

# Calculate workout type percentage for male & female
diet_percentages <- data %>%
  group_by(Gender, diet_type) %>%
  summarise(n = n(), .groups = "drop_last") %>%
  mutate(Percentage = 100 * n / sum(n))

# Create bar plot
ggplot(diet_percentages, aes(x=diet_type, y=Percentage, fill=Gender)) + 
  geom_bar(stat="identity", position=position_dodge()) +
  labs(
    title = "Prozentualer Anteil der Ernährungsgewohnheit pro Geschlecht",
    x = "",
    y = "Prozentanteil (%)",
    fill = "Gender"
  ) +
  theme_minimal() +
  theme(plot.title=element_text(hjust=0.5)) +
  geom_text(aes(label=paste0(round(Percentage,1))), position = position_dodge(width = 0.9), size=3, vjust = -0.5) + 
  scale_y_continuous(expand = expansion(mult = c(0, 0.1)))

