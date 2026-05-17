DIRIN		:= src
INPUT 	:= $(DIRIN)/resume.md
STYLE		:= $(DIRIN)/style.css

DC			:= pandoc
ENGINE	:= weasyprint

DIROUT  := output
OUTPUT 	:= $(DIROUT)/Caleb\ Whitmer\ -\ Resume.pdf
OUTRDR  := $(DIROUT)/index.html

.PHONY: clean

$(OUTPUT): $(INPUT) $(STYLE)
	$(DC) --pdf-engine $(ENGINE) -c $(filter-out $<,$^) -f markdown -t pdf -o '$@' $<
	@echo "<!DOCTYPE html> <meta http-equiv=\"refresh\" content=\"0; url=../$@\" />" > $(OUTRDR)

clean:
	rm $(DIROUT)/*