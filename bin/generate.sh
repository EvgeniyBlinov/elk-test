#!/bin/bash
SCRIPT_PATH=`dirname $0`
ABSOLUTE_PATH=`readlink -m ${SCRIPT_PATH}`

[ -n "$1" ] && [ "xclear" == "x$1" ] && (
        echo '' > ${ABSOLUTE_PATH}/../tmp/access.log
        echo '' > ${ABSOLUTE_PATH}/../tmp/error.log
    ) &&
    cat ./tmp/{access,error}.log &&
    exit 0


echo '127.0.0.1 - - [25/Sep/2015:13:39:41 +0300] "GET / HTTP/1.1" 200 612 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0"' >> ${ABSOLUTE_PATH}/../tmp/access.log
echo '2015/10/16 17:47:22 [error] 12386#0: *19 upstream timed out (110: Connection timed out) while reading response header from upstream, client: 127.0.0.1, server: alert.blinov, request: "POST /api/v1/event/9/mgr HTTP/1.1", upstream: "fastcgi://unix:/var/run/alert-php5-fpm.sock", host: "alert.lo"' >> ${ABSOLUTE_PATH}/../tmp/error.log

cat ./tmp/{access,error}.log
