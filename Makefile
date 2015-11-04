.PRECIOUS: %

SNIPPETS_DIR:=snippets/
SNIPPETS:=$(wildcard $(SNIPPETS_DIR)*/*.ly)
SIMILARS_DIR:=similars/
SIMILARS:=$(wildcard $(SIMILARS_DIR)*.md)
HTMLS:=$(SIMILARS:.md=.html)
FORMATS=$(SNIPPETS:.ly=.$(1))
SVGS:=$(call FORMATS,svg)
MP3S:=$(call FORMATS,mp3)

# first: snippets/Debussy/fan.svg
all: all.html svgs
more: all mp3s
svgs: $(SVGS)
mp3s: $(MP3S)

clean:
	rm -vf similars.html $(SVGS) $(MP3S) $(call FORMATS,midi) $(call FORMATS,ly.wrap)

all.html: transformers/header.html $(HTMLS) transformers/footer.html
	cat $^ > $@

similars/%.html: similars/%.md transformers/similars.html
	pandoc -o $@ $< --template $(word 2,$^) \
		-s \
		-f markdown+hard_line_breaks

%.mp3: %.midi
	timidity $< -Ow -o - | lame - $@

%.ly.wrap: transformers/header.ly %.ly transformers/footer.ly
	cat $^ > $@

%.svg %.midi: %.ly.wrap transformers/add-svg-css.sh
	lilypond -o $* \
		-dbackend=svg \
		-dno-print-pages \
		-dno-point-and-click -dmusic-strings-to-paths \
		-dno-svg-woff \
		-dpreview \
		$<
		# -dpixmap-format=pngalpha \
		# -dresolution=300 \
		# --png \

	$(word 2,$^) < $*.preview.svg > $@
	rm $*.preview.svg

upload:
	rsync -R --iconv=utf-8-mac,utf-8 *.html assets/*.* snippets/*/*.svg gwinnett:~/ophir.li/music/similars
