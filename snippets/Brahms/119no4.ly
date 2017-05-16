global = {
	\key es \major
}

byetuplets = { \override Staff.TupletNumber #'stencil = ##f }
hituplets = { \revert Staff.TupletNumber #'stencil }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \revert Staff.TupletBracket #'bracket-visibility }

music = {
	\time 2/4
	\new PianoStaff <<
		\new Staff = "up" \relative a {
			\clef bass \global

			\set Score.tempoWholesPerMinute = #(ly:make-moment 128 4)
			% \override Staff.TupletBracket #'direction = #UP
			% \override Staff.TupletNumber.Y-offset = #4
			\tuplet 3/2 { <es c'>8->(\( g <es c'>) } <d g d'>4\)-> |
			\tuplet 3/2 { <c c'>8->(\( g' <c, c'>) } <d g d'>4\)-> |
			\tuplet 3/2 { <g g'>8->\( es' <f, f'> } d'4\)-> |
			\tuplet 3/2 { <es, es'>8->\( g <des des'> } bes'4\)-> |
			\clef treble
			\tuplet 3/2 { <c c'>8\( as' <bes, bes'> } g'4\) |
			\byebrackets \byetuplets
			\tuplet 3/2 4 { <c, c'>8^\([ as' <bes, bes'> g' <as, as'> f'\)] } |
			\tuplet 3/2 { <fis, fis'>8\( es' <fis, fis'> } <g d' g>4\) |
			\tuplet 3/2 { <a a'>8\( es' <a, a'> } <g d' g>4\) |

		}
		\new Dynamics {
			s2\p s s s s\> s\> s\!
		}
		\new Staff = "down" \relative a, {
			\clef bass   \global

			<< {
				\tuplet 3/2 { c8( g c } g4) |
				\tuplet 3/2 { c8( g c } g4) |
				\tuplet 3/2 { es'8( g, d' } g,4) |
				\tuplet 3/2 { c8( g bes } g4) |
				\byetuplets
				\tuplet 3/2 { as8( c g } bes4) |
				\tuplet 3/2 4 { as8([ c g bes f as)] } |
				\tuplet 3/2 { es( as es } g4) |
				\tuplet 3/2 { es8( a es } g4) |
			} \\ {
				c,4 c | c c | c c | c c |
				\byebrackets
				\tuplet 3/2 { c( c8) ~ } c4 |
				\tuplet 3/2 { c c c } |
				c g | c g |
			} >>
		}
	>>
}
