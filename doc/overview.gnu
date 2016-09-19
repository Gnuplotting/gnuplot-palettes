#!/usr/bin/gnuplot
#
# Create overview over all palettes
#
# AUTHOR: Hagen Wierstorf
# gnuplot 5.0 patchlevel 3

reset
set loadpath '../'

# wxt
#set terminal wxt size 1024,1829 enhanced font 'Verdana,10' persist
# png
set terminal pngcairo size 1024,1829 enhanced font 'Verdana,10'
set output 'overview.png'

unset key
unset border
unset key
unset tics
unset colorbox

# function for lines
f(x,i) = cos(x - 1.0 + i/10.0)

set xrange [0:pi]

set multiplot layout 16,6
# colorbrewer diverging
do for [pal in "\
    brbg prgn piyg puor rdbu rdgy rdylbu rdylgn spectral\
    accent dark2 paired pastel1 pastel2 set1 set2 set3\
    blues bugn bupu gnbu greens greys orrd oranges pubu pubugn purd purples rdpu reds ylgn ylgnbu ylorbr ylorrd\
    moreland\
    "] {
    filename = pal . '.pal'
    load filename
    # plot colorbar
    set lmargin 4
    set rmargin 0
    plot 'overview.txt' matrix w image
    # plot lines
    set label 1 pal at -1,0 left front
    set lmargin 1
    set rmargin 1
    plot for [ii=1:8] f(x,ii) ls ii lw 2
    unset label
}

do for [pal in "jet parula chromajs viridis plasma magma inferno"] {
    filename = pal . '.pal'
    load filename
    # plot colorbar
    set lmargin 4
    set rmargin 0
    plot 'overview.txt' matrix w image
    # plot lines
    set label 1 pal at -1,0 left front
    set lmargin 1
    set rmargin 1
    plot for [ii=1:9] f(x,ii) ls ii lw 2
    unset label
}

load 'whylrd.pal'
set lmargin 4
set rmargin 0
plot 'overview.txt' matrix w image
set label 1 'whylrd' at -1,0 left front
set lmargin 1
set rmargin 1
plot for [ii=1:5] f(x,ii) ls ii lw 2
unset label

load 'ylrd.pal'
set lmargin 4
set rmargin 0
plot 'overview.txt' matrix w image
set label 1 'ylrd' at -1,0 left front
set lmargin 1
set rmargin 1
plot for [ii=1:4] f(x,ii) ls ii lw 2
unset label

do for [pal in "gnpu sand"] {
    filename = pal . '.pal'
    load filename
    # plot colorbar
    set lmargin 4
    set rmargin 0
    plot 'overview.txt' matrix w image
    # plot lines
    set label 1 pal at -1,0 left front
    set lmargin 1
    set rmargin 1
    plot for [ii=1:10] f(x,ii) ls ii lw 2
    unset label
}

unset multiplot
