#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys,re

colours = [
	"\033[1;34m", # light blue
	"\033[1;32m", # light green
	"\033[1;36m", # light cyan
	"\033[1;31m", # light red
	"\033[1;33m", # yellow
	"\033[0;32m", # green
	"\033[0;36m", # cyan
	"\033[0;33m", # brown
	"\033[1;35m", # pink
	"\033[0m"     # none
]

args = sys.argv[1:]

# Strip out arguments exceeding the maximum
if len(args) > 9:
	print("\n%sWARNING: This script only allows for a maximum of 9 arguments.%s\n\n" % (colours[4], colours[9]), file=sys.stderr)
	args = args[0:8]

while True:
	line = sys.stdin.readline()
	colour = 0
	for arg in args:
		line = re.sub(
			r"(%s)" % (arg),
			"%s%s%s" % (colours[colour], "\g<1>", colours[9]),
			line
		)
		colour = colour + 1
	if line == '':
		break
	try:
		print(line, end="")
	except:
		pass
