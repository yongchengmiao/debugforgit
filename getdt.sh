#!/bin/bash

set -e
 
CLI_OS="na"
CLI_UNAME="na"
 
if [ $# -eq 0 ]
  then
    VERSION=latest
    echo "Downloading the latest version of devtool CLI..."
  else
    VERSION=$1
    echo "Downloading version $1 of devtool CLI..."
fi
 
if $(echo "${OSTYPE}" | grep -q msys); then
    CLI_OS="win64"
    FILE_NAME="dt.exe"
elif $(echo "${OSTYPE}" | grep -q darwin); then
    CLI_OS="macosx64"
    FILE_NAME="dt"
else
    CLI_OS="linux64"
    FILE_NAME="dt"
fi
URL="https://gfx-assets.intel.com/artifactory/gfx-build-assets/build-tools/devtool-go/${VERSION}/artifacts/${CLI_OS}/${FILE_NAME}"
 
curl -XGET "$URL" -L -k -f > $FILE_NAME
chmod u+x $FILE_NAME
 
echo
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo "Downloaded devtool to $PWD/$FILE_NAME"
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo
