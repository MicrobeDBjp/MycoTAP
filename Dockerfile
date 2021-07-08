FROM centos:centos7

ENV LANG "ja_JP.UTF-8"
ENV LANGUAGE "ja_JP:ja"
ENV LC_ALL "ja_JP.UTF-8"

RUN yum update -y && \
    yum install -y libseccomp-devel && \
    yum install -y perl && \
    yum reinstall -y glibc-common && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

COPY ForSuperComputer/MycoTAPNIGSuper.sh /usr/local/bin/MycoTAPNIGSuper.sh
RUN chmod +x /usr/local/bin/MycoTAPNIGSuper.sh

COPY NameSum.pl /usr/local/bin/NameSum.pl
RUN chmod +x /usr/local/bin/NameSum.pl

COPY RemoveNameDup.pl /usr/local/bin/RemoveNameDup.pl
RUN chmod +x /usr/local/bin/RemoveNameDup.pl

COPY LICENSE   /home/documents/LICENSE
COPY README.md /home/docuemnts/README.md
