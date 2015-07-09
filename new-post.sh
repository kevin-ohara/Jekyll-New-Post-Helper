#!/bin/bash

echo -n "Enter a title for your post and press [ENTER]: "
read INPUT

if [ -z "$INPUT" ]
   then
   echo "Post title is required"
   exit 1
fi

DATE=$(date +"%Y-%m-%d")
TIME=$(date +"%T")

STRPTITLE=${INPUT// /-}
LOWER=$(echo "$STRPTITLE" | tr '[:upper:]' '[:lower:]')
FILENAME=$(printf "%s-%s.md" "$DATE" "$LOWER")

touch $FILENAME
cat > $FILENAME << EOL
---
layout: post
title:  "$INPUT"
date:   $DATE $TIME
categories: code
---
EOL
