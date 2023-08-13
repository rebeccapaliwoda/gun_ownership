# This script crates the plot for U.S. Home Gun Rates

options(repr.plot.width = 9, repr.plot.height = 5)

ggplot(hfr_per_year, aes(year, hfr)) +
    geom_line(aes(color = (hfr))) +
    geom_point(aes(color = (hfr), size = 2)) +
    annotate("text", 
        x = 1982.2, 
        y = 0.56, 
        label = "52%", 
        size = 5, 
        fontface = "bold") +
    annotate("text", 
        x = 2015.2, 
        y = 0.33, 
        label = "36.5%",
        size = 5, 
        fontface = "bold") +
    scale_color_gradient(high = "#03173f", low = "#0777f6") +
    labs(x = element_blank(),
        title = "1980-2016 Percent of U.S. Homes Containing Firearms",
        caption = "Data source: RAND Corporation State-Level Estimates of Household Firearm Ownership") + 
    scale_x_continuous(breaks = seq(1980, 2016, 5)) +
    scale_y_continuous(name = "Percent of Homes with Firearms", 
        expand = c(0, 0),
        limits = c(0, 0.7),
        labels = scales::percent) + 
    theme(plot.title = element_text( 
            size = 16,
            face = "bold",
            hjust = 0.35,
            margin = margin(b = 1, unit = "cm")),
        plot.caption = element_text(hjust = -0.15, 
            margin = margin(b = .25, unit = "cm")),
        panel.background = element_blank(),
        legend.position = "none",
        plot.margin = margin(t = 0.5, r = 0, b = 0, l = 0.5, unit = "cm"),
        axis.title.y = element_text(margin = margin(r = 0.5, unit = "cm")),
        axis.title.x = element_text(margin = margin(b = 1, unit = "cm")),
        axis.text.x = element_text(size = 14, face = "bold"),
        axis.text.y = element_text(size = 12, face = "bold")) +
    theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())
