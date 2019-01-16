FROM bcbio/bcbio
MAINTAINER Kevin Fang <kfang@curii.com>
USER root

RUN apt-get update && \
    bcbio_conda update conda -y && \
    bcbio_nextgen.py upgrade --tools 

RUN rm -rf /usr/local/share/bcbio-nextgen/galaxy
