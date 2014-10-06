
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
	inkscape -z -D --file=figures/r1-sequence.svg --export-pdf=figures/r1-sequence.pdf
	inkscape -z -D --file=figures/r2-sequence.svg --export-pdf=figures/r2-sequence.pdf
	inkscape -z -D --file=figures/functional-view.svg --export-pdf=figures/functional-view.pdf
	inkscape -z -D --file=figures/concurrency-model.svg --export-pdf=figures/concurrency-model.pdf
	inkscape -z -D --file=figures/state-model.svg --export-pdf=figures/state-model.pdf
	inkscape -z -D --file=figures/dev_module_structure.svg --export-pdf=figures/dev_module_structure.pdf
	inkscape -z -D --file=figures/data_structure.svg --export-pdf=figures/data_structure.pdf
	inkscape -z -D --file=figures/data_flow.svg --export-pdf=figures/data_flow.pdf
	inkscape -z -D --file=figures/information_lifecycle0.svg --export-pdf=figures/information_lifecycle0.pdf
	inkscape -z -D --file=figures/deployment_view.svg --export-pdf=figures/deployment_view.pdf
	inkscape -z -D --file=figures/runtime-platform-model.svg --export-pdf=figures/runtime-platform-model.pdf

spell:
	for file in $(TEX_FILES); do aspell --lang en_GB -t -c $$file; done

clean:
	rm -f Online-Rental-System.pdf
	rm -f *.aux *.blg *.out *.bbl *.log
