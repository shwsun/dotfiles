#!/bin/sh
find ~/Downloads/music -iname "*.mp3" -print > /tmp/1st.m3u
urxvt -e mplayer2 -shuffle -playlist /tmp/1st.m3u &

