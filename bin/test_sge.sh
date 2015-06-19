#!/bin/sh
source ~/.bash_profile
source /common/sge/default/common/settings.sh


max=10
for i in "$@"
do
    echo "$i"
done
