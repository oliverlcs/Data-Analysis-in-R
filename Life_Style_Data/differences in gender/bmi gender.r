# install.packages("ggplot2")
# install.packages("dplyr") 
library(ggplot2)
library(dplyr)

# read CSV-file
data <- read.csv("data/Final_data.csv")

data <- data %>%
  group_by(Gender) %>%
  mutate(
    BMI_group = cut(
      BMI,
      breaks = if (unique(Gender) == "Male") {
        c(0, 20, 26, 31, 41, max(BMI, na.rm = TRUE) + 1)
      } else {
        c(0, 19, 25, 31, 41, max(BMI, na.rm = TRUE) + 1)
      },
      include.lowest = TRUE,
      right = FALSE,
      labels = c("Untergewicht", "Normalgewicht", "Übergewicht", "Adipositas", "starke Adipositas")
    )
  ) %>%
  ungroup()

bmi_per_gender <- data %>%
  group_by(Gender, BMI_group) %>%
  summarise(n = n(), .groups = "drop_last") %>%
  mutate(Percentage = 100 * n / sum(n))

# Create bar plot
ggplot(bmi_per_gender, aes(x=BMI_group, y=Percentage, fill=Gender)) + 
  geom_bar(stat="identity", position=position_dodge()) +
  labs(
    title = "Prozentualer Anteil des BMIs pro Geschlecht",
    x = "",
    y = "Anteil des BMIs (%)",
    fill = "Gender"
  ) +
  theme_minimal() +
  theme(plot.title=element_text(hjust=0.5)) +
  geom_text(aes(label=paste0(round(Percentage,1))), position = position_dodge(width = 0.9),vjust = -0.5) + 
  scale_y_continuous(expand = expansion(mult = c(0, 0.1)))