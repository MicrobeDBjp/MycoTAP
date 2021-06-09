FROM centos:centos7

WORKDIR /home/hmori

ENV UNITEREF1 /home/hmori/MycoTAP/UNITERefS.20200204.fasta.withspecies.fasta.NoN.fasta
ENV UNITEREF2 /home/hmori/MycoTAP/UNITERefS.20200204.fasta.sp.fasta.NoN.fasta
ENV PROGRAMDIR /home/hmori/MycoTAP
ENV THREAD 10
ENV LOGFILE "$2/mycotap.log"
ENV PATH /home/hmori/MycoTAP:$PATH
ENV LANG "ja_JP.UTF-8"
ENV LANGUAGE "ja_JP:ja"
ENV LC_ALL "ja_JP.UTF-8"
ENV PATH /opt/pkg/singularity/3.7.1/bin:$PATH
ENV PATH /home/geadmin/UGER/bin/lx-amd64:$PATH

RUN yum update -y && \
    yum install -y libseccomp-devel && \
    yum install -y perl && \
    yum reinstall -y glibc-common && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

COPY ./MycoTAP-main/UNITERefS.20200204.fasta.withspecies.fasta.NoN.fasta /home/hmori/MycoTAP/UNITERefS.20200204.fasta.withspecies.fasta.NoN.fasta
COPY ./MycoTAP-main/UNITERefS.20200204.fasta.sp.fasta.NoN.fasta /home/hmori/MycoTAP/UNITERefS.20200204.fasta.sp.fasta.NoN.fasta
COPY ./MycoTAP-main/NameSum.pl /home/hmori/MycoTAP/NameSum.pl
COPY ./MycoTAP-main/RemoveNameDup.pl /home/hmori/MycoTAP/RemoveNameDup.pl	
COPY ./MycoTAP-main/ForSuperComputer/MycoTAPNIGSuper.sh /home/hmori/MycoTAP/MycoTAPNIGSuper.sh

RUN chmod +x /home/hmori/MycoTAP/NameSum.pl
RUN chmod +x /home/hmori/MycoTAP/RemoveNameDup.pl
RUN chmod +x /home/hmori/MycoTAP/MycoTAPNIGSuper.sh

RUN chmod -R 777 /home/hmori

