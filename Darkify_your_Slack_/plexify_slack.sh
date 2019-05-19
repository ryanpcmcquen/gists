#!/bin/sh
# Plexify Slack on Mac OS or Linux.

# curl https://gist.githubusercontent.com/ryanpcmcquen/8a7ddc72460eca0dc1f2dc389674dde1/raw/plexify_slack.sh | sh

if [ "`uname -s`" = "Darwin" ]; then
    SLACK_INTEROP_JS="/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js"
else
    SLACK_INTEROP_JS="/usr/lib/slack/resources/app.asar.unpacked/src/static/ssb-interop.js"
fi

if [ -z "`grep tt__customCss ${SLACK_INTEROP_JS}`" ]; then
    # Backup original CSS for reverts:
    cp ${SLACK_INTEROP_JS} ${SLACK_INTEROP_JS}.bak
    echo 'document.addEventListener("DOMContentLoaded",()=>{let tt__customCss=`body{font-family:"IBM Plex Sans"!important;}pre,code{font-family:"IBM Plex Mono"!important;}`;$("<style></style>").appendTo("head").html(tt__customCss);});' >> ${SLACK_INTEROP_JS}
    echo "Slack has been plexified."
else
    echo "Slack is already plexified."
fi
