paste -d ' ' ${1} ${2} |  sed s'/^ *//' | sed 's/ *$//' | sed 's/\([^ ]*\) \(.*\)$/bc <<<"scale=2; \1 \/ \2"/' | bash -s
# input: two columns
# column 1: number of followers
# column 2: number of friends (people whom the user follows) 
