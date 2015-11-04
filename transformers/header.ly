\version "2.18.2"

% #(ly:set-option 'preview #t)
% #(ly:set-option 'print-pages #f)
% #(ly:set-option 'backend 'svg)
% #(ly:set-option 'svg-woff #t)
#(set-default-paper-size "letter" 'landscape)

\paper {
	#(define fonts (make-pango-font-tree "Lyon Text" "Nimbus Sans" "Luxi Mono" 1))
}
\header {
	tagline = ""
}
