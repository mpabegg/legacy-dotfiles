.PHONY: all
all: cedet matlab-emacs
	@

cedet:
	curl "http://switch.dl.sourceforge.net/project/cedet/cedet/cedet-1.1.tar.gz" | tar xzf -
	mv cedet-1.1 cedet
	cd cedet && make

matlab-emacs:
	cvs -d:pserver:anonymous@matlab-emacs.cvs.sourceforge.net:/cvsroot/matlab-emacs login
	cvs -z3 -d:pserver:anonymous@matlab-emacs.cvs.sourceforge.net:/cvsroot/matlab-emacs co -P matlab-emacs
	cd matlab-emacs && make

.PHONY: clean
clean:
	rm -rf cedet matlab-emacs
