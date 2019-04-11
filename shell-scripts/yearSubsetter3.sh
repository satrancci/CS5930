cat ${1}.txt | tail -n +2 | cut -f 1,7 | egrep '(/17 |/18 |/19 )' | tr "\t" "," | sed 's/,.*$//' > ${1}_171819.txt
cat ${1}.txt | egrep -f ${1}_171819.txt > ${1}_171819_subs.txt
