#!/usr/bin/env python3

#
# An attempt to make a swiss army knife of stuff I need on the command line
# often. To use this, simply run `q <argument>` and it should (hopefully)
# be able to figure out what you want.
#
# At present, it supports:
#
# * Unix time to human-readable time or the other way around
#   * Examples:
#       q 2013                  # Human year to Unix time
#       q 2013-01-01            # Human date to Unix time
#       q '2013-01-01 00:42:42' # Specific human time to Unix time
#       q 1356994800            # Unix time to human time
#
# * Simple math
#   * Examples:
#       q '8 * 42'              # The spaces are required
#       q '8 * 42 + 13 ** 12'
#
# * DNS lookups (forward and backward)
#   * Examples:
#       q danielquinn.org
#       q 95.211.171.79
#

import re
import socket
import sys

from datetime import datetime
from time import mktime

colours = {
    "light-blue":  "\033[1;34m",  # light blue
    "light-green": "\033[1;32m",  # light green
    "light-cyan":  "\033[1;36m",  # light cyan
    "light-red":   "\033[1;31m",  # light red
    "yellow":      "\033[1;33m",  # yellow
    "green":       "\033[0;32m",  # green
    "cyan":        "\033[0;36m",  # cyan
    "brown":       "\033[0;33m",  # brown
    "pink":        "\033[1;35m",  # pink
    "none":        "\033[0m"      # none
}

arg = sys.argv[1]


class Qexception(Exception):
    pass


def parse_date(arg):

    patterns = (
        "%Y-%m-%d %H:%M:%S",
        "%Y-%m-%d %H:%M",
        "%Y-%m-%d %H",
        "%Y-%m-%d",
        "%Y-%m",
        "%Y",
    )

    timestamp = None
    for pattern in patterns:
        try:
            timestamp = datetime.strptime(arg, pattern)
            break
        except:  # We handle the potential errors below
            pass

    if not timestamp:
        raise Qexception("That time didn't make sense")
    return int(mktime(timestamp.timetuple()))


def parse_domain_name(arg):
    try:
        return ", ".join(socket.gethostbyname_ex(arg)[2])
    except:
        raise Qexception("That domain name didn't make sense")


if __name__ == "__main__":

    kind = None
    result = "I have no idea what that is"
    try:
        if arg.isdigit and len(arg) == 10 and arg.startswith("13"):
            result = str(datetime.utcfromtimestamp(int(arg)))
            kind = "Timestamp to Human Readable Date"
        elif re.match(r"^\d+\s+(\+|-|/|\*)\s+\d+", arg):
            result = eval(arg)
            kind = "Math Problem"
        elif re.match(r"^20\d\d", arg):
            result = parse_date(arg)
            kind = "Human Readable Date to Timestamp"
        elif re.match(r"^\d+\.\d+\.\d+\.\d+$", arg):
            result = socket.gethostbyaddr(arg)[0]
            kind = "Reverse IP Lookup"
        elif re.match(r"^\w+\.\w{2,3}$", arg):
            result = parse_domain_name(arg)
            kind = "Hostname Lookup"
    except Qexception as e:
        result = str(e)

    if kind is not None:
        print("\n  Treating this like a %s%s%s\n  Result: %s%s%s\n" % (
            colours['brown'],
            kind,
            colours['none'],
            colours['light-green'],
            result,
            colours['none'],
        ))
        sys.exit(0)

    print(
        "\n  %s%s\n%s" % (
            colours["light-red"],
            result,
            colours["none"]
        ),
        file=sys.stderr
    )
    sys.exit(1)
