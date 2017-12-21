#!/usr/bin/python

themes = "./themes/"

from os import listdir, chdir
from os.path import isfile, join
from random import randrange
from time import strftime

import sys

def rec(s, m):
    if m in s:
        return s
    return rec(check(), m)


# change the theme from dark to light based on time of day
color = lambda : int(strftime("%H")) <= 16 and "light" or "dark"



if __name__ == "__main__":
    """
    The startup
    """
    if len(sys.argv) < 2:
        sys.exit('Usage: %s [path to termite] [path to themes]' % sys.argv[0])

    chdir(sys.argv[1])
    themes = len(sys.argv) > 2 and sys.argv[2] + "/" or themes


    # produce file list
    fl = [ f for f in listdir(themes) if isfile(join(themes,f)) ]

    check = lambda :  fl[randrange(len(fl))]

    with open("config", "w") as fw:
        with open("base.conf") as fr:
            for line in fr:
                fw.write(line)
        with open( themes + rec(check(), color())) as fr:
            for line in fr:
fw.write(line)
