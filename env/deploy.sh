#!/bin/bash
cd ~/magento && \
rm -rf pub/static/frontend/* && bin/magento setup:static-content:deploy -f && bin/magento cache:clean