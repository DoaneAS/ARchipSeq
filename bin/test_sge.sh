#!/bin/sh
source ~/.bash_profile
source /common/sge/default/common/settings.sh



for i in "$@"
do
    echo ${i}
done
