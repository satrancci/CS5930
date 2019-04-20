cat ${1} | sed 's/\t/,/g' | sed 's/^\([^,]*\),0\.[0123][^,]*,/\1,0,/' | sed 's/^\([^,]*\),0\.[6789][^,]*,/\1,1,/' | egrep '^[^,]*,[01],'
# converts tab-separated file into csv
# converts probabilies into binary. Discards rows with probabilies between 0.4-0.5999999 (higher risk of wrong labeling).
# anything above 0.6 is converted into 1 and anything below 0.4 is 0.
# second column must be probabilities.
