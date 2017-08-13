# http://steem.readthedocs.io/en/latest/

FROM alpine:3.6

# This is a merge betwen the following repositories, 
# plus a few customizations
# https://github.com/frol/docker-alpine-python3
# https://github.com/frol/docker-alpine-gcc/blob/master/Dockerfile

# This will install Python 3 as well as the dependencies for steem
RUN apk add --no-cache python3 gcc musl-dev python3-dev openssl-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools steem && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    rm -r /root/.cache

ADD src/helloWorldExample.py /opt/script/helloWorldExample.py

ENTRYPOINT ["python3"]
CMD ["/opt/script/helloWorldExample.py"]