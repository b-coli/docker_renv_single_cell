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
RUN apt-get -y install wget
RUN apt-get -y install samtools
RUN apt-get -y install libboost-all-dev
RUN apt-get -y install default-jre

RUN wget https://github.com/alexdobin/STAR/archive/refs/tags/2.7.10a.tar.gz
RUN tar -xzvf 2.7.10a.tar.gz
RUN ln STAR-2.7.10a/bin/Linux_x86_64/STAR /bin/
RUN rm 2.7.10a.tar.gz

RUN wget https://github.com/gpertea/gffread/releases/download/v0.12.7/gffread-0.12.7.Linux_x86_64.tar.gz
RUN tar -xvzf gffread-0.12.7.Linux_x86_64.tar.gz
RUN ln gffread-0.12.7.Linux_x86_64/gffread /bin/
RUN rm gffread-0.12.7.Linux_x86_64.tar.gz

RUN wget https://sourceforge.net/projects/bbmap/files/BBMap_38.96.tar.gz
RUN tar -xvzf BBMap_38.96.tar.gz
RUN ln bbmap/*.sh /bin/
RUN rm BBMap_38.96.tar.gz

RUN R -e "source('/install_R_packages.R')"
