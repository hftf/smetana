byetuplets = { \override Staff.TupletNumber #'stencil = ##f }
hituplets = { \override Staff.TupletNumber #'stencil = #ly:tuplet-number::print }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \override Staff.TupletBracket #'bracket-visibility = #ly:tuplet-number::print }

global = {
	\key a \minor
}

music = {
	\time 6/8
	\set Score.tempoWholesPerMinute = #(ly:make-moment 90 4)
	\new PianoStaff <<
		\new Staff = "up" \relative c''  {
			\clef treble \global

			<e bes' d e>4.( q | q ~ q8) <f bes d f>( <g bes cis g'> |
			<f a d f> <e e'> <f f'>) ~ q <e g b e>( <d d'> |
			<e g b e> <d d'> <e e'> ~ q) <a c e a>( <e e'> |
			<d f a d> <c c'> <d d'>) ~ q <c e gis c>( <b b'> |
			<c e gis c> <b b'> <c c'> <a dis a'> <g d' g> <f f'> |
			<e a cis e>4.)
		}
		\new Dynamics {
			s-\markup { \dynamic ff \italic "con espansione" }
		}
		\new Staff = "down" \relative c,  {
			\clef bass \global

			<a a'>4 \clef treble <g'' d' e g>8 ~ q4 q8 ~ |
			q q <a d e a> <bes d e bes'>4. |
			\clef bass
			<d,, a' d>8. <a'' d f a> <g,, d' g> <g'' d' f g> |
			<c,, g' c> <g'' c e g> <f,, c' f> <f'' c' e f> |
			<b,, f' b> <f'' b d f> <e,, b' e> <e'' gis d' e> |
			<d, d'> <c c'> <b b'> <bes bes'> |
			<a a'> <e'' a cis>
		}
	>>
}
