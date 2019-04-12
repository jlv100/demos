FROM continuumio/miniconda3

EXPOSE 8888
VOLUME /notebooks

RUN apt-get install \
	libxrender1
	libcairo2

RUN conda config \
	--append channels r \
	--append channels conda-forge

RUN conda install -y -c r -c bioconda -c conda-forge \
	jupyterlab \
	matplotlib \
    numpy \
	pandas \
    scipy \
    scikit-learn \
    scikit-image \
	nb_conda \
	r-base \
	r-irkernel \
	r-ggplot2 \
	r-ggally \
	r-caret \
	r-spls \
	r-klaR \
	mxnet \
	graphviz \
	python-graphviz \
	bioconductor-preprocesscore \
	nodejs
	
RUN jupyter labextension install @pyviz/jupyterlab_pyviz

WORKDIR /notebooks

ENTRYPOINT [ \
	"jupyter", \
	"notebook", \
		"--allow-root", \
		"--no-browser", \
        "--ip='0.0.0.0'" \
]

