#!/usr/bin/env python3

#
# An attempt to make a swiss army knife of stuff I need on the command line
# often.
#

import re
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
        except:
            pass

    if timestamp:
        return int(mktime(timestamp.timetuple()))
    else:
        raise Qexception("That time didn't make sense")


if __name__ == "__main__":

    kind = result = None
    if arg.isdigit and len(arg) == 10 and arg.startswith("13"):
        kind = "Timestamp to Human Readable Date"
        result = str(datetime.utcfromtimestamp(int(arg)))
    elif re.match(r"^\d+\s+(\+|-|/|\*)\s+\d+", arg):
        kind = "Math Problem"
        result = eval(arg)
    elif re.match(r"^20\d\d", arg):
        kind = "Human Readable Date to Timestamp"
        result = parse_date(arg)

    if result is not None:
        print("\n  Treating this like a %s\n  Result: %s\n" % (kind, result))
        sys.exit(0)
    else:
        print(
            "\n  %sI have no idea what that is\n%s" % (
                colours["light-red"],
                colours["none"]
            ),
            file=sys.stderr
        )
        sys.exit(1)
