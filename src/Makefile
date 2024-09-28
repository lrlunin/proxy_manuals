# Define current date
CURRENT_DATE := $(shell date -u +"%H:%M %d/%m/%Y%n UTC")

# Define a pattern rule to convert .md to .pdf
%.pdf: %.md
	@echo "Converting $< to ../$@"
	@pandoc -V date="Создано $(CURRENT_DATE)" --filter=pandoc-citeproc --standalone --pdf-engine=xelatex -V mainfont='Roboto' $< -o ../$@

# List all .md files in the directory except README.md
MD_FILES := $(filter-out README.md, $(wildcard *.md))

# Automatically list all .pdf outputs corresponding to .md files
PDF_FILES := $(MD_FILES:.md=.pdf)

# Default target to create all PDFs
all: $(PDF_FILES)

# Clean up the generated PDFs
clean:
	@echo "Cleaning up PDF files..."
	@rm -f ../*.pdf

# Print a message after all PDFs are created
.PHONY: all clean
