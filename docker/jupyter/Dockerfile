FROM demos/miniconda2

EXPOSE 8888
VOLUME /notebooks

RUN conda install -y \
	jupyter \
	matplotlib \
    numpy \
    scipy \
    scikit-learn \
    scikit-image \
	nb_conda

WORKDIR /notebooks

ENTRYPOINT [ \
	"jupyter", \
	"notebook", \
		"--allow-root", \
		"--no-browser", \
        "--ip='*'" \
]

RUN conda install -y protobuf
RUN conda install -y future
RUN conda install -y graphviz pydot

RUN apt-get install -y texlive-xetex texlive-fonts-recommended texlive-pictures texlive-latex-extra