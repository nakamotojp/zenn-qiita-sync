#!/bin/bash

FILE=$1

FILENAME=$(basename $FILE .md)
if [ $FILE != ./articles/* ]; then
    if [ -e "qiita/public/$FILENAME.md" ]; then
        rm "qiita/public/$FILENAME.md"
    fi
    exit 0
fi

if [ ! -e "qiita/public/$FILENAME.md" ] && grep -q "published: true" "$FILE"; then
    cd ./qiita
    npx qiita new "$FILENAME"
    cd ../
fi

./node_modules/.bin/ts-node scripts/ztoq.tsx "$FILE" "./qiita/public/$FILENAME.md"
