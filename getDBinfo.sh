#!/usr/bin/env bash

CONFIG_DIR=/var/www/testing/data

# Create Database configuration
echo "{" >> $CONFIG_DIR/DBconfig.json
echo "\"database\": \"$MSQL_DB\"" >> $CONFIG_DIR/DBconfig.json
echo "\"username\": \"$MSQL_UNAME\"" >> $CONFIG_DIR/DBconfig.json
echo "\"password\": \"$MSQL_PASS\"" >> $CONFIG_DIR/DBconfig.json
echo "\"server\": \"$MSQL_SERVER\"" >> $CONFIG_DIR/DBconfig.json
echo "\"port\": \"$MSQL_PORT\"" >> $CONFIG_DIR/DBconfig.json
echo "}" >> $CONFIG_DIR/DBconfig.json
