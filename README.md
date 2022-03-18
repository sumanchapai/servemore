# Hosting multiple sites in a server


This script is based on
<https://www.liquidweb.com/kb/configure-apache-virtual-hosts-ubuntu-18-04/> and
automates the process of hosting multiple sites in a server.

As is, the script acts like a re-direct server where if you run


```sudo ./script.sh sumanchapai.com.np https://sarangkot.com```

It will redirect users going to <https://sumanchapai.com.np> to
<https://sarangkot.com>.  Be aware though that this redirect is done from a
client side javascript. So users will see a white screen temporarily before
being re-directed.


If you're looking for the just setting up multi-site server and not redirect,
just modify the `index.html` in the `/var/www/domain.com/public_html/` of your
server to put the desired HTML.

**!This script uses a bit hacky methods in writing ed-scripts. So don't rely on
it for anything other than non-serious project.**


Also worth mentioning is that you should go in to your DNS records of your
source website and set up an A record to point to the server's IP you're
running this script on.
