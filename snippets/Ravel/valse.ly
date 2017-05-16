byetuplets = { \override Staff.TupletNumber #'stencil = ##f }
hituplets = { \override Staff.TupletNumber #'stencil = #ly:tuplet-number::print }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \override Staff.TupletBracket #'bracket-visibility = #ly:tuplet-number::print }

global = {
	\key a \minor
}

music = {
	\time 3/4
	\set Score.tempoWholesPerMinute = #(ly:make-moment 140 4)
	\new PianoStaff <<
		\new Staff = "up" \relative c''  {
			\clef treble \global
			\tempo \markup \normal-text \concat { "Revenez au Mouv" \raise #.5 t }
			\accidentalStyle piano

			<< { b4^\>( c\!) } \\ <e, g>2 >> <c' e g c>4->( ~ |
			\set Score.tempoWholesPerMinute = #(ly:make-moment 154 4)
			<c es g c> <bes d fis bes>) <e, gis cis> |
			\set Score.tempoWholesPerMinute = #(ly:make-moment 168 4)
			<e' g b e>->( <d fis ais d>) <gis, bis eis> |
			\set Score.tempoWholesPerMinute = #(ly:make-moment 180 4)
			\ottava #1
			\set Timing.beamExceptions = #'()
			<dis'' gis>8->( <c e>) <e g>( <cis eis>) <f bes>->( <d fis>) |
			\set Score.tempoWholesPerMinute = #(ly:make-moment 190 4)
			<fis a>( <es g>) <g c>->( <e gis>) <gis b>( <f a>) |
			\bar "||"
		}
		\new Dynamics {
			s2 s4-\f | s2.\< s s s s\!
		}
		\new Staff = "down" \relative c'  {
			\clef bass \global

			<< { r4 \oneVoice \tuplet 3/2 { g8(_\< c e) } cis4\! } \\ <cis,, cis'>2. >> |
			<d d'>2 <ais' ais'>4 |
			<fis fis'>2 <d' d'>4 |
			<ais ais'>->( <b b'>) <c c'>->( | <cis cis'>) <d d'>->( <dis dis'>) |
		}
	>>
}
