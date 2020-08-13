#!/bin/bash
cd ~ && \
time composer install && \
bin/magento setup:upgrade && \
bin/magento setup:di:compile && \
rm -rf pub/static/frontend/* && bin/magento setup:static-content:deploy -f && bin/magento cache:clean && \
bin/magento indexer:reindex
