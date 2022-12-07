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
  wget \
  zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

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

RUN wget https://github.com/COMBINE-lab/alevin-fry/archive/refs/tags/v0.7.0.tar.gz \
  && tar -xvzf v0.7.0.tar.gz \
  && cd alevin-fry-0.7.0 \
  && cargo build --release \
  && export PATH=`pwd`/target/release/:$PATH \
  && cd ../ \
  && rm v0.7.0.tar.gz

RUN pip install numba==0.55.2 --no-cache-dir
RUN pip install kb-python --no-cache-dir
RUN pip install ipykernel --no-cache-dir

ADD install_R_packages.R /
ADD bioc_packages.csv /

RUN R -e "source(\"install_R_packages.R\")"
