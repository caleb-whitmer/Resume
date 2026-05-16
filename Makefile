INPUT 	:= src/resume.md
STYLE		:= src/style.css

DC			:= pandoc
ENGINE	:= weasyprint

OUTPUT 	:= Caleb\ Whitmer\ -\ Resume.pdf

$(OUTPUT): $(INPUT) $(STYLE)
	$(DC) --pdf-engine $(ENGINE) -c $(filter-out $<,$^) -f markdown -t pdf -o '$@' $<