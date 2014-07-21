This is just a collection of tiny scripts I've written in the past that come in
handy on a regular basis.  They're all licensed under the GPL-3, so go nuts :-)

# backup

Timemachine for Linux.  Choose a target directory and specify any `--exclude=`
entries and it'll backup everything incrementally.


# dejson

Pipe output into this and suddenly it's more readable.

```bash
$ curl -s 'http://somesite.tld/path/to/resource.json' | dejson
```


# deserialise

Does the same as dejson, but for PHP's serialize() function.

```bash
$ php somecommand.php | deserialise
```


# highlight

Highlight multiple strings in different colours.  Just pipe the output of a
command through it and include the strings you'd like to see highlighted.
Note that this also supports standard regular expressions, and can handle up
to 9 separate strings.

```bash
$ /path/to/some/command | highlight.py alpha bravo charlie delta echo foxtrot
```


# memorymonitor

Gets a list of all processes and their memory usage, sorted in a
human-readable fashion


# q

An attempt at a simple "swiss army knife" tool.  The idea is to be able to
type `q <argument>` and have the script just *know* what I want.  So far it
supports:

* Unix timestamp to human-readable time
* Human-readable time to Unix time
* Simple math
* DNS lookups (forward and reverse)
* Radian/degree conversion


# urldecode

Translates a URL with lots of encoding into something more readable

```bash
$ echo "I%20am%20the%20walrus" | urldecode
$ cat /path/to/file | urldecode
```


# urlencode

Translates a string into URL-encoded data

```bash
$ echo "I am the walrus" | urlencode
$ cat /path/to/file | urlencode
```


# wallpaperator

A simple wallpaper changer for GNOME.  Just point it at a directory and then
run this script via Cron to switch to a random wallpaper every n minutes.


# md2html

Offer up a markdown file (`.md`) and this will spit out HTML.  Redirect the
output into a something else to make it useful:

```bash
md2html /path/to/README.md > readme.html
```

