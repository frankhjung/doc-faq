#!/bin/bash

FAQ=$(dirname $0)
SCRIPTNAME=$(basename $0)
FTPSITE=ftp.supernerd.com.au

do_help()
{
    echo "Usage: ${SCRIPTNAME}" >&2
    echo "Build SGML into HTML and optionally FTP to my ISP." >&2
    echo "Options:" >&2
    echo "  -b = build only" >&2
    echo "  -f = ftp only" >&2
    echo "  -h = this help" >&2
    echo "Return codes:" >&2
    echo "  0 = build completed successfully" >&2
    echo "  1 = build failed, see previous messages" >&2
    echo "(c) 2010,2011 Frank Jung. All rights reserved." >&2
}

do_build() 
{
    cd $FAQ
    rm -rf $FAQ/index/
    rm -rf $FAQ/index.junk/
    db2html index.sgml
    chmod 755 $FAQ/index/
    chmod 644 $FAQ/index/*
}

do_ftp()
{
    ftp -p <<FTPFAQ
        open $FTPSITE
        ascii
        verbose
        prompt
        reset
        tick
        lcd $FAQ/index
        cd public_html
        dir .
        delete index.html
        put index.html
        mdelete x*.html
        mput x*.html
        dir .
        bye
FTPFAQ
}

#
# MAINLINE
#

while getopts "fbh" opt;
do
    case "$opt" in
        b)  do_build ;;
        f)  do_ftp ;;
        *)  do_help
            exit 1 ;;
    esac
done

exit 0
