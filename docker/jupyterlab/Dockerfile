FROM continuumio/miniconda3

EXPOSE 8888
VOLUME /notebooks

RUN apt-get update && apt-get install -y \
	libxrender1 \
	libcairo2

RUN conda update -n base -c defaults conda

#RUN conda config \
#	--append channels r \
#	--append channels conda-forge

RUN conda install -y \
    jupyterlab \
	matplotlib \
    numpy \
	pandas \
	nb_conda
    
RUN conda install -y \
    nodejs
    
RUN jupyter labextension install @pyviz/jupyterlab_pyviz
    
RUN conda install -y \
    scipy \
    scikit-learn \
    scikit-image
    
RUN conda install -y -c r \
	mxnet \
	graphviz \
	python-graphviz

RUN conda install -y -c r \
	r-base \
	r-irkernel \
	r-ggplot2 \
	r-caret \
	r-spls

RUN conda install -y -c bioconda \
	bioconductor-preprocesscore 
    
RUN conda install -y -c conda-forge \
    r-ggally \
    r-klaR
	
COPY test.sh test.sh

WORKDIR /notebooks

ENTRYPOINT [ \
	"jupyter", \
	"notebook", \
		"--allow-root", \
		"--no-browser", \
        "--ip='0.0.0.0'" \
]

