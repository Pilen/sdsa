
TEX_FILES=$(wildcard *.tex)

default: compile

compile: report

report:
	bibtex Online-Rental-System.tex
	pdflatex Online-Rental-System.tex
	pdflatex Online-Rental-System.tex

spell:
	for file in $(TEX_FILES); do aspell --lang en_GB -t -c $$file; done

clean:
	rm Online-Rental-System.pdf
