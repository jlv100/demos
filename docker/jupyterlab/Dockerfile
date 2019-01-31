FROM continuumio/miniconda3

EXPOSE 8888
VOLUME /notebooks

RUN apt-get install \
	libxrender1
	libcairo2

RUN conda config \
	--append channels r \
	--append channels conda-forge

RUN conda install -y -c r -c conda-forge \
	jupyterlab \
	matplotlib \
    numpy \
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
	r-klaR 

WORKDIR /notebooks

ENTRYPOINT [ \
	"jupyter", \
	"notebook", \
		"--allow-root", \
		"--no-browser", \
        "--ip='0.0.0.0'" \
]

