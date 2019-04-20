paste -d ' ' ${1}.txt ${2}.txt | sed s'/^ *//' | sed 's/ *$//' |
    sed 's/\([^ ]*\) \(.*\)$/bc <<<"scale=2; \1 \/ \2"/' | bash -s > ${1}_rate.txt
# first paramater: number of statuses
# second parameter: days
# output = rate = statuses per day
