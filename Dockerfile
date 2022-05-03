FROM rocker/rstudio:4.1.2

ADD install_R_packages.R /

RUN apt-get update

RUN apt-get -y install zlib1g-dev 
RUN apt-get -y install libbz2-dev 
RUN apt-get -y install liblzma-dev 
RUN apt-get -y install libcurl4-openssl-dev 
RUN apt-get -y install libxml2 
RUN apt-get -y install libglpk40 
RUN apt-get -y install libxt-dev 
RUN apt-get -y install git 
RUN apt-get -y install libhdf5-dev
RUN apt-get -y install r-cran-irkernel 
RUN apt-get -y install python3-ipykernel
RUN apt-get -y install jupyter-client

RUN R -e "source('/install_R_packages.R')"
