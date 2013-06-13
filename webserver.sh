#!/bin/bash

# This is an example how you can make your custom hackage available
# via a webserver: Simply expose this directory via HTTP.

echo "You can now use your custom hackage repo by putting this into your ~/.cabal/config:"
echo
echo "    remote-repo: my-custom-hackage:http://[ADDRESS]:8080/packages/archive"
echo
echo "where [ADDRESS] is your computer's hostname / IP address (e.g. localhost)."
echo

python -m SimpleHTTPServer 8080
