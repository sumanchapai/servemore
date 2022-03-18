#!/bin/bash

echo "/DocumentRoot
s/html/$1\/public_html
/ServerName.www
s/www.*$/$1
s/#ServerName/ServerName
a
ServerAlias www.$1
.
wq" | ed $2 
