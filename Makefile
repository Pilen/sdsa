
FILE=Online-Rental-System
TEX_FILES=$(wildcard *.tex)
FIGURE_FILES=$(wildcard figures/*.svg)

.PHONY: clean figures

default: compile

compile: figures report

report: $(FILE).tex
	pdflatex $(FILE)
	pdflatex $(FILE)
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)

figures:
	# for figure_file in $(FIGURE_FILES); do inkscape -z -D --file=$$figure_file --export=$$figure_file; done
	inkscape -z -D --file=figures/context_drawing.svg --export-pdf=figures/context_drawing.pdf

spell:
	for file in $(TEX_FILES); do aspell --lang en_GB -t -c $$file; done

clean:
	rm -f Online-Rental-System.pdf
	rm -f *.aux *.blg *.out *.bbl *.log
