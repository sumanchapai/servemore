#!/bin/bash

#
# check if args provided are sufficient
#
if [ $# -lt 2 ]; then
    echo "Insufficient args"
    echo "provide both redirect-from & redirect-to args"
    exit 101
fi

echo "Redirect $1 -> $2";
echo "confirm (y): "
read confirm
if [[ $confirm == "Y" || $confirm == "y" ]]; then
    mkdir -p /var/www/$1/public_html  &&

    ### log files datetime
    echo "$(date) ran with" $1 "--->" $2 >> errors.log &&
    echo "$(date) ran with" $1 "--->" $2 >> output.log &&

    ### write the file

    bash js-script.sh $1 $2 &&

    cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$1.conf &&

    bash ed-script.sh $1 /etc/apache2/sites-available/$1.conf 2>> errors.log 1>> output.log &&

    a2dissite -q 000-default.conf 1>> output.log 2>> errors.log &&

    a2ensite -q $1.conf 1>> output.log 2>> errors.log &&

    systemctl restart apache2 1>> output.log 2>> errors.log || 
    
    echo "error! errors.log, output.log"

else
    echo "aborting"
fi

#
# error codes
#

# 101 : insufficient args
