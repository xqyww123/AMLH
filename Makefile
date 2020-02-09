BUILD_DIR:=/tmp/thesis

all:
	rsync . $(BUILD_DIR) --exclude=.git -r
	(cd $(BUILD_DIR) && make thesis)

thesis:
	xelatex thesis 
	makeindex thesis.idx
	bibtex thesis || true
	xelatex thesis
	xelatex thesis

clean:
	rm -f *.aux *.bbl *.blg *.idx *.ilg *.ind *.lof *.log *.lot *.out *.toc
