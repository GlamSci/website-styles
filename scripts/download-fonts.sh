#!/usr/bin/env bash

FONTS=(
  "https://fonts.googleapis.com/css2?family=Alegreya:ital,wght@0,400;0,600;1,400;1,600"
  "https://fonts.googleapis.com/css2?family=Roboto+Mono"
)

REGEX='family=([a-zA-Z\+]+)'

mkdir css/

for FONT in ${FONTS[*]}; do
  if [[ "$FONT" =~ $REGEX ]]; then
    FILENAME="${BASH_REMATCH[1]}"
    OUTFILE="${FILENAME//\+/}"
    OUTPUT="css/${OUTFILE}.css"

    echo "Download CSS: ${OUTPUT}"
    wget "$FONT" -q -O "${OUTPUT}"

    COUNTER=0
    for URL in $( grep -Poh "url\(\K([^\)]+)" "${OUTPUT}" ); do
      EXTENSION="${URL##*.}"
      COUNTER=$[$COUNTER +1]

      FONTURL="fonts/${OUTFILE}-${COUNTER}.${EXTENSION}"

      echo "Downloading font: ${FONTURL}"
      wget "$URL" -q -O "${FONTURL}"

      sed -i 's$'$URL'$'$FONTURL'$g' "${OUTPUT}"
    done
  else
    echo "Bad regex"
  fi
done
