#!/bin/sh


pid=`ps -ef | grep "backend.py" | grep -v grep | /usr/bin/awk '{print $2}'`

# echo ${pid}
date >> log_backend.log

if [ ! ${pid} ]; then
        # echo "is null"
        echo "No backend process rubbish to clean." >> log_backend.log
else
        # echo "not null"
        kill -s 9 ${pid}
        echo "Warning: clean backend process of last round." >> log_backend.log
fi
. ./venv/bin/activate
python backend.py >> log_backend.log
echo 'OK'