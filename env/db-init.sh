#!/bin/bash
# This is a first time initialization script for the database
# run it when the volumes are bare
echo 'drop database magento2; create database magento2;' | mysql -u root
mysql -u root magento2 < /mnt/sata/exports/d2c_mage_prod_2020-04-17_19-38-00.sql
echo 'delete from yamaha_product_country_set where id > 1;' | mysql -u root magento2
