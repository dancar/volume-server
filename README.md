Volume-Server
=============

![Screenshot](/screenshot.jpg?raw=true "Screenshot")

This is a (very) simple server which lets you remotely control the Master audio
volume of its host.

The server uses ```amixer``` in order to control the volume level

Dependencies
------------

0. amixer
1. Ruby
2. Sinatra
3. Thin (optional)

Usage
-----

```
$ ruby volume-server.rb
```


What the... ?
-------------
I use this thing to control the volume of the living room computer
from my laptop / mobile.
