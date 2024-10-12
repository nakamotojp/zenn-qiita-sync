#!/bin/bash

FILE=$1

FILENAME=$(basename "$FILE" .md)
if [[ "$FILE" != ./articles/* ]]; then
    if [[ -f "qiita/public/$FILENAME.md" ]]; then
        echo "delete qiita/public/$FILENAME.md cuz it's not included in articles/"
        rm "qiita/public/$FILENAME.md"
    fi
    exit 0
fi

if [[ ! -f "qiita/public/$FILENAME.md" ]] && grep -q "published: true" "$FILE"; then
    cd ./qiita
    echo "generate qiita/public/$FILENAME.md"
    npx qiita new "$FILENAME"
    cd ../
fi

echo "convert $FILE to qiita/public/$FILENAME.md"
./node_modules/.bin/ts-node scripts/ztoq.tsx "$FILE" "./qiita/public/$FILENAME.md"
