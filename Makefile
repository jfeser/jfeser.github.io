all:

publish:
	scp *.html *.css *.pdf *.jpg login.csail.mit.edu:public_html
