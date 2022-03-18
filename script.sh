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
    mkdir -p /var/www/$1/public_html    &&
    chmod -R 755 /var/www &&

    ### write the file

    bash js-script.sh $1 $2 &&

    cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$1.conf &&

    bash ed-script.sh $1 /etc/apache2/sites-available/$1.conf > /dev/null &&

    a2dissite 000-default.conf >> syslog.txt &&

    a2ensite $1.conf >> syslog.txt &&

    systemctl restart apache2 >> syslog.txt

else
    echo "aborting"
fi

#
# error codes
#

# 101 : insufficient args
