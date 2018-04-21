FROM centos/nginx-112-centos7
MAINTAINER  mickael@azema.net
USER root
COPY requirements.txt .
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && \
    python get-pip.py && \
    pip install -r requirements.txt
RUN rm -rf get-pip.py requirements.txt /var/cache/yum
RUN yum clean all
# switch to non-root for openshift usage
COPY ./s2i/bin/ /usr/libexec/s2i

USER 1001