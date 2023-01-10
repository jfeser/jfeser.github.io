all: index.html

index.html: index.html.in pubs.html
	m4 index.html.in > index.html

pubs.bib: FORCE
	curl https://dblp.org/pid/163/3156.bib > pubs.bib

pubs.html: pubs.bib
	bibtex2html -s acm -d -r -nofooter -nodoc pubs.bib

publish: index.html
	scp *.html *.css *.pdf *.jpg sketch3.csail.mit.edu:/scratch/feser/www/

FORCE: ;
