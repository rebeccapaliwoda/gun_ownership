# This script creates the visualization that compares U.S. home gun ownership rate to home burglary rate

gun_ownership <- subset(hfr_per_year, hfr & year >= 1995 & year <= 2016)

cols <- c("#45495a", "#7581ad")

ggplot() +
        geom_area(data = gun_ownership,
                aes(x = year,
                    y = hfr,
                    fill = "#45495a")) +
        geom_area(data = burglary,
                aes(x = year,
                    y = rate_per_1000_households,
                    fill = "#7581ad")) +
        scale_x_continuous(breaks = seq(1995, 2016, 5),
                name = element_blank()) +
        scale_y_continuous(name = element_blank(),
                expand = c(0, 0),
                limits = c(0, 0.55),
                labels = scales::percent) +
        scale_colour_manual(values = cols) +
        scale_fill_manual(values = cols,
                name = element_blank(),
                labels = c("Homes with Firearm    ", "Homes Burglarized")) +
        labs(title = "Rate of U.S. Homes with Firearms vs. Homes Burglarized 1995-2016",
        caption = "Source: RAND Corporation State-Level Estimates of Household Firearm Ownership;\n               Bureau of Justice Statistics Rate of Property Victimizations, 1993-2021") +
        theme(legend.position = "top",
                legend.text = element_text(size = 13),
                plot.title = element_text(lineheight = .8,
                        vjust = 4,
                        size = 18),
                plot.margin = unit(c(1,1,1,1), "cm"),
                axis.text = element_text(size = 13),
                plot.caption = element_text(
                        hjust = -0.12,
                        margin = margin(t = .5, b = .25, unit = "cm")))