#!/bin/bash

FILE=$1

if [ $FILE != ./articles/* ]; then
    exit 0
fi

FILENAME=$(basename $FILE .md)
if [ ! -e "qiita/public/$FILENAME.md" ] && grep -q "published: true" "$FILE"; then
    cd ./qiita
    npx qiita new "$FILENAME"
    cd ../
fi

./node_modules/.bin/ts-node scripts/ztoq.tsx "$FILE" "./qiita/public/$FILENAME.md"
