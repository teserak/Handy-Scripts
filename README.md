This is just a collection of tiny scripts I've written in the past that come in handy on a regular basis.  Thy're all licensed under GPL-3, so go nuts :-)

# dejson

Pipe output into this and suddenly it's more readable.

    $ curl -s 'http://somesite.tld/path/to/resource.json' | dejson


# deserialise

Does the same as dejson, but for PHP's serialize() function.

    $ php somecommand.php | deserialise


# highlight

Highlight multiple strings in different colours.  Just pipe the output of a
command through it and include the strings you'd like to see highlighted.
Note that this also supports standard regular expressions, and can handle up
to 9 separate strings.

    $ /path/to/some/command | highlight.py alpha bravo charlie delta echo foxtrot


# urldecode

Translates a URL with lots of encoding into something more readable

  $ echo "I%20am%20the%20walrus" | urldecode
  $ cat /path/to/file | urldecode


# urlencode

Translates a string into URL-encoded data

  $ echo "I am the walrus" | urlencode
  $ cat /path/to/file | urldecode


# memorymonitor

Gets a list of all processes and their memory usage, sorted in a
human-readable fashion


# backup

Timemachine for Linux.  Choose a target directory and specify any `--exclude=`
entries and it'll backup everything incrementally.


# wallpaperator

A simple wallpaper changer for GNOME.  Just point it at a directory and then
run this script via Cron to switch to a random wallpaper every n minutes.


# q

An attempt at a simple "swiss army knife" tool.  The idea is to be able to
type `q <argument>` and have the script just *know* what I want.  So far it
supports:

* Unix timestamp to human-readable time
* Human-readable time to Unix time
* Simple math
* DNS lookups (forward and reverse)
