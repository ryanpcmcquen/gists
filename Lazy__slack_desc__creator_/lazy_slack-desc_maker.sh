#!/bin/sh
PRGNAM=${PRGNAM:-sweetapp}
for LINE in {1..7}; do
    echo "${PRGNAM}: $(sed ${LINE}'q;d' README | cut -c1-70)" >> ${PKG}/install/slack-desc;
done

# OR:

head -7 README | while read LINE; do
    echo "$PRGNAM: $(echo $LINE | cut -1-70)";
done
