#install.packages("ggplot2")
#install.packages("patchwork")
library(ggplot2)
library(patchwork)

# read CSV-file
data <- read.csv("data/Final_data.csv")

# Calculate counts and percentage of male, female
gender_counts <- as.data.frame(table(data$Gender)) # gender_counts = DataFrame (=Table) with the only column "Gender"
colnames(gender_counts) <- c("Gender", "Count") # add 'Count' to the gender_counts DataFrame
gender_counts$Percent <- gender_counts$Count / sum(gender_counts$Count) * 100 # add 'Percent' to the gender_counts DataFrame

# Plot 1: Bar Chart
p1 <- ggplot(gender_counts, aes(x=Gender, y=Count, fill=Gender)) + # data=gender_counts, x=Gender, y=Count, color fill=based on Gender
  geom_col(width=0.6) + # define column width
  geom_text(aes(label=Count), vjust = -0.5) + # count values above bar + add spacing  
  labs(title="Anzahl der Geschlechter", x=NULL, y="Anzahl") + # title, remove x-label, add y-label
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) + # adds 10% space above bars
  theme_minimal() + # makes the background prettier
  theme(plot.title=element_text(hjust=0.5), legend.position = "none") # centers title, removes legend position

# Plot 2: Pie Chart
p2 <- ggplot(gender_counts, aes(x="", y=Percent, fill=Gender)) +
  geom_col(width=1) + # column width of pie chart sections
  coord_polar(theta="y") + # create pie chart: y-axis (=Percent) for angle
  geom_text(aes(label=paste0(round(Percent,1), "%")), position=position_stack(vjust=0.5)) + # idk
  labs(title = "Prozentualer Anteil") + # add title
  theme_void() + # remove background
  theme(
    plot.title=element_text(hjust=0.5, margin = margin(b = 20)), # center title, add margin
    legend.position="right", # position legend right
  )

# Combine both plots to one plot
p1 + p2