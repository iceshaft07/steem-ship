# http://steem.readthedocs.io/en/latest/

FROM alpine:3.6

# This will install BASH. I prefer bash for debugging
# In production, these three lines should be removed
RUN apk update
RUN apk upgrade
RUN apk add bash

# This will install Python 3 as well as the dependencies for steem
RUN apk add --no-cache python3 gcc musl-dev python3-dev openssl-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools steem && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    rm -r /root/.cache

ADD steemhelloworld.py /opt/script/steemhelloworld.py

ENTRYPOINT python3 /opt/script/steemhelloworld.py
