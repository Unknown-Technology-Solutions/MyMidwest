#!/usr/bin/env bash

# Create Database configuration
echo "{"
echo "\"database\": \"$MSQL_DB\""
echo "\"username\": \"$MSQL_UNAME\""
echo "\"password\": \"$MSQL_PASS\""
echo "\"server\": \"$MSQL_SERVER\""
echo "\"port\": \"$MSQL_PORT\""
echo "}"
