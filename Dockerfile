FROM rocker/rstudio:4.2

RUN apt-get update && apt-get -y install \
  build-essential \
  cargo \
  cmake \
  default-jre \
  git \
  libboost-dev \
  libboost-all-dev \
  libboost-iostreams-dev \
  libboost-log-dev \
  libboost-system-dev \
  libboost-test-dev \
  libbz2-dev \
  libcairo2-dev \
  libcurl4-openssl-dev \
  libgdal-dev \
  libglpk40 \
  libgsl-dev \
  libhdf5-dev \
  liblzma-dev \
  libmagick++-dev \
  libncurses-dev \
  libproj-dev \
  libudunits2-dev \
  libxml2 \
  libxt-dev \
  libzmq3-dev \
  python3-pip \
  samtools \
  wget \
  zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

RUN pip install numba==0.55.2 --no-cache-dir
RUN pip install kb-python --no-cache-dir
RUN pip install ipykernel --no-cache-dir

ADD install_cran_packages.R /
ADD install_bioc_packages.R /
ADD install_github_packages.R /
ADD bioc_packages.csv /

RUN R -e "source(\"install_bioc_packages.R\")"
RUN R -e "source(\"install_cran_packages.R\")"
RUN R -e "source(\"install_github_packages.R\")"
