global = {
	\key g \minor
}
music = {
	\time 4/4
	\new PianoStaff <<
		\set PianoStaff.connectArpeggios = ##t
		\new Staff = "up" \relative a {
			\clef treble \global
			\tempo \markup \normal-text "Andante cantabile"

			R1 | r2 r8 d8( e fis) |
			g( a\< bes c d\! g fis\> g) | d2\p r8 << {
				d(\< a\arpeggio c\! |
				<d, g bes>)
			} \\ {
				s8 <es=' g>4\arpeggio
			} >> r8 r4\> r8\! << {
				bes'(\p fis\arpeggio a | g2)
			} \\ {
				s16 s\>_\markup \italic "espress." c,!4(\arpeggio | bes2)\!
			} >>
		}
		\new Staff = "down" \relative a, {
			\clef bass   \global

			g4^\p d'( <g bes d>2) | g,4 d'( <g bes d>2) |
			g,4 d'( <g bes d>) a,( | bes) g'( <d' g>) << {
				c,( |
				d8) es'( cis es d) s4. | r8 es,(\> cis es\! d2) |
			} \\ {
				s4 d8 \oneVoice r <g bes> r q r d4( | g,1)
			} >>
		}
		\new Dynamics {
			s1\sustainOn | s2 s8. s16\sustainOff s4 |
			s2\sustainOn s8. s16\sustainOff s4 | s2\sustainOn s8. s16\sustainOff s4 |

		}
	>>
}
