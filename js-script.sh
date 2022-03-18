#!/bin/bash

# taken from 
# https://www.w3schools.com/howto/howto_js_redirect_webpage.asp

echo "redirecting to $2
    <script>
    // simulate an HTTP redirect
    window.location.replace('$1');

    // simulate a mouse click
    window.location.href = '$2';
    </script> "> /var/www/$1/public_html/index.html 
