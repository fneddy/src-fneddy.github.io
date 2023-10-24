output_dir := fneddy.github.io
input_dir := src

input := $(shell find . -name "*.md")
output_intermediate := $(input:%.md=%.html)
output := $(subst $(input_dir),$(output_dir),$(output_intermediate))

header := $(input_dir)/header
footer := $(input_dir)/footer

all: clean build

build: $(output)

$(output_dir)/%.html : $(input_dir)/%.md
	pandoc --toc -B $(header) -A $(footer) -o $@ $<
	cp license $(output_dir)

clean:
	rm -rf $(output_dir)/*
