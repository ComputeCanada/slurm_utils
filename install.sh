#!/bin/env bash

INSTALLATION_PREFIX=${PREFIX-$HOME/.local/bin/}

# Copy scripts to install folder.
for f in $( find -name "*.sh" ! -name $0 -o -name "*.py" );
do
	install -v $f $INSTALLATION_PREFIX
done
