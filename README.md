#    Curriculum Vitae : powered by LaTex  #

This repository contains the latex template CV, by using awesome class, modified
for my needs.

   - create the resume pdf file (CV_ASalvucci.pdf)
   - create the cover letter file (CoverLetter_ASalvucci.pdf)

#    Compiling options    #

Xelatex is needed to compile both cv and cover letter.

Makefile options:

   - make            -> run spell-check and compiles both cv and cover letter
   - make SpellCheck -> run spell-checker on all tex files
   - make Cover      -> compile the cover letter only
   - make RefLetter  -> compile the reference letter only
   - make CV         -> compile the cv only
   - make clean      -> remove compilation files
   - make cleanpdf   -> remove pdf files
   - make cleanall   -> remove compilation and pdf files

SpellChecker options:

   - --file   -> specify the tex file name: default is search in folder
   - --folder -> specify folder: default is working folder
   - --lang   -> specify language: default is en
