FROM centos:centos7

WORKDIR /home/test-user

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

COPY ForSuperComputer/MycoTAPNIGSuper.sh /home/test-user/MycoTAPNIGSuper.sh
RUN chmod +x /home/test-user/MycoTAPNIGSuper.sh
