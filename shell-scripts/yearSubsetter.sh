cat ${1}.txt | tail -n +2 | cut -f 1,7 | egrep '(/17 |/18 |/19 )' | tr "\t" "," | sed 's/,.*$//' > ${1}_171819.txt
