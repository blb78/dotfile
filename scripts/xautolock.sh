if hash xautolock 2>/dev/null; then
    xautolock  -corners 00-0 -locker 'betterlockscreen -l blur' &
else
    echo " xautolock must be installed in order to use it"
	exit 2
fi
exit 0
