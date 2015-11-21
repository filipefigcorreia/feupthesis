## standard makefile for tex documents
##
## Use gmake!!!
##

# name of the main tex or ltx file
DOC=thesis
DOC_BLIND=thesis_blind

BIBFILE=thesis
INPUTS=$(wildcard *.tex) 

#FIG2DEV=softrun -e xfig -- fig2dev

#####################################################################
.SUFFIXES:
.PRECIOUS: %.dvi %.ps %.pdf
.PHONY: all ps pdf full check pdflatex
#####################################################################

all:
	pdflatex $(DOC)	
	bibtex $(BIBFILE)
	makeindex $(DOC)
	#makeindex $(DOC).nlo -s nomencl.ist -o $(DOC).nls
	pdflatex $(DOC)
	pdflatex $(DOC)
	rm -f $(DOC).out $(DOC).maf $(DOC).lof $(DOC).toc $(DOC).ind $(DOC).ilg $(DOC).idx $(DOC).brf $(DOC).bbl *.aux *.thm *.cb *.blg *.mlf* *.mtc* *.mlt* *.lot

quick:
	pdflatex $(DOC)	
	rm -f $(DOC).out $(DOC).maf $(DOC).lof $(DOC).toc $(DOC).ind $(DOC).ilg $(DOC).idx $(DOC).brf $(DOC).bbl *.aux *.thm *.cb *.blg *.mlf* *.mtc* *.mlt* *.lot
	
check:
	@echo ""
	@echo " "`pdffonts $(DOC).pdf`
	@grep -i underfull $(DOC).log | sort -n
	@grep -i overfull $(DOC).log | sort -n
	@grep -i warning $(DOC).log | sort 
	@echo ""
	@echo " "`grep -i underfull $(DOC).log | wc -l` "underfull boxes"
	@echo " "`grep -i overfull $(DOC).log | wc -l` "overfull boxes"
	@echo " "`grep -i warning $(DOC).log | wc -l` "warnings"
	@echo ""

clean:
	rm -f $(DOC).bbl $(DOC).log $(DOC).pdf $(DOC).out $(DOC).maf $(DOC).lof $(DOC).toc $(DOC).ind $(DOC).ilg $(DOC).idx $(DOC).brf *.aux *.thm *.cb *.blg *.mlf* *.mtc* *.mlt* *.lot

force:
	$(MAKE) -B

