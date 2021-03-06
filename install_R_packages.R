install.packages("https://cran.r-project.org/src/contrib/remotes_2.4.2.tar.gz")
remotes::install_version("tidyverse", version = "1.3.1", upgrade = T)
remotes::install_version("Seurat", version = "4.1.0", upgrade = T)
remotes::install_version("targets", version = "0.10.0")
remotes::install_version("tarchetypes", version = "0.4.1")
remotes::install_version("rmarkdown", version = "2.11")
remotes::install_version("future.callr", version = "0.7.0")
remotes::install_github("mojaveazure/seurat-disk")
remotes::install_version("IRkernel", version = "1.3")
remotes::install_version("visNetwork", version = "2.1.0")
remotes::install_version("BiocManager")
BiocManager::install("pcaMethods", update = F)
remotes::install_github("velocyto-team/velocyto.R")
