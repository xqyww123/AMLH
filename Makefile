BUILD_DIR:=/tmp/thesis

.PHONY: patent_noesis

all-zju0:
	rsync . $(BUILD_DIR) --exclude=.git -r
	(cd $(BUILD_DIR) && make zju0)

all-patent_noesis:
	rsync . $(BUILD_DIR) --exclude=.git -r
	(cd $(BUILD_DIR) && make patent_noesis)

all-simp:
	rsync . $(BUILD_DIR) --exclude=.git -r
	(cd $(BUILD_DIR) && make simp)

all:
	rsync . $(BUILD_DIR) --exclude=.git -r
	(cd $(BUILD_DIR) && make thesis)

patent_noesis:
	xelatex -shell-escape patent_noesis
	bibtex patent_noesis || true
	xelatex -shell-escape patent_noesis
	xelatex -shell-escape patent_noesis

zju0:
	xelatex -shell-escape zju0
	makeindex ZJU0.idx
	bibtex ZJU0 || true
	xelatex -shell-escape zju0
	xelatex -shell-escape zju0

simp:
	xelatex simp 
	#makeindex simp.idx
	bibtex simp || true
	xelatex simp
	xelatex simp

thesis:
	xelatex thesis 
	makeindex thesis.idx
	bibtex thesis || true
	xelatex thesis
	xelatex thesis

clean:
	rm -f *.aux *.bbl *.blg *.idx *.ilg *.ind *.lof *.log *.lot *.out *.toc
