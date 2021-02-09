
file = cv_thibaut_madelaine

all: cv.html cv.pdf cv.docx cv.txt

cv.html: cv.md style.css
	pandoc --metadata pagetitle="CV de Thibaut MADELAINE" --standalone -c style.css --from markdown --to html -o $(file).html cv.md

cv.pdf: cv.html
	wkhtmltopdf --enable-local-file-access $(file).html $(file).pdf

cv.docx: cv.md
	pandoc --from markdown --to docx -o $(file).docx cv.md

cv.txt: cv.md
	pandoc --standalone --from markdown --to plain -o $(file).txt cv.md

clean:
	rm -f *.html *.pdf *.docx *.txt
