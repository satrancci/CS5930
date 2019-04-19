cat ${1} ${2} | cut -f 1 -d "," | sort | uniq -c | sort -r | sed 's/^ *//' | egrep '^2' | sed 's/^[^ ]* //'
