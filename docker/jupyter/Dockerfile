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
