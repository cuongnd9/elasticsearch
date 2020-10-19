#!/bin/bash
# setting up prerequisites

cd /usr/share/elasticsearch

yes | ./bin/elasticsearch-plugin install file:./plugin/elasticsearch-analysis-vietnamese-${ES_VERSION:-7.3.1}.zip &&\
./bin/elasticsearch-plugin install analysis-icu

/usr/local/bin/docker-entrypoint.sh eswrapper
