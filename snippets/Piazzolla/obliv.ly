global = {
	\key c \minor
}
rall = \tweak self-alignment-X #-0.6
	#(make-dynamic-script #{ \markup { \normal-text \italic rall. } #})

music = {
	\time 4/4
	<<
	\new StaffGroup \with {
		fontSize = #-2
		\override StaffSymbol #'staff-space = #(magstep -2)
	} <<
		\new Staff { 
			\set Score.skipBars = ##t
			\set Staff.instrument = \markup { "Violin" }
			\set Staff.midiInstrument = #"violin"
			\clef treble \global
			\relative a'' {
				c1 ~ c ~ c ~ c ~ c\fermata \bar "|."
			}
		}
		\new Dynamics { s1\p s s4 s2.\rall s1 s4 s2.\> s\!}
		\new Staff { 
			\set Score.skipBars = ##t
			\set Staff.instrument = \markup { "Cello" }
			\set Staff.midiInstrument = #"cello"
			\clef bass \global
			\relative a {
				g4. as8( ~ as4 g--)
				bes4. as8( ~ as4 g--)
				c4. d8( ~ d4 bes--)
				as4. g8( ~ g4 f--)
				g1\fermata

			}
		}
		\new Dynamics { s1\p s s4 s2.\rall s1 s4 s2.\> s\!}
		\new Dynamics { s-\hide\p } % TODO ugly
	>>
	\new PianoStaff <<
		\set Score.skipBars = ##t
		\set PianoStaff.instrument = \markup { "Pianoforte." }
		\set PianoStaff.midiInstrument = #"acoustic grand"
		\context Staff = upper \relative a {
			\clef treble \global
			<g g'>8( es' c) <as as'>( es' c) <g g'>( es') |
			<g, g'>( es' c) <as as'>( es' c) <g g'>( es') |
			<c c'>( g' es) <d d'>( g es) <bes bes'>( es) |
			<as, as'>( es' c) <g g'>( es' c) <f, f'>( c') |
			<as c d g>1\arpeggio\fermata
		}
		\new Dynamics { s1\pp s s4 s2.\rall s1 s4 s2.\> s\!}
		\context Staff = lower \relative a,, {
			\clef bass \global
			c4. as'8 as4 g |
			c,4. as'8 as4 g |
			c,4. as'8 as4 g |
			c,4. as'8 as4 g |
			<c, g' es'>1\arpeggio\fermata
		}
	>>
	>>
}
