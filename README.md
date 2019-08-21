# CONTENTS

* [GitLab Pages](https://frankhjung1.gitlab.io/faq) - rendered DocBook content

* [FAQ](README.md#faq)
* [Local Build](README.md#local-build)

# FAQ

This repository is a collection of tips and techniques that I have used over
the years. Some are included so that I can record how I manage my FreeBSD and
Linux machines. Others, because it was hard to solve a problem. And finally,
others because they are interesting or clever.

The content, however is rather old. Instead I favour the use of
[Dokuwiki](https://www.dokuwiki.org/dokuwiki#).

_frankhjung at linux.com_

# Local Build

These pages are written as [DocBook](http://www.docbook.org/) using the
[question-and-answer set](http://www.docbook.org/tdg/en/html/qandaset.html)

Use the script
[build.sh](https://github.com/frankhjung/faq/blob/master/build.sh) to format
them as HTML pages.

For example, to get help, run

```bash
./build.sh -h
Usage: build.sh
  Build SGML into HTML and optionally FTP to a remote location.
Options:
  -b = build
  -f = ftp to site set in .netrc
  -h = this help
Return codes:
  0 = build completed successfully
  1 = build failed, see previous messages
© 2017 Frank H. Jung. All rights reserved.
```

# References

* https://github.com/frankhjung/docker-docbook
* https://cloud.docker.com/repository/docker/frankhjung/docbook
