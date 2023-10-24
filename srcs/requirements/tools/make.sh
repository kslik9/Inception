#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'
data_dir="/home/${USER}/data"

echo ${data_dir}
if [ ! -d "$data_dir/mysql" ]; then
    echo "${RED}mysql volume directory does not exist, creating...${NC}"
    mkdir "$data_dir/mysql"
else
    echo  "${RED}mysql volume directory already exists${NC}"
fi

if [ ! -d "$data_dir/wp" ]; then
    echo  "${RED}wp volume directory does not exist, creating...${NC}"
    mkdir "$data_dir/wp"
else
    echo "${RED}wp volume directory already exists${NC}"
fi
