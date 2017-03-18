# CONTENTS

* [FAQ](README.md#faq)
* [Build Notes](README.md#build-notes)

# FAQ

This repository is a collection of tips and techniques that I have used over
the years. Some are included so that I can record how I manage my FreeBSD and
Linux machines. Others, because it was hard to solve a problem. And finally,
others because they are interesting or clever.

The content, however is rather old. Instead I favour the use of
[Dokuwiki](https://www.dokuwiki.org/dokuwiki#). Consequently, new material
appears on my GitHub account [here](https://github.com/frankhjung/doc-wiki).

_frankhjung at linux.com_

# Build Notes

These pages are written as [DocBook](http://www.docbook.org/) using the
[question-and-answer set](http://www.docbook.org/tdg/en/html/qandaset.html)

Use the script
[build.sh](https://github.com/frankhjung/faq/blob/master/build.sh) to format
them as HTML pages. 

For example, to get help, run

    ./build.sh -h
    Usage: build.sh
    Build SGML into HTML and optionally FTP to my ISP at members.iinet.net.au.
    Options:
    -b = build
    -f = ftp to site set in .netrc
    -h = this help
    Return codes:
    0 = build completed successfully
    1 = build failed, see previous messages
    © 2017 Frank H. Jung. All rights reserved.
