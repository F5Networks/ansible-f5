#!/usr/bin/env bash

set -x

: ${DOC_IMG:=f5devcentral/containthedocs:latest}

exec docker run -i \
  -v $PWD:$PWD --workdir $PWD \
  -e "LOCAL_USER_ID=$(id -u)" \
  ${DOC_IMG} /bin/bash -s <<EOF
set -e

#echo "Installing project dependencies"
pip install --user -r requirements.readthedocs.txt

echo "Building docs with Sphinx"
make -C clean || true
make docs || true

echo "Checking grammar and style"
write-good \$(find ./docs -name '*.rst') --passive --so --no-illusion --thereIs --cliches || true

echo "Checking links"
make -C docs linkcheck || true
EOF
