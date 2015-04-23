Contents
========

* [FAQ][1]
* [Build Notes][2]

-------------------------------------------------------------------------------

[1]: FAQ
========

This repository is a collection of tips and techniques that I have used over
the years. Some are included so that I can record how I manage my FreeBSD and
Linux machines. Others, because it was hard to solve a problem. And finally,
others because they are interesting or clever.

None of this would have been possible without the World-Wide-Web. So I must
thank the web community for their input. In keeping with this community spirit,
please feel free to use what you can. I hope that you find something useful
here!

_frankhjung@linux.com_

[2]: Build Notes
----------------

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
    Copyright 2010 Frank Jung. All rights reserved.
