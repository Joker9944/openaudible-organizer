#!/usr/bin/env bash

mkdir books

jq -r '.[].filename' < books.json | while read -r book; do
    echo "$book"
    touch "books/$book.m4b"
done
