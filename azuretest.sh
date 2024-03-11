#! /bin/bash
SBUSTOPIC="orders"
TENANT="a9076f93-d94f-4a10-8289-12bb67840c04"

az login --tenant $TENANT

az storage account list 

az storage blob list

