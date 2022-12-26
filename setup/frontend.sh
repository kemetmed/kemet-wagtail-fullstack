#!/bin/bash

if [ ! -d "frontend" ]
then
    wget https://github.com/CodyHouse/codyhouse-framework/archive/master.zip && unzip master.zip
    mv codyhouse-framework-master frontend
    rm master.zip
    cp setup/gulpfile.template.js frontend/gulpfile.js
    cp setup/package.json frontend/package.json
    cd frontend && npm install
else
    echo "EXITED: already run"
fi
