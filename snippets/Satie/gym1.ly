% #(set-default-paper-size "a3" 'landscape)

global = {
	\key b \minor
}
music = {
	\time 3/4
	\new PianoStaff \with {
		\consists #Span_stem_engraver
	} <<
		\new Staff = "up" \relative a'' {
			\clef treble \global
			\tempo \markup \normal-text "Lent et douloureux"

			<< { \dynamicUp \stemUp \slurUp %\override Hairpin.to-barline = ##f
				R2.*4 | r4 fis( \pp \< a |
				g fis cis |
				% The hairpin override is to align it with a previous hairpin
				b cis % \once\override Hairpin.Y-offset = #5.5
				d\> |
				a2. |
				fis2.\!) ~ |
				fis2. ~ |
				fis2. ~ |
				fis2. |
			} \\ \crossStaff {
				r4\pp <fis  d   >2 |
				r4 <fis  cis >2 |
				r4 <fis  d   >2 |
				r4 <fis  cis >2 |
				r4 <fis  d   >2 |
				r4 <fis  cis >2 |
				r4 <fis  d   >2 |
				r4 <fis  cis >2 |
				r4 <fis  d   >2 |
				r4 <fis  cis >2 |
				r4 <fis  d   >2 |
				r4 <fis  cis >2 |
			} >>
		}
		\new Staff = "down" \relative a {
			\clef bass   \global

			<< \crossStaff { \stemDown
				s4 b2 s4 a2 | s4 b2 s4 a2 |
				s4 b2 s4 a2 | s4 b2 s4 a2 |
				s8 s^\f b2 s4 a2 | s4 b2 s4 a2 |
			} \\ { \stemUp
				g,2. | d2. | g2. | d2. |
				g2. | d2. | g2. | d2. |
				g2. | d2. | g2. | d2. |
			} >>
		}
	>>
}
