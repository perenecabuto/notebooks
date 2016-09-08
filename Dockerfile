FROM jupyter/datascience-notebook
MAINTAINER Felipe Ramos (Cabuto) "perenecabuto@gmail.com"

# https://rivercitylabs.org/up-and-running-with-opencv3-and-python-3-anaconda-edition/
RUN /bin/bash -c "yes | conda create -n opencv numpy scipy scikit-learn matplotlib python=3"
RUN /bin/bash -c "yes | source activate opencv; yes | conda install -c https://conda.binstar.org/menpo opencv3"

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost:8888/ || exit 1
