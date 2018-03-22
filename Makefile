DOCS=index research publications teaching people

HDOCS=$(addsuffix .html, $(DOCS))

.PHONY : docs
docs : $(HDOCS)

.PHONY : update
update : $(HDOCS)
	@echo -n 'Updating...'
	git pull
	@echo ' done.'

%.html : %.jemdoc MENU
	./jemdoc.py $<

.PHONY : clean
clean :
	-rm -f *.html
