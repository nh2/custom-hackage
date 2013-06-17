custom-hackage
==============

A small script that allows to run your own hackage repository with select packages/versions that you drop in.

Use it if you just want to have your own repo for `cabal install` - no fancy web interface provided.


Usage
-----

Drop your packages tars into `package/`, for example `package/bytestring-0.10.2.0.tar.gz`.

Then run `./generate-index.sh`.

Done.


Use your repo with cabal
------------------------

You can now serve this directory using any HTTP server, or the minimal `./webserver.sh`.

To tell cabal to get packages from your custom hackage, update `~/.cabal/config` to

```
remote-repo: my-custom-hackage:http://[SERVER_ADDRESS]/
```
