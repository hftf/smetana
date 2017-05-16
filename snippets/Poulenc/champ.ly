global = {
	\key d \major
	\numericTimeSignature
}
music = {
    \once \override Score.TimeSignature #'stencil = ##f 
	\time 4/4
	\new PianoStaff <<
		\set PianoStaff.midiInstrument = #"harpsichord"
		\new Staff = "up" \relative a {
			\clef treble \global
			\tempo \markup \normal-text "Allegro molto" 2 = 120
			\set Score.tempoWholesPerMinute = #(ly:make-moment 100 2)

			\partial 4
			r8 d16( e |
			\bar "||"
			\override Score.RehearsalMark.padding = 3
			\mark \markup \smaller \box \number 3
			\time 2/2
			fis8) r g-. e-. fis->( d) r d16( e |
			fis8) r \tuplet 3/2 { e( fis g } fis) r r fis-. |
			e-. a-. e-. d-. cis( b16 cis) a8-. a-. |
			d16->( cis b a) cis->( b a gis) a8 r r
		}
		\new Dynamics {
			s8 s\ff s-\markup \italic "très gai"
		}
		\new Staff = "down" \relative a {
			\clef treble   \global

			s4 |
			<d fis a>8 r <d e g a> r <d fis a> r q r |
			q r <d e g a> r <d fis a> r q r |
			<cis e a> r <b d a'> r <a cis a'> r q r |
			<d fis a> r <e gis a> r <a, cis e a> r q
		}
	>>
}
