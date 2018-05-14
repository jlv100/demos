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

RUN apt-get install wget
RUN wget https://github.com/hakimel/reveal.js/archive/3.6.0.zip
RUN unzip 3.6.0.zip
RUN pip install RISE
RUN jupyter-nbextension install rise --py --sys-prefix
RUN jupyter-nbextension enable rise --py --sys-prefix
