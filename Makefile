XELATEX = xelatex
COVER   = CoverLetter_ASalvucci
REFLET  = RefLetter_ASalvucci
RESUME  = CV_ASalvucci

##Find all tex files to run spellChecker
#rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))
TEXFILES = $(wildcard *.tex)

##Rules 
default: run_all


CV: $(RESUME).tex
	$(XELATEX) $<
	$(XELATEX) $<
	@echo " Compiled CV "
	@echo " "

Cover: $(COVER).tex
	$(XELATEX) $<
	$(XELATEX) $<
	@echo " Compiled Cover Letter "
	@echo " "

RefLet: $(REFLET).tex
	$(XELATEX) $<
	$(XELATEX) $<
	@echo " Compiled Reference Letter "
	@echo " "

SpellCheck:
	@echo " Executing Spell Checker ...."
	python3 spellCheck.py

run_all: SpellCheck CV Cover clean


## Clean
clean:
	@echo "Cleaning previous compilation files ... "
	rm -rf *~ *.bak *.log *.aux *.out

cleanpdf:
	@echo "Deleting pdf files "
	rm -rf *.pdf

cleanall: clean cleanpdf
	@echo "Cleaning previous compilation and pdf files ... "

##help
help:
	@echo "CV and Cover Letter maker                                "
	@echo "  options:                                               "
	@echo "    make            -> run spell-check and compiles both "
	@echo "                       cv and cover letter               "
	@echo "    make SpellCheck -> run spell-checker on all tex files"
	@echo "    make Cover      -> compile the cover letter only     "
	@echo "    make RefLetter  -> compile the reference letter only "
	@echo "    make CV         -> compile the cv only               "
	@echo "    make clean      -> remove compilation files          "
	@echo "    make cleanpdf   -> remove pdf files                  "
	@echo "    make cleanall   -> remove compilation and pdf files  "
