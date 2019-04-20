cat ${1}.txt | sed 's/ .*//' | sed 's/ *$//' | sed 's/\//-/g' | sed 's/\([^-]*\)-\([^-]*\)-\([^-]*\)$/20\3-\1-\2/' > ${1}_2.txt
cat ${1}_2.txt | xargs datediff 2019-4-3 | sed 's/-//' > ${1}_converted.txt
