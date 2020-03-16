FROM continuumio/miniconda3 AS jupyter

EXPOSE 8888
VOLUME /notebooks

RUN apt-get update && apt-get install -y \
	libxrender1 \
	libcairo2 \
    zip

RUN conda update -n base -c defaults conda

RUN conda install -y \
    jupyterlab \
	matplotlib \
    numpy \
	pandas \
	nb_conda \
    nodejs \
    && conda clean -y --all
    
RUN jupyter labextension install @pyviz/jupyterlab_pyviz

RUN mkdir -p /tests /environments

WORKDIR /notebooks

ENTRYPOINT [ \
	"jupyter", \
	"notebook", \
		"--allow-root", \
		"--no-browser", \
        "--ip='0.0.0.0'" \
]

FROM jupyter AS fields
ARG ENVNAME=fields
RUN conda create -n $ENVNAME
RUN bash -c ". /opt/conda/etc/profile.d/conda.sh && conda activate $ENVNAME && conda install \
    -c caffe2 \
    nb_conda \
    caffe2 \
    pydot \
    graphviz \
	python-graphviz \
    pandas \
    matplotlib \
    scikit-image \
    scikit-learn"
RUN conda env export -n $ENVNAME > /environments/$ENVNAME.yml
RUN echo "Field Location Prediction" >> /tests/$ENVNAME.test
RUN echo "LIME demo" >> /tests/$ENVNAME.test

FROM jupyter AS breast_cancer
ARG ENVNAME=breast_cancer
RUN conda create -n $ENVNAME
RUN bash -c ". /opt/conda/etc/profile.d/conda.sh && conda activate $ENVNAME && conda install \
    -c conda-forge \
    -c r \
    -c anaconda \
    nb_conda \
    matplotlib \
    scikit-learn \
    pandas \
    r-base \
    r-irkernel \
    r-ggally"
RUN conda env export -n $ENVNAME > /environments/$ENVNAME.yml
RUN echo "WDBC_1_data" >> /tests/$ENVNAME.test
RUN echo "WDBC_2_viz" >> /tests/$ENVNAME.test
RUN echo "WDBC_3_classification" >> /tests/$ENVNAME.test

FROM jupyter AS mouse_learning
ARG ENVNAME=mouse_learning
RUN conda create -n $ENVNAME
RUN bash -c ". /opt/conda/etc/profile.d/conda.sh && conda activate $ENVNAME && conda install \
    -c anaconda \
    -c bioconda \
    -c r \
    -c conda-forge \
    nomkl \
    nb_conda \
    matplotlib \
    numpy \
    pandas \
    mxnet \
    graphviz \
	python-graphviz \
    r-base \
    r-irkernel \
    r-ggplot2 \
    r-e1071 \
    libopenblas \
    bioconductor-preprocesscore \
    bioconductor-affy \
    bioconductor-affycoretools \
    r-rrcov \
    r-robustbase \
    r-reshape \
    r-caret \
    r-spls \
    gfortran_linux-64 \
    gxx_linux-64 \
    gcc_linux-64"

RUN conda env export -n $ENVNAME > /environments/$ENVNAME.yml
RUN echo "mice_proteins_pca_plsda" >> /tests/$ENVNAME.test
RUN echo "mice_proteins_mxnet_autoencoder" >> /tests/$ENVNAME.test
RUN echo "mice_proteins_mxnet_classify" >> /tests/$ENVNAME.test

FROM jupyter AS apt

WORKDIR /opt
RUN wget https://downloads.thermofisher.com/APT/APT2.11.1/apt_2.11.1_linux_64_bit_x86_binaries.zip
RUN unzip apt_2.11.1_linux_64_bit_x86_binaries.zip

FROM jupyter AS demos
COPY --from=fields /environments/fields.yml /environments/fields.yml
COPY --from=fields /tests/fields.test /tests/fields.test

COPY --from=breast_cancer /environments/breast_cancer.yml /environments/breast_cancer.yml
COPY --from=breast_cancer /tests/breast_cancer.test /tests/breast_cancer.test

COPY --from=mouse_learning /environments/mouse_learning.yml /environments/mouse_learning.yml
COPY --from=mouse_learning /tests/mouse_learning.test /tests/mouse_learning.test

COPY --from=apt /opt/apt_2.11.1_linux_64_bitx86_binaries/bin/apt-probeset-summarize /bin/apt-probeset-summarize

COPY run_tests.sh /run_tests.sh
COPY create_environments.sh /create_environments.sh

COPY entrypoint.sh /entrypoint.sh

#USER jupyter
ENTRYPOINT [ \
	"bash", \
	"/entrypoint.sh" \
]

