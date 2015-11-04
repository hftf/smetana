rf = #(make-dynamic-script "rf")

byetuplets = { \override Staff.TupletNumber #'stencil = ##f }
hituplets = { \override Staff.TupletNumber #'stencil = #ly:tuplet-number::print }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \override Staff.TupletBracket #'bracket-visibility = #ly:tuplet-number::print }

global = {
	\key aes \major
}

fakeTrebleClef = {
	\set Staff.clefGlyph = #"clefs.G"
	\set Staff.clefPosition = #-2
	\set Voice.middleCPosition = #-6
}
unfakeTrebleClef = {
	\clef bass
	\set Staff.clefPosition = #2
	\set Voice.middleCPosition = #6
}

music = {
	\time 3/4
	\new PianoStaff <<
		\new Staff = "up" \relative a''  {
			\clef treble \global
			\mergeDifferentlyDottedOn

			\tuplet 6/4 4 {
				bes16(_\markup \italic "dolce e lusigando" es c f, c as')
				bes( es c f, c as')
				bes( es c f, c as')
				<< {
					bes es c f, c as'
					as des bes es, bes r
					ges' ces as des, as as' |
					bes4
				} \\ {
					bes8.*5/3( as16
					as4*3/2
					ges8.*5/3 as16) |
					\override Beam.auto-knee-gap = #0.1
					\oneVoice
					bes-\shape #'((0 . -1) (1 . 3) (0 . 2) (0 . -2))( es c! f,! c
						\change Staff = "down" \fakeTrebleClef
						as
						\change Staff = "up"
					bes es c f, c
						\change Staff = "down" \unfakeTrebleClef
						as)
						\change Staff = "up"
				} >>
				\clef bass << {
					bes( es c f, des as')
				} \\ {
					bes8.*5/3( as16)
				} >>
			}
		}
		\new Dynamics {
			s2. s s2 s8..\rf\> s32\!
		}
		\new Staff = "down" \relative a''   {
			\clef treble \global

			R2. |
			ges16(-. des-. as-. es-.)
			fes'(-. ces-. ges-. des-.)
			as'(-. fes-. ces-. ges-.) | \clef bass <<
				\new Voice = "one" { \voiceOne s2 } \\
				\new Voice = "two" { \voiceTwo
					as,,4 ~ as8 bes\rest des( as')
				} >> |
		}
	>>
}
