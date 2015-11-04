global = {
	\key g \minor
	\set tupletSpannerDuration = #(ly:make-moment 1 4)
	\tempo \markup {\normal-text "Con moto e passione"}
}
byetuplets = { \override TupletNumber #'stencil = ##f }
hituplets = { \revert TupletNumber #'stencil }
byebrackets = { \override TupletBracket #'bracket-visibility = ##f }
music = {
	\time 6/4
	\set Timing.baseMoment = #(ly:make-moment 1 4)
	\set Timing.beatStructure = #'(1 1 1 1 1 1)
	\new PianoStaff <<
		% \set PianoStaff.instrumentName = #"Piano  "
		\new Staff \relative a'  {
			\clef treble \global
			r4 <g c g'>-> ~ \times 2/3 { \byetuplets \byebrackets q8 ~ q16 <f c' f>8 q16 r q[ r <es as es'> r q] r q[ r <d as' d> r q] \hituplets } r q <c as' c>8
			r <c f as c> \times 2/3 { <d d'> <es es'> <f f'> } <d d'> <bes bes'> r << { <bes bes'>16 <c c'> q2 } \\ { \once \override NoteColumn #'force-hshift = #-1.0 <es ges>8 ~ q2 } >>
		}
		\new Staff \relative a   {
			\clef bass   \global
			r4^\markup{\italic "poco a poco cresc."} <g as c>4-> ~ \times 2/3 { q8 <f as c> q \byetuplets q <es as c> q q <d es as> q \hituplets } <d es^~ as~> <c es as>
			r <c f as> \times 2/3 { d es f } d bes r << { <es ges>^\markup{\italic "rit."} ~ q2 } \\ { bes16 c c2 } >>
		}
		\new Staff \relative a   {
			\clef bass   \global
			<< <g c es! g>1.-> <as,, as'>1.-> >>
			<f f'>2. <as as'>
		}
	>>
}
