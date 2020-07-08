#!/bin/bash
cat $(dirname "$0")/post-db-import.sql | sed "s/DOMAIN_NAME/$DOMAIN_NAME/g" | mysql -u root magento2