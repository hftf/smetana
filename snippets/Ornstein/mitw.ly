global = {
	% \set tupletSpannerDuration = #(ly:make-moment 1 4)
	\override Staff.TupletBracket #'bracket-visibility = #'if-no-beam
}
byetuplets = { \override TupletNumber #'stencil = ##f }
hituplets = { \revert TupletNumber #'stencil }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \revert Staff.TupletBracket #'bracket-visibility }
music = {
	\time 6/8
	\new PianoStaff <<
		\new Staff \relative a'  {
			\clef treble \global
			\mergeDifferentlyDottedOn
			<< {
				r8 fis'16 <b e> ~ q8
				\newSpacingSection
				\tuplet 3/2 { fis16 e <b' e> ~ } e8 b |
				% \override NoteColumn.force-hshift = #1.5
				<gis, b>4. <e gis>
			} \\ {
				\tuplet 5/4 8 { b=32 e fis b e } fis8. e16 \tuplet 3/2 { fis e b' } fis8 e16 b |
				fis e e8. d16 ~ \tuplet 3/2 { d c b } b8 b
			} >>
		}
		\new Staff \relative a   {
			\clef bass   \global
			\once \override Beam #'positions = #'(6 . 8)
			\tuplet 9/8 { a,,32 a' e' g b e \clef treble b cis e } b'8 ~
			\tuplet 9/6 { b16 b e, cis b e b g e } \clef bass |
			\set subdivideBeams = ##t
			\tuplet 3/2 8 { e, b' gis' b, gis' b } gis b r8 \tuplet 3/2 8 { r16 b[ gis \hibrackets r \set stemLeftBeamCount = #1 b b,] } |
		}
	>>
}
