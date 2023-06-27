install.packages('https://cran.r-project.org/src/contrib/remotes_2.4.2.tar.gz', clean = T)
remotes::install_version("BiocManager", clean = T)

BiocManager::install(version = '3.16', ask = FALSE)
bioc_packages <- read.csv("bioc_packages.csv")$Package
BiocManager::install(bioc_packages, version = "3.16", clean = TRUE, upgrade = FALSE)
