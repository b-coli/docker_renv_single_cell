FROM rocker/rstudio:4.1.2

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
RUN apt-get -y install wget
RUN apt-get -y install libboost-all-dev
RUN apt-get -y install default-jre
RUN apt-get -y install cmake
RUN apt-get -y install python3-pip
RUN apt-get -y install cargo

RUN cd /usr/bin \
 && wget https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2 \
 && tar -vxjf htslib-1.9.tar.bz2 \
 && cd htslib-1.9 \
 && make

RUN cd /usr/bin \
  && wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 \
  && tar -vxjf samtools-1.9.tar.bz2 \
  && cd samtools-1.9 \
  && make \
  && cd

RUN wget https://github.com/alexdobin/STAR/archive/refs/tags/2.7.10a.tar.gz \
  && tar -xzvf 2.7.10a.tar.gz \
  && ln STAR-2.7.10a/bin/Linux_x86_64/STAR /bin/ \
  && rm 2.7.10a.tar.gz

RUN wget https://github.com/gpertea/gffread/releases/download/v0.12.7/gffread-0.12.7.Linux_x86_64.tar.gz \
  && tar -xvzf gffread-0.12.7.Linux_x86_64.tar.gz \
  && ln gffread-0.12.7.Linux_x86_64/gffread /bin/ \
  && rm gffread-0.12.7.Linux_x86_64.tar.gz

RUN wget https://sourceforge.net/projects/bbmap/files/BBMap_38.96.tar.gz \
  && tar -xvzf BBMap_38.96.tar.gz \
  && ln bbmap/*.sh /bin/ \
  && rm BBMap_38.96.tar.gz

RUN wget https://github.com/COMBINE-lab/alevin-fry/archive/refs/tags/v0.6.0.tar.gz \
  && tar -xvzf v0.6.0.tar.gz \
  && cd alevin-fry-0.6.0 \
  && cargo build --release \
  && export PATH=`pwd`/target/release/:$PATH \
  && cd ../ \
  && rm v0.6.0.tar.gz

RUN pip install numba==0.55.2
RUN pip install kb-python
RUN pip install ipykernel

RUN R -e "install.packages('https://cran.r-project.org/src/contrib/remotes_2.4.2.tar.gz')"
RUN R -e "remotes::install_version(\"tidyverse\", version = \"1.3.1\", upgrade = T)"
RUN R -e "remotes::install_version(\"Seurat\", version = \"4.1.0\", upgrade = T)"
RUN R -e "remotes::install_version(\"targets\", version = \"0.10.0\")"
RUN R -e "remotes::install_version(\"tarchetypes\", version = \"0.4.1\")"
RUN R -e "remotes::install_version(\"rmarkdown\", version = \"2.11\")"
RUN R -e "remotes::install_version(\"future.callr\", version = \"0.7.0\")"
RUN R -e "remotes::install_version(\"IRkernel\", version = \"1.3\")"
RUN R -e "remotes::install_version(\"visNetwork\", version = \"2.1.0\")"
RUN R -e "remotes::install_version(\"BiocManager\")"
RUN R -e "remotes::install_github(\"mojaveazure/seurat-disk\")"
RUN R -e "remotes::install_github(\"velocyto-team/velocyto.R\")"
RUN R -e "remotes::install_github(\"BUStools/BUSpaRse\")"
RUN R -e "remotes::install_github(\"satijalab/seurat-wrappers\")"
RUN R -e "BiocManager::install(\"pcaMethods\", update = F, version = \"3.14\")"
RUN R -e "BiocManager::install(\"Biostrings\", version = \"3.14\")"
RUN R -e "BiocManager::install(\"Rsubread\", update = F, version = \"3.14\")"
RUN R -e "BiocManager::install(\"DropletUtils\", update = F, version = \"3.14\")"