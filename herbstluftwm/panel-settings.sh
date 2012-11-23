#!/bin/bash

# disable path name expansion or * will be expanded in the line
# cmd=( $line )
set -f

herbst_dir=$HOME/.config/herbstluftwm

monitor=${1:-0}
geometry=( $(herbstclient monitor_rect "$monitor") )
if [ -z "$geometry" ] ; then
	echo "Invalid monitor $monitor"
	exit 1
fi
# geometry has the format: WxH+X+Y
x_left=${geometry[0]}
y_position=${geometry[1]}
panel_width=$((${geometry[2]} /2))
x_right=$panel_width
panel_height=20
#panel_padding=10
panel_padding=18

# colours
bgcolor="#1F1F1F"
fgcolor="#efefef"
data_fg="#e0e0e0"
hi_fg="#4abcd4"
crit_fg="#cd5666"

selbg="#4F4F4F"
selfg="#101010"

spacer="^fg()   " # standard spacer
separator="^bg()^fg($selbg)|"

# font
font="-*-ubuntu-medium-*-*-*-14-*-*-*-*-*-*-*"

# conky config file
conky_file=$herbst_dir/conkyrc-dzen

