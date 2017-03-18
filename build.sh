#!/usr/bin/env bash

# Documents are DocBook qandaset (SGML)
# For more see http://www.docbook.org/tdg/en/html/qandaset.html
# © 2017 Frank Jung. All rights reserved.

FAQ=$(dirname $0)
SCRIPTNAME=$(basename $0)
FTPSITE=$(grep machine ~/.netrc| cut -f 2)
# required program provided by docbook-utils
JW=/usr/bin/jw

do_help()
{
    cat <<EOH >&2
Usage: ${SCRIPTNAME}
Build SGML into HTML and optionally FTP to my ISP at ${FTPSITE}.
Options:
    -b = build
    -f = ftp to site set in .netrc
    -h = this help
Return codes:
    0 = build completed successfully
    1 = build failed, see previous messages
Copyright 2010-2017 Frank Jung. All rights reserved.
EOH
}

# check that conversion utility, jw(1) is installed
do_check()
{
    # check dependencies
    if [[ ! -x ${JW} ]]
    then
        echo -e "ERROR: ${JW} not installed\n" >&2
        do_help
        exit 1
    fi
}

# convert to html using jw
do_build() 
{
    do_check
    rm -rf $FAQ/index/*
    rm -rf $FAQ/index.junk
    ${JW} -f docbook -b html -o index index.sgml
    chmod 755 $FAQ/index/
    chmod 644 $FAQ/index/*
}

# upload html to web site
do_ftp()
{
    ftp -pv <<FTPFAQ
        open $FTPSITE
        ascii
        verbose
        prompt
        reset
        tick
        put homepage.html
        lcd $FAQ/index
        dir .
        delete index.html
        put index.html
        mdelete x*.html
        mput x*.html
        dir .
        bye
FTPFAQ
}

#####################################################################
# MAINLINE
#####################################################################

# check for action to perform, show help if none 
if [[ $# -eq 0 ]]
then
    do_help
    exit 0
fi

# need at least one parameter
while getopts "fbh" opt
do
    case "$opt" in
        b)  do_build ;;
        f)  do_ftp ;;
        h)  do_help ;;
        *)  do_help
            exit 1 ;;
    esac
done

exit 0
