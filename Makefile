DOCS=index research publications teaching people

HDOCS=$(addsuffix .html, $(DOCS))

.PHONY : docs
docs : $(HDOCS)

.PHONY : update
update : $(HDOCS)
        @echo -n 'Copying to server...'
        # insert code for copying to server here.
        @echo ' done.'

%.html : %.jemdoc MENU
        ./jemdoc.py $<

.PHONY : clean
clean :
        -rm -f html/*.html
