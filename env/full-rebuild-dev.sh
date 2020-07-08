#!/bin/bash
# instead of di:compile, we run the grunt stack
cd ~/magento && \
time composer install && \
bin/magento setup:upgrade && \
grunt exec && \
grunt less && \
rm -rf pub/static/frontend/* && bin/magento setup:static-content:deploy -f && bin/magento cache:clean && \
bin/magento indexer:reindex
