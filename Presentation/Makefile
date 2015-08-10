TGT=latex-beamer
DEPS= Figs/1.eps Figs/1.1.eps Figs/1.2.eps Figs/1.3.eps Figs/1.4.eps Figs/1.5.eps Figs/1.6.eps Figs/1.7.eps Figs/1.8.eps Figs/1.9.eps  Figs/1.3.1.eps Figs/1.3.2.eps  

LATEX=pslatex
BIBTEX=bibtex

all: $(TGT)
pdf: $(TGT).pdf

$(TGT): $(TGT).pdf

$(TGT).pdf: $(TGT).ps
	ps2pdf $(TGT).ps $(TGT).pdf

$(TGT).ps: $(TGT).dvi
	dvips -o $(TGT).ps $(TGT)

$(TGT).dvi: $(TGT).tex $(DEPS)
	$(LATEX) $(TGT) && $(LATEX) $(TGT)
#	$(LATEX) $(TGT)

.PHONY: clean clobber fresh
clean: 
	-$(RM) -f $(TGT).dvi $(TGT).aux $(TGT).log
	-$(RM) -f $(TGT).toc $(TGT).idx $(TGT).bbl
	-$(RM) -f $(TGT).toc $(TGT).ind $(TGT).blg 
	-$(RM) -f $(TGT).ps $(TGT).ind $(TGT).pdf 
	-$(RM) -f $(TGT).snm $(TGT).out $(TGT).nav 
	-$(RM) -f missfont.log *~

clobber: clean
	-$(RM) -f $(TGT).ps $(TGT).pdf

fresh: clobber all
