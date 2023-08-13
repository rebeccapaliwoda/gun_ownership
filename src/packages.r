# This script installs the r packages required for this notebook

# Package names
packages <- c("dplyr", "RCurl", "ggplot2", "lubridate", "scales")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# Packages loading
invisible(lapply(packages, library, character.only = TRUE))