4.4.2
-----
Bug fix for `http://cars.com`. Using net-http now for most operations. Excon
would return a redirect to `https://cars.com:80`, which would lock up and never
return. Not sure what exactly triggered this, but switching adapters solved it.

4.4.1
-----
Reduced the timeouts to 5 seconds.

4.4.0
-----
Support for hosts which don't allow the `HEAD` method. This seems to be the case
with some Google App Engine apps.