byetuplets = { \override Staff.TupletNumber #'stencil = ##f }
hituplets = { \override Staff.TupletNumber #'stencil = #ly:tuplet-number::print }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \override Staff.TupletBracket #'bracket-visibility = #ly:tuplet-number::print }

global = {
	\key aes \major
	\tempo \markup \normal-text "Non allegro."
}

music = {
	\time 3/4
	\new PianoStaff <<
		\new Staff = "up" \relative a'  {
			\clef treble \global
			\byetuplets

			r4 << {
			\tuplet 3/2 4 {
				as8( c bes es c es |
				as, c bes es c es as, c bes |
				es c es as, c bes es c es) |
				as,( c bes es c es as, c bes |
				es c es as, c bes es c es) |

			} } \\ {
				s2 | s2. |
				r4 f,-- es-- |
				as2.-- ~ | as4 f-- es-- |
			} >>
		}
		\new Dynamics {
			s2.\pp s s4 s2\p
		}
		\new Staff = "down" \relative a,   {
			\clef bass \global

			R2.*3 | \stemDown
			r8 as,-\shape #'((0 . 2) (0 . 2) (0 . -2) (0 . 0))( es'' c' as des |
			c es) r4 r
		}
	>>
}
