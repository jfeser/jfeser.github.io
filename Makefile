all: index.html

index.html: index.html.in pubs.html
	m4 index.html.in > index.html

pubs.html: pubs.bib
	bibtex2html -s acm -d -r -nofooter -nodoc pubs.bib

publish:
	scp *.html *.css *.pdf *.jpg login.csail.mit.edu:public_html
