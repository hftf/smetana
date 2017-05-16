global = {
	\key bes \minor
	\mergeDifferentlyDottedOn
	\set Staff.baseMoment = #(ly:make-moment 1 8)
}
music = {
	\time 4/4
	\new PianoStaff <<
		\new Staff = "up" \relative a' {
			\clef treble \global
			\set Score.tempoWholesPerMinute = #(ly:make-moment 112 4)

			\set Staff.subdivideBeams = ##t
			bes8
			<< {
				f'16^\markup \italic "espressivo" as es ges des f
				ges, bes f as es[ ges]
				es' ges des f ces es
				f, as es ges des f
				des'[ f c es bes des]
				c,( es des f es) ges8. ~

				<es ges>8([ <d f> <es ges>) r16 <f as>] |
			} \\ {
				f'8( es des ges,[ f es)]
				es'( des ces f, es des)\noBeam
				des'( c bes) c,\p des es4 ~
				\hideNotes es8
			} >>
		}
		\new Dynamics {
			s1 s s4. s-\markup \italic "poco crescendo e più agitato"
		}
		\new Staff = "down" \relative a' {
			\clef bass   \global
			es8_\pp r r4
			r16 << { es,,( ces' ges' \oneVoice ces8) } \\ es,,8.\sustainOn >> r8 |
			r4
			r16 << { f( des' f \oneVoice bes8) } \\ f,8.\sustainOn >> r8
			r4 |
			r16 << ges8.\sustainOn \\ {
			ges16^\( des' es beses' as ces beses
			c\) as^( ces beses c b d c) |
			} >>
		}
		\new Dynamics {
		}
	>>
}
