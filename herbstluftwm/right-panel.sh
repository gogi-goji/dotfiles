#!/bin/bash

# disable path name expansion or * will be expanded in the line
# cmd=( $line )
set -f

# Get all of our panel settings

source $HOME/.config/herbstluftwm/panel-settings.sh

####
# Try to find textwidth binary.
# In e.g. Ubuntu, this is named dzen2-textwidth.
#if [ -e "$(which textwidth 2> /dev/null)" ] ; then
#    textwidth="textwidth";
#elif [ -e "$(which dzen2-textwidth 2> /dev/null)" ] ; then
#    textwidth="dzen2-textwidth";
#else
#    echo "This script requires the textwidth tool of the dzen2 project."
#    exit 1
#fi

####
# true if we are using the svn version of dzen2
#dzen2_version=$(dzen2 -v 2>&1 | head -n 1 | cut -d , -f 1|cut -d - -f 2)
#if [ -z "$dzen2_version" ] ; then
#    dzen2_svn="true"
#else
#    dzen2_svn=""
#fi

function uniq_linebuffered() {
    awk '$0 != l { print ; l=$0 ; fflush(); }' "$@"
}

herbstclient pad $monitor $panel_height

conky -c "$conky_file" | dzen2 -w "panel_width" -x "$x_right" -y "$y_position" -fn "$font" -h "$panel_height" \
    -ta r -bg "$bgcolor" -fg "$fgcolor" -p

