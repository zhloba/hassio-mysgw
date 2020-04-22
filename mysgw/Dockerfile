ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install requirements for add-on
ENV CONFIG_PATH=/data/options.json
ENV APPDIR=/opt/MySensors

RUN apk update && apk add --no-cache jq \
    linux-headers \
    make \
    g++ \
    git 
RUN git clone https://github.com/mysensors/MySensors.git --branch master $APPDIR

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

RUN /run.sh
CMD ["/usr/local/bin/mysgw"]