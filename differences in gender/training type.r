# install.packages("ggplot2")
# install.packages("dplyr") 
library(ggplot2)
library(dplyr)

# read CSV-file
data <- read.csv("data/Final_data.csv")

# Calculate workout type percentage for male & female
workout_percentages <- data %>%
  group_by(Gender, Workout_Type) %>%
  summarise(n = n(), .groups = "drop_last") %>%
  mutate(Percentage = 100 * n / sum(n))

# Create bar plot
ggplot(workout_percentages, aes(x=Workout_Type, y=Percentage, fill=Gender)) + 
  geom_bar(stat="identity", position=position_dodge()) +
  labs(
    title = "Prozentualer Anteil des Trainingstyps pro Geschlecht",
    x = "",
    y = "Prozentanteil (%)",
    fill = "Gender"
  ) +
  theme_minimal() +
  theme(plot.title=element_text(hjust=0.5)) +
  geom_text(aes(label=paste0(round(Percentage,1))), position = position_dodge(width = 0.9),vjust = -0.5) + 
  scale_y_continuous(expand = expansion(mult = c(0, 0.1)))

