tmpbg=`mktemp /tmp/lockscreen.XXXXXXXXXX.png` || exit 1

scrot "$tmpbg"
convert "$tmpbg" -scale 20% -scale 500% "$tmpbg"
i3lock -i "$tmpbg"
rm "$tmpbg"
