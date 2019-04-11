cat ${1}.txt | tail -n +2 | cut -f 1,7 | egrep '/18 ' | tr "\t" "," | sed 's/,.*$//' > ${1}_18.csv
cat ${1}.txt | egrep -f ${1}_18.csv > ${1}_18_subs.txt
