# This script creates the plot for U.S. home burglary rates 1995-2016

burglary <- subset(prop_crime_data, crime_type == "Burglary" &
    year >= 1995 & year <= 2016)

burglary$rate_per_1000_households <- burglary$rate_per_1000_households/100

burglary

ggplot(burglary, aes(year, rate_per_1000_households)) +
    geom_line(aes(color = rate_per_1000_households)) +
    geom_point(aes(color = rate_per_1000_households, size = 1)) +
    annotate("text",
        x = 1995.2,
        y = 0.43,
        label = "39.8%",
        size = 5,
        fontface = "bold") +
    annotate("text",
        x = 2015.2,
        y = 0.12,
        label = "15.3%",
        size = 5, 
        fontface = "bold") +
    scale_color_gradient(high = "#033f39", low = "#059c76") +
    labs(x = element_blank(),
        title = "1995-2016 U.S. Home Burglary Rate",
        subtitle = "Percent of U.S Homes Burglarized by Year",
        caption = "Source: U.S. Bureau of Justice Statistics: National Crime Victime Survey Data") + 
    scale_x_continuous(breaks = seq(1980, 2016, 5)) +
    scale_y_continuous(name = element_blank(), 
        expand = c(0, 0),
        limits = c(0, 0.5),
        labels = scales::percent) + 
    theme(plot.title = element_text( 
            size = 16,
            face = "bold",
            hjust = 0.4),
        plot.caption = element_text(hjust = -0.10, 
            margin = margin(b = .2, unit = "cm")),
        plot.subtitle = element_text(hjust = 0.42, 
            margin = margin(b = 0.4, unit = "cm")),
        legend.position = "none",
        plot.margin = margin(t = 0.55, r = 1, b = 0, l = 0.5, unit = "cm"),
        axis.title.y = element_text(margin = margin(r = 0.5, unit = "cm")),
        axis.title.x = element_text(margin = margin(b = 0.5, unit = "cm")),
        axis.text.x = element_text(size = 14, face = "bold"),
        axis.text.y = element_text(size = 12, face = "bold"), 
    )