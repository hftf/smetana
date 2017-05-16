global = {
	\key cis \minor
	\set Staff.baseMoment = #(ly:make-moment 3 4)
}
music = {
	\time 6/4
	\new PianoStaff <<
		\new Staff = "up" \relative a' {
			\clef treble \global
			\override Score.TimeSignature #'stencil = ##f 
			\tempo \markup \normal-text \column {
				"Con moto"
				\line { \lower #0.5 \number 2 / \note #"2." #1 }
			}
			\set Score.tempoWholesPerMinute = #(ly:make-moment 140 4)

			<< {
				cis8( e b dis a cis ~ cis2 b8 dis)
				cis8( e^\< b dis a\! cis b4^\> cis gis\!)
				cis8( e b dis a cis ~ cis2 b8 dis)
				cis8( e^\< b dis a\! cis b4^\> cis gis\!)
			} \\ {
				s2 a2.(
				\once \override NoteColumn.force-hshift = #1
					b4) |
				s2 a2.( e8 gis) |
				s2 a2.(
				\once \override NoteColumn.force-hshift = #1
					b4) |
				s2 a2.( e8 gis) |
			} >>
		}
		\new Dynamics {
			s1-\markup { \dynamic p \italic "dolce" }
		}
		\new Staff = "down" \relative a {
			\clef bass   \global
			a1. |
			<< { a4 b cis dis cis e, } \\ { a1 ~ a4 e } >> |
			a1. |
			<< { a4 b cis dis cis e, } \\ { a1 ~ a4 e } >> |
		}
	>>
}
