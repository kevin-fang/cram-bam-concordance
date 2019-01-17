FROM bcbio/bcbio
MAINTAINER Kevin Fang <kfang@curii.com>
USER root

RUN apt-get update && \
    bcbio_conda update conda -y && \
    bcbio_nextgen.py upgrade --tools 

RUN rm -rf /usr/local/share/bcbio-nextgen/galaxy && \
    mkdir -p /usr/local/share/bcbio-nextgen/galaxy/tool-data && \
    cd /usr/local/share/bcbio-nextgen/galaxy/tool-data && \
    touch sam_fa_indices.loc && \
    echo "index\tGRCh37\t/usr/local/share/bcbio-nextgen/genomes/Hsapiens/GRCh37/seq/GRCh37.fa" >> "$(echo sam_fa_indices.loc)" && \
    touch picard_index.loc && \
    echo "GRCh37\tGRCh37\tHuman (GRCh37)\t/usr/local/share/bcbio-nextgen/genomes/Hsapiens/GRCh37/seq/GRCh37.fa" >> "$(echo picard_index.loc)" && \
    touch gatk_sorted_picard_index.loc && \
    echo "GRCh37\tGRCh37\tHuman (GRCh37)\t/usr/local/share/bcbio-nextgen/genomes/Hsapiens/GRCh37/seq/GRCh37.fa" >> "$(echo gatk_sorted_picard_index.loc)"
