FROM rocker/rstudio:4.1.2

ADD install_R_packages.R /

RUN apt-get update
RUN apt-get -y install zlib1g-dev libbz2-dev liblzma-dev libcurl4-openssl-dev libxml2 libglpk40 libxt-dev git

RUN R -e "source('/install_R_packages.R')"
