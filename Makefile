BUILD_DIR:=/tmp/thesis

all-zju0:
	rsync . $(BUILD_DIR) --exclude=.git -r
	(cd $(BUILD_DIR) && make zju0)

all-simp:
	rsync . $(BUILD_DIR) --exclude=.git -r
	(cd $(BUILD_DIR) && make simp)

all:
	rsync . $(BUILD_DIR) --exclude=.git -r
	(cd $(BUILD_DIR) && make thesis)

zju0:
	xelatex zju0
	makeindex ZJU0.idx
	bibtex ZJU0 || true
	xelatex zju0
	xelatex zju0

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
