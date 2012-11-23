#!/bin/bash

monitor=${1:-0}

# In order to display both a statusbar and information from
# conky, we need two dzen instances, on on left and one on
# right.  

$HOME/.config/herbstluftwm/left-panel.sh $monitor &
$HOME/.config/herbstluftwm/right-panel.sh $monitor &
