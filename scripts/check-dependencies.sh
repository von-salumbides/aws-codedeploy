#!/bin/bash

# Check for HTTPD
if [ -x "$(command -v httpd)" ];
then
  httpd -v
else
  exit 1
fi