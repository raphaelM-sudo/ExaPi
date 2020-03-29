#!/bin/bash
set -e

echo "Building..."

PI_VERSION=$1

if ! { [ "$PI_VERSION" -ge 1 ] && [ "$PI_VERSION" -le 4 ] ; } ; then
    echo "Not a valid Raspberry Pi version!"
    exit 1
fi

case $PI_VERSION in
    1) URL="https://www.dropbox.com/s/vrc60sdzcioit54/rpi1.tar.gz?dl=0" ;;
    2) URL="https://www.dropbox.com/s/vhezeusdt1d2xq7/rpi2.tar.gz?dl=0" ;;
    *) URL="https://www.dropbox.com/s/6c7gq1af1bs5mcp/rpi3%2B.tar.gz?dl=0" ;;
esac

echo "Downloading..."

wget -O exagear.tar.gz $URL

echo "Extracting..."

tar xvzf exagear.tar.gz

echo "Installing..."

cd ./exagear && \
chmod +x ./install-exagear.sh && \
./install-exagear.sh 2> /dev/null

rm -rf /tmp/*
