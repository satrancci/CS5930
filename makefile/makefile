all: keywordsMerged.txt


keywordsHawley.txt: ../shell-scripts/findKeywordsHawley.sh
	bash ../shell-scripts/findKeywordsHawley.sh > $@

keywordsMcCaskill.txt: ../shell-scripts/findKeywordsMcCaskill.sh
	bash ../shell-scripts/findKeywordsMcCaskill.sh > $@

keywordsMerged.txt: keywordsHawley.txt keywordsMcCaskill.txt
	paste keywordsHawley.txt keywordsMcCaskill.txt > $@

clean:
	rm -f keywordsHawley.txt keywordsMcCaskill.txt keywordsMerged.txt