cat ${1}.csv | sed 's/^ *//' | sed 's/ *$//' | sed 's/^\(.*\)$/"\1"/' | tr -d "\r\n" | sed 's/""/","/g' | sed 's/^\(.*\)$/c(\1)/' > ${1}_forR.txt
