#!/bin/bash
# instead of di:compile, we run the grunt stack
cd ~ && \
time composer install && \
bin/magento setup:upgrade && \
rm -rf pub/static/frontend/* && bin/magento setup:static-content:deploy -f && bin/magento cache:clean && \
grunt clean && \
grunt exec && \
grunt less && \
bin/magento indexer:reindex
