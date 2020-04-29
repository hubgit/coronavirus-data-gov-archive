#!/usr/bin/env bash

mkdir -p processed
for FILE in original/*.{geojson,json}; do jq '.' "$FILE" > "processed/${FILE##*/}"; done
