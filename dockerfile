#
#

FROM ubuntu:bionic
RUN ls -latr /home

ARG APP_VERSION=0
RUN ARCH="$(dpkg --print-architecture)"; \
    case "${ARCH}" in\
    aarch64|arm64)\
        BINARY_URL='http://ftp.armedassault.info/_hosted/depbo-tools-0.8.10-linux-arm64-debian.tar';\
        ;;\
    amd64|x86_64)\
        BINARY_URL='http://ftp.armedassault.info/_hosted/depbo-tools-0.8.10-linux-amd64.tar';\
        ;;\
    *)\
        echo "Unsupported arch: ${ARCH}";\
        exit 1;\
        ;;\
    esac \
    && apt update \
    && ls -latr  \
    && cd external \
    && tar -zxvf depbo-tools-0.8.10-linux.tgz
    && ls -latr
    
#RUN cd /tmp/docker-depbo-tools/external && ls -latr 
#RUN unzip /tmp/docker-depbo-tools/external/external.zip -d /tmp/docker-depbo-tools/external/external
#RUN tar -xv /tmp/depbo-tools.tar
#RUN cd /tmp/external && ls -latr 


#    && wget -O /tmp/pbotools.tar.gz ${BINARY_URL} \
#    && ls -latr /tmp 
#    && tar -zxv pbotools.tar.gz \
#    && curl -LfsSo /tmp/pbotools.tar.gz ${BINARY_URL} \
#    && apt install -y curl unzip liblzo2-2 libvorbis0a libvorbisfile3 libvorbisenc2 libogg0 libuchardet0 \
#    && mkdir -p /usr/local/pbotools \
#&& ls -latr /usr/local/pbotools 
#    && tar zxv /tmp/pbotools.tar.gz
#&& apt install -y liblzo2-2 libvorbis0a libvorbisfile3 libvorbisenc2 libogg0 libuchardet0 curl unzip
#\
#    && curl -LfsSo /tmp/pbotools.tar.gz ${BINARY_URL} \
#    && mkdir -p /usr/local/pbotools && tar -zxv /tmp/pbotools.tar.gz -C /usr/local/pbotools

#RUN cd /tmp && tar -zxv pbotools.tar.gz && ls -latr
#RUN echo $BINARY_URL
#RUN ls -latr /usr/local/pbotools 
#RUN tar -zxv $BINARY_URL -C /usr/local/pbotools

###### Use Ubuntu latest and only copy in what we need to reduce the layer size ###################
#FROM ubuntu:bionic
#COPY --from=build /usr/local/pbotools /usr/local/pbotools

###### Start #######################################################################
LABEL description="..."
LABEL maintainer="<hopper.jerry@gmail.com>"
ENV PATH=$PATH:/usr/local/pbotools/bin
ENV LD_LIBRARY_PATH=/usr/local/pbotools/lib


#CMD ["/usr/local/fusionauth/fusionauth-app/apache-tomcat/bin/catalina.sh", "run"]
