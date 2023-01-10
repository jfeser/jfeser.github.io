all: index.html

index.html: index.html.in pubs.html
	m4 index.html.in > index.html

pubs.bib: FORCE
	curl https://dblp.org/pid/163/3156.bib > pubs.bib

pubs.html: pubs.bib
	bibtex2html -s acm -d -r -nofooter -nodoc pubs.bib

publish: index.html
	export SSHPASS=`secret-tool lookup user feser host csail.mit.edu`; sshpass -r 2 -e -v rsync -v *.html *.css *.pdf *.jpg feser@sketch2.csail.mit.edu:public_html/

FORCE: ;
