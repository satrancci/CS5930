cat ${1} | cut -f 6 | tail -n +2 | egrep -o '[A-Za-z0-9]+' | sort | uniq -c | sort -r -n | more
