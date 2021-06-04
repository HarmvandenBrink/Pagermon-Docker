#!/bin/bash
new_api=0
if [ $new_api = 0 ]; then
        new_api=`cat /dev/urandom |tr -dc A-Z9|head -c${1:-24}`
        echo "$new_api"
        sed -i 's/"apikey": ".*"/"apikey": "'$new_api'"/' clientconfig.json
        sed -i 's/"key": ".*"/"key": "'$new_api'"/' serverconfig.json
        sed -i 's/"sessionSecret": ".*"/"sessionSecret": "'$new_api'"/' serverconfig.json
fi
