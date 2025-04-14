library(tidyverse)
fish <- read_csv ("https://raw.githubusercontent.com/rachelss/439_data/main/Copy%20of%20fish_nutrient_excretion_students%20-%20Data%20for%20students.csv")
mtsthelens1 <- read.csv("https://raw.githubusercontent.com/rachelss/439_data/main/mt_st_helens_veg_plots%20-%20mt_st_helens_veg_plots.csv")
mtsthelens2 <- read_csv("https://raw.githubusercontent.com/rachelss/439_data/main/mt_st_helens_veg_structure_plot_year%20-%20mt_st_helens_veg_structure_plot_year.csv")
glimpse(fish)
glimpse(mtsthelens1)
glimpse(mtsthelens2)

#relationship between temp and N excretion
ggplot(fish, aes(Temperature_C, `Per capita N excretion rate`)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm")

#relationship between weight and N
ggplot(fish, aes(`Body mass_g`, `Per capita N excretion rate`))+ 
  geom_point() +
  geom_smooth(method = "lm")

#The frequency of different sizes of fish
ggplot(fish, aes(x = `Body mass_g`)) +
  geom_histogram(binwidth = 30, color = "blue", fill = "violet")+
  labs(title = "Frequency of Different Fish Sizes",
       x = "Body Mass (g)",
       y = "Fish ID/Count") +
  theme_minimal()

#Consider what you would need to do to be able to recreate the remaining plots
#The relationship between N excretion and weight for a single temperature
ggplot(fish, aes(x = `Body mass_g`, y = `Per capita N excretion rate`)) +
  geom_point(color = "blue", fill = "violet") +
  geom_smooth(method = "lm") +
  facet_wrap(fish$Temperature_C)


labs(title = "rel btn temp vs N",
     x = "Body Mass (g)",
     y = "Fish ID/Count") +
  theme_minimal()

#Consider what you would need to do to be able to recreate the remaining plots
#Plotting average N excretion related to temperature
# ggplot(fish, aes(x = `Body mass_g`, y = `Per capita N excretion rate`)) +
#  geom_point(binwidth = 30, color = "blue", fill = "violet") +
#  geom_smooth(method = "lm") +
#  facet_wrap(fish$Temperature_C)


labs(title = "rel btn temp vs N",
     x = "Body Mass (g)",
     y = "Fish ID/Count") +
  theme_minimal()

#Second assignment 1
#the relationship between N excretion and temperature using boxplots.
ggplot(fish, aes(factor(x = Temperature_C), y = `Per capita N excretion rate`)) +
  geom_boxplot(color = "blue", fill = "lightblue", alpha = 0.6) +
  labs(x = "Temperature (°C)", y = "Per capita N excretion rate") +
  theme_minimal()

#the relationship between N excretion and weight for a single temperature.
fish_filtered <- fish %>%
  filter(Temperature_C == 16.4)

ggplot(fish_filtered, aes(x = `Body mass_g`, y = `Per capita N excretion rate`)) +
  geom_point(color = "blue", alpha = 0.6) +  # Scatter plot with transparency
  geom_smooth(method = "lm", color = "red", se = TRUE) +  # Linear regression line
  labs(title = "N Excretion vs Weight at 16.4°C",
       x = "Weight (g)", 
       y = "Per capita N excretion rate") +
  theme_minimal()
# doing the above for all temperature
ggplot(fish, aes(x = `Body mass_g`, y = `Per capita N excretion rate`)) +
  geom_point(color = "blue", alpha = 0.6) +  # Scatter plot with transparency
  geom_smooth(method = "lm", color = "red", se = TRUE) +  # Linear regression line
  labs(title = "N Excretion vs Weight Across Temperatures",
       x = "Weight (g)", 
       y = "Per capita N excretion rate") +
  facet_wrap(~Temperature_C) #+  # Creates separate panels for each temperature
  #theme_minimal()
#average nitrogen excretion increases with increasing temperature
avg_excretion <- fish %>%
  group_by(Temperature_C) %>%
  summarise(avg_N_excretion = mean(`Per capita N excretion rate`, na.rm = TRUE))

ggplot(avg_excretion, aes(x = Temperature_C, y = avg_N_excretion)) +
  geom_point(color = "blue", size = 3) +  # Scatter plot of averages
  geom_smooth(method = "lm") +  # Line to show trend
  labs(title = "Average Nitrogen Excretion vs Temperature",
       x = "Temperature (°C)",
       y = "Average N Excretion Rate") +
  theme_minimal()

#her way of doing the above
fish %>% group_by(Temperature_C) %>%
  summarise(avg_N_excretion = mean(`Per capita N excretion rate`)) %>%
  ggplot(aes(x = Temperature_C, y = avg_N_excretion)) +
  geom_point() +
  geom_smooth(method = "lm") 
