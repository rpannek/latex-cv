VER=$(shell a=`git tag --points-at HEAD | head -n 1`; if [ -z "$$a" ]; then git rev-parse --short HEAD; else echo $$a; fi )
PACKAGES=texlive-fonts-recommended     \
         texlive-latex-extra           \
         texlive-fonts-extra           \
         dvipng                        \
         texlive-latex-recommended     \
         latex-xcolor

LATEX=pdflatex

.PHONY: install_dependencies clean all release

all: richard-cv.pdf example-cv.pdf

richard-cv.pdf:
	$(LATEX) richard-cv.tex

example-cv.pdf:
	$(LATEX) example-cv.tex

install_dependencies:
	sudo apt-get update
	sudo apt-get install -y --no-install-recommends $(PACKAGES)

install_dependencies_arch:
	sudo pacman -S texlive-latexextra

clean:
	rm -rf *.aux *.log *.out *.pdf release/*.pdf

release: richard-cv.pdf example-cv.pdf
	mkdir -p release/
	cp richard-cv.pdf release/richard-cv-$(VER).pdf
	cp example-cv.pdf release/example-cv-$(VER).pdf
