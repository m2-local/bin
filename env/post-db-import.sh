#!/bin/bash
# Here we replace occurances of DOMAIN_NAME with the project.domain value from our config file
# and UPSTREAM_DOMAIN_NAME with project.upstream_domain from our config file
# @note variables are presumed to be part of the environment by way of Docker
cat $(dirname "$0")/post-db-import.sql | \
sed "s/UPSTREAM_DOMAIN_NAME/$UPSTREAM_DOMAIN_NAME/g" | \
sed "s/DOMAIN_NAME/$DOMAIN_NAME/g" | \
mysql -u root magento2