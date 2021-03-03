#!/usr/bin/env bash

FONTS=(
  "https://fonts.googleapis.com/css2?family=Alegreya:ital,wght@0,400;0,600;1,400;1,600"
  "https://fonts.googleapis.com/css2?family=Roboto+Mono"
)

CSS_FOLDER="css/"
FONTS_FOLDER="fonts/"

REGEX='family=([a-zA-Z\+]+)'

mkdir -p "${CSS_FOLDER}"
mkdir -p "${FONTS_FOLDER}"

for FONT in ${FONTS[*]}; do
  if [[ "$FONT" =~ $REGEX ]]; then
    FILENAME="${BASH_REMATCH[1]}"
    OUTFILE="${FILENAME//\+/}"
    OUTPUT="${CSS_FOLDER}${OUTFILE}.css"

    echo "Download CSS: ${OUTPUT}"
    wget "$FONT" -q -O "${OUTPUT}"

    COUNTER=0
    for URL in $( grep -Poh "url\(\K([^\)]+)" "${OUTPUT}" ); do
      EXTENSION="${URL##*.}"
      COUNTER=$((COUNTER +1))

      FONTURL="${FONTS_FOLDER}${OUTFILE}-${COUNTER}.${EXTENSION}"

      echo "Downloading font: ${FONTURL}"
      wget "$URL" -q -O "${FONTURL}"

      sed -i 's$'${URL}'$'${FONTURL}'$g' "${OUTPUT}"
      echo "Altered ${OUTPUT} with new URL: $FONTURL"
      echo "-----------"
    done
  else
    echo "Bad regex"
  fi
done
