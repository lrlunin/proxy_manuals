# Define a pattern rule to convert .md to .pdf
%.pdf: %.md
	@echo "Converting $< to $@"
	@pandoc --pdf-engine=xelatex -V mainfont='Roboto' $< -o $@

# List all .md files in the directory
MD_FILES := $(wildcard *.md)

# Automatically list all .pdf outputs corresponding to .md files
PDF_FILES := $(MD_FILES:.md=.pdf)

# Default target to create all PDFs
all: $(PDF_FILES)

# Clean up the generated PDFs
clean:
	@echo "Cleaning up PDF files..."
	@rm -f *.pdf

# Print a message after all PDFs are created
.PHONY: all clean
