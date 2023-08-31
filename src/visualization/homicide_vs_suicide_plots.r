# This script creates visualizations for 2000 - 2020 firearm deaths (1)homicides and (2)suicides. The location of death was the decedents home.

# Open dataset file
homicide <- read.csv(file = "../data/interim/cause_of_death_home_homicide_2000_2020.csv")

# Open dataset file
suicide <- read.csv(file = "../data/interim/cause_of_death_home_suicide_2000_2020.csv")

# Create plot for firearm homicides
hom <- ggplot() +
            geom_line(data = homicide, aes(year, h)) +
            labs(title = "Homicide by Firearm") +
            theme(axis.title.y = element_blank(), 
                        axis.title.x = element_blank(), 
                        plot.title = element_text(size = 12))

# Create plot for firearm suicides 
sui <- ggplot() +
            geom_line(data = suicide, aes(year, s)) +
            labs(title = "Suicide by Firearm") +
            theme(axis.title.y = element_blank(), 
                        axis.title.x = element_blank(), 
                        plot.title = element_text(size = 12))

# Combine plots into one visualization
ggarrange(hom, sui) +
    labs(title = "2000-2020 Firearm Homicides & Suicides",
            subtitle = "Decedent's Home Location of Death",
            caption = "Source: Centers for Disease Control and Prevention, National Center for Health Statistics. National Vital Statistics System, Mortality 2000-2020 on CDC WONDER Online Database") +
    theme(plot.margin = unit(c(1,0.25,.25,0.25), "cm"),
            plot.title = element_text(vjust = 4,
                                size = 18),
            plot.subtitle = element_text(vjust = 4,
                                    size = 15,
                                    margin = margin(b = .25, unit = "cm")),
            legend.position = "top",
            legend.text = element_text(size = 8),
            plot.caption = element_text(
                                size = 8,
                                hjust = 0.5,
                                margin = margin(t = .5, unit = "cm")))