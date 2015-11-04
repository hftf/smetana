#(set-default-paper-size "a3" 'landscape)

global = {
	\key e \major
	\set Staff.subdivideBeams = ##t
	\set Staff.baseMoment = #(ly:make-moment 1 8)
}

byetuplets = { \override Staff.TupletNumber #'stencil = ##f }
hituplets = { \revert Staff.TupletNumber #'stencil }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \revert Staff.TupletBracket #'bracket-visibility }

music = {
	\time 4/4
	\new PianoStaff <<
		\new Staff = "up" \relative a {
			\clef treble \global
			<fis c' e>8^^\f
			\byetuplets \byebrackets
			<< {
				<dis' dis'>-^ <gis gis'>-^ <dis' dis'>-^
				\override Staff.OttavaBracket.shorten-pair = #'(0.0 . -2)
				\ottava #1 \set Staff.ottavation = "8"
				<gis gis'>-^ <dis' dis'>-^
				\once \override Stem.length = #15
				\tuplet 3/2 <gis dis' fis gis>16-\tweak Y-offset #8.25 -^
			} \\ \tuplet 3/2 2 {
				dis,,16( fis a) gis( c dis) dis( fis a)
				gis( c dis) dis( fis a) gis
			} >>
			\ottava #0
			\tuplet 3/2 { <dis,, fis gis dis'>^>\ff\< q^> q^> <fis gis dis' fis gis>^> q^> }
			\set subdivideBeams = ##f
			\newSpacingSection
			<a b e a b>^^\noBeam\sf <a' b e>->
			\change Staff = "down" \clef treble <cis,! fis>->^\markup \italic "allarg."
			\change Staff = "up" <b e a>->
			\change Staff = "down" <gis cis>^>
			\change Staff = "up" <a b e>->
			\change Staff = "down" <cis,! fis>^>
			\change Staff = "up" <a b e>-\tweak Y-offset #'-0.5 ->
			<gis b e gis>8^^ <e' gis e'>^^ <e' gis e'>4^^ \bar "|."
		}
		\new Staff = "down" \relative a, {
			\clef bass   \global
			\byetuplets \byebrackets
			<< {
				\tuplet 3/2 { r16 }
				<c c'>8^^[^\markup \italic "più cresc." <e! e'!>^^ \clef treble <a a'>^^ <c c'>^^]
				<e e'>^^ \times 2/3 { <a a'>^^ c16^^ }
			} \\ {
				\tuplet 3/2 {
					s16 c,,( a' fis) e( c' a) a( e' c) c( a'
					fis) e( c' a) a( e' c)\noBeam
				}
			} \\ {
				\stemDown
				\once \override Score.FootnoteItem.annotation-line = ##f
				\footnote "*)" #'(0.1 . 0.1) "Lower octave, if preferred"
				<a,,, a'>4_^
			} >>
			\clef bass
			\tuplet 3/2 { <c'? e a c?>16^> <c e a c>^> q^> q^> q^> }

			<e=,, e'>4_^ s8 \hideNotes r16 \unHideNotes
			% TODO
			\clef bass <cis''! fis>16^>
			<< { e,8^^[ <b' e gis b>^^] <b' e gis b>4^^ } \\ <e=,, e'>4 >> 
		}
		\new Dynamics {
			s1\sustainOn
			s2\sustainOn
			s4.\sustainOn
			s8\sustainOff
		}
	>>
}
