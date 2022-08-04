DOCS=index research publications teaching people projects

HDOCS=$(addsuffix .html, $(DOCS))
CONFIG=jemdoc.conf

.PHONY : docs
docs : $(HDOCS)

.PHONY : update-jemdoc
update-jemdoc:
	git subtree pull --prefix jemdoc_mathjax https://github.com/wsshin/jemdoc_mathjax master --squash

%.html : %.jemdoc MENU $(CONFIG)
	python3 jemdoc_mathjax/jemdoc -c $(CONFIG) $<

.PHONY : clean
clean :
	-rm -f *.html
