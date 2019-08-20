# CONTENTS

* [GitLab Pages](https://frankhjung1.gitlab.io/faq) - rendered DocBook content

* [FAQ](README.md#faq)
* [Docker](README.md#docker)
   * [Build](README.md#build)
   * [Tag](README.md#tag)
   * [Run](README.md#run)
   * [Inspect](README.md#inspect)
   * [Push](README.md#push)
   * [Remove](README.md#remove)
   * [References](README.md#references)
* [Local Build](README.md#local-build)

# FAQ

This repository is a collection of tips and techniques that I have used over
the years. Some are included so that I can record how I manage my FreeBSD and
Linux machines. Others, because it was hard to solve a problem. And finally,
others because they are interesting or clever.

The content, however is rather old. Instead I favour the use of
[Dokuwiki](https://www.dokuwiki.org/dokuwiki#).

_frankhjung at linux.com_

# Docker

Basic commands to build Docker image used to render FAQ
[DocBook](https://docbook.org/) into HTML.

The latest Docker image can be found on Docker Hub,
[here](https://cloud.docker.com/repository/docker/frankhjung/docbook/general).

## Build

```bash
docker build \
  --compress --rm \
  --tag frankhjung/docbook:latest \
  --tag frankhjung/docbook:1.0.0 \
  --label version=1.0.0 .

docker images
```

### Example

```
$ sudo docker images
REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
frankhjung/docbook   1.0.0               1f0830e2dcb8        2 minutes ago       841MB
frankhjung/docbook   latest              1f0830e2dcb8        2 minutes ago       841MB
frankhjung/docbook   <none>              710615880f3a        3 hours ago         841MB
debian               stable-slim         e70625d41f5a        6 days ago          69.2MB
```

## Tag

If you want to tag image, you need the image id which you can get from `images`
command:

```bash
docker tag [image_id] frankhjung/docbook:test
```

## Run

Run:

```bash
sudo docker run -t -i \
  -u $(id -u ${USER}):$(id -g ${USER}) \
  frankhjung/docbook:latest
```

Render DocBook as PDF:

```bash
docker run \
  --rm -t \
  -v $PWD:/opt/workspace \
  -u $(id -u):$(id -g) \
  frankhjung/docbook:latest \
  jw -f docbook -b pdf -o public index.sgml
```

### Example

```
$ sudo docker run -t -i --privileged frankhjung/docbook:latest
Unable to find image 'frankhjung/docbook:latest' locally
latest: Pulling from frankhjung/docbook
eafd24d25890: Already exists
cf2a8976c989: Already exists
Digest: sha256:622ad885ed60dc02c29fb01cfcbe15aec432125d8db1b77baf49ea6e13000472
Status: Downloaded newer image for frankhjung/docbook:latest
DocBook-utils version 0.6.14 (jw version 1.1)
```

## Inspect

Get information on image:

```bash
sudo docker inspect [image_id]
```

## Push

Login and push to Docker Hub:

```bash
echo [my_secret] | docker login -u frankhjung --password-stdin
docker push frankhjung/docbook:tagname
```

## Remove

Remove local images:

```bash
docker rmi -f [image_id]
```

## References

* https://docs.docker.com/engine/reference/commandline/docker/
* https://docs.docker.com/glossary/?term=Dockerfile

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
