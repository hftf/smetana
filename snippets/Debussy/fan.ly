global = {
	\key g \major
	% \set tupletSpannerDuration = #(ly:make-moment 1 4)
	% \override Staff.TupletBracket #'bracket-visibility = #'if-no-beam
}
music = {
	\time 3/4
	\new PianoStaff \with {
    \override StaffGrouper.staff-staff-spacing = #'(
                            (basic-distance . 12)
                            (padding . 0))
    } <<
		\new Staff = "up" \relative a'  {
			\clef treble \global s8
			<< {
				<e e'>8.\(\mf <fis fis'>16 <e e'>8 q4->\) <e_~ e'~>8\(  |
				\tuplet 3/2 { q q <b' b'> } <fis fis'>4 <e_~ e'~>\) |
				q8\( <fis fis'> b4 d\) |
				<e, e'>2.->
			} \\ {
				<g=' b>2 q4 q2 q4 q b, d
			} >>
		}
		\new Staff = "down" \relative a   {
			\clef bass \global
			\partial 8
			\set subdivideBeams = ##t
			\override Beam #'auto-knee-gap = #4
			\override TupletNumber #'stencil = ##f
			\shape #'((0.7 . 0.4) (0.5 . 2.4) (0.3 . 2.3) (0 . 0.2)) Slur
			\tuplet 10/4 { fis32[( a b cis dis \change Staff = "up" fis a b cis dis]) } \change Staff = "down"
			\revert TupletNumber #'stencil
			\newSpacingSection
			\mark \markup \concat { "A"\super "2" }
			<g,,, d' g b d>2\arpeggio <d' g b d>4 |
			<g, d' g b d>2\arpeggio <d' g b d>4 |
			<g, d' g b>\arpeggio r r |
			a'( g a)
		}
	>>
}
