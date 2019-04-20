cat ${1}.txt | sed 's/ .*//' | sed 's/ *$//' | sed 's/\//-/g' | sed 's/\([^-]*\)-\([^-]*\)-\([^-]*\)$/20\3-\1-\2/' > ${1}_2.txt
cat ${1}_2.txt | xargs datediff 2019-4-3 | sed 's/-//' > ${1}_converted.txt
# I calculate difference in days with Apr 3, 2019 because this is when I downloaded the data. I will then use the output of this script
# to calculate number of tweets per day since the creation of the account and use that result as a feature for training data
