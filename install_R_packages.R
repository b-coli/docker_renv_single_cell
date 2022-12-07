install.packages('https://cran.r-project.org/src/contrib/remotes_2.4.2.tar.gz', clean = T)
remotes::install_version("BiocManager", version = "1.30.18", clean = T)

BiocManager::install(version = '3.15', ask = FALSE)
bioc_packages <- read.csv("bioc_packages.csv")$Package
BiocManager::install(bioc_packages, version = "3.15", clean = TRUE, upgrade = FALSE)

remotes::install_version("tidyverse", version = "1.3.1", clean = T)
remotes::install_version("Seurat", version = "4.2.0", clean = T)
remotes::install_version("targets", version = "0.13.5", clean = T)
remotes::install_version("tarchetypes", version = "0.7.1", clean = T)
remotes::install_version("rmarkdown", version = "2.16", clean = T)
remotes::install_version("future.callr", version = "0.8.0", clean = T)
remotes::install_version("IRkernel", version = "1.3", clean = T)
remotes::install_version("visNetwork", version = "2.1.2", clean = T)
remotes::install_version("here", version = "1.0.1", clean = T)
remotes::install_version("Matrix.utils", version = "0.9.8", clean = T)

remotes::install_github("mojaveazure/seurat-disk", ref = "9b89970eac2a3bd770e744f63c7763419486b14c", clean = TRUE)
remotes::install_github("satijalab/seurat-wrappers", ref = "9652bddba522d2f00ec5f8f0f8227761b9a6afd", clean = TRUE)
remotes::install_github("velocyto-team/velocyto.R", ref = "83e6ed92c2d9c9640122dcebf8ebbb5788165a21", clean = TRUE)
remotes::install_github("BUStools/BUSpaRse", ref = "5b23c9b609ea20259110eb2592720a6019751a90", clean = TRUE)
remotes::install_github("cole-trapnell-lab/leidenbase", upgrade = "never", ref = "v0.1.9", clean = TRUE)
remotes::install_github('cole-trapnell-lab/monocle3', upgrade = "never", ref = "1.0.0", clean = TRUE)