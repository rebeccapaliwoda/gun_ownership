#Location: Decedents Home

homicide <- read.csv(file = "../data/interim/cause_of_death_home_homicide_2000_2020.csv")

suicide <- read.csv(file = "../data/interim/cause_of_death_home_suicide_2000_2020.csv")

hom <- ggplot() +
            geom_line(data = homicide, aes(year, h), color = "#940f05") +
            labs(title = "Homicide by Firearm") +
            theme(axis.title.y = element_blank(), 
                    axis.title.x = element_blank())

sui <- ggplot() +
            geom_line(data = suicide, aes(year, s), color = "blue") +
            labs(title = "Suicide by Firearm") +
            theme(axis.title.y = element_blank(), 
                    axis.title.x = element_blank())

ggarrange(hom, sui) +
    labs(title = "2000-2020 Firearm Homicides & Suicides",
            subtitle = "Decedent's Home Location of Death",
            caption = "Source: Centers for Disease Control and Prevention, National Center for Health Statistics. National Vital Statistics System, Mortality 1999-2020 on CDC WONDER Online\n                      Database, released in 2021") +
    theme(plot.margin = unit(c(1,0.5,1,0.5), "cm"),
            plot.title = element_text(vjust = 4,
                                size = 18),
            plot.subtitle = element_text(vjust = 4,
                                    size = 12,
                                    margin = margin(b = .25, unit = "cm")),
            legend.position = "top",
            legend.text = element_text(size = 8),
            axis.text = element_text(size = 12),
            plot.caption = element_text(
                                size = 8,
                                hjust = -0.055,
                                margin = margin(t = .5, b = .25, unit = "cm")))
