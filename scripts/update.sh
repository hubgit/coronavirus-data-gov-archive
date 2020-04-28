#!/usr/bin/env bash

mkdir -p original
curl --compressed -z original/data_latest.json -o original/data_latest.json https://c19downloads.azureedge.net/downloads/data/data_latest.json
curl --compressed -z original/utlas.geojson -o original/utlas.geojson https://c19pub.azureedge.net/utlas.geojson
curl --compressed -z original/countries.geojson -o original/countries.geojson https://c19pub.azureedge.net/countries.geojson
curl --compressed -z original/regions.geojson -o original/regions.geojson https://c19pub.azureedge.net/regions.geojson

mkdir -p processed
for FILE in original/*.{geojson,json}; do jq '.' "$FILE" > "processed/${FILE##*/}"; done
