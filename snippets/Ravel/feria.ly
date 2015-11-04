#(set-default-paper-size "a3" 'landscape)

byetuplets = { \override Staff.TupletNumber #'stencil = ##f }
hituplets = { \override Staff.TupletNumber #'stencil = #ly:tuplet-number::print }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \override Staff.TupletBracket #'bracket-visibility = #ly:tuplet-number::print }

hat = \markup { \line { \path #0.1 #'((moveto 1.0 0.0)(rlineto -0.5 0.0)(rlineto 0.0 2.25)(rlineto 0.5 0.0)) } }

bassFloat = { \once \override Staff.Clef.X-extent = #'(0 . 0.5) \clef bass }

global = {
	\key c \major
}

\layout {
	\context {
		\Score
		\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/2)
		
	}
}

music = {
	\time 6/8
	\set Score.tempoWholesPerMinute = #(ly:make-moment 100 4)
	\new PianoStaff <<
		\new Staff = "up" \relative a  {
			\clef bass \global
			
			r16 b( a b a g  e) b'( a b a g |
			e) b'( a b a g  e) b'( a b a g |
			f) b(  a b a g  f) b(  a b a g |
			f) b(  a b a g  f) b(  a b a g |
			% \newSpacingSection
			e)\noBeam \clef treble
					b''( <c, e a>\arpeggio b' a g
				<b, c e>\arpeggio b' a b <c, e a>\arpeggio g' |
			e b' <c, e a>\arpeggio b' a g
				<b, c e>\arpeggio b' a b <c, e a>\arpeggio g'
			) |
			% f)\noBeam
		}
		\new Dynamics {
			s2.\pp s s s s16 s\< s4. s2 s s\!
		}
		\new Staff = "down" \relative a,   {
			\set Staff.timeSignatureFraction = 2/4
			
			\clef bass \global

			\scaleDurations 3/2 {
			<< {
				r8 \clef treble r16 g='( <b c e g>8-.) <c, e g>-. |
				r8 \clef treble r16 g'( <b c e g>8-.) <c, e g>-. |
				\set fingeringOrientations = #'(left)
				r8 \clef treble r16 g'( <a c d f g\finger \hat -1>8-.) <c, d f g>-. |
				r8 \clef treble r16 g'( <a c d f g>8-.) <c, d f g>-. |
			} \\ {
				c=,8 r r r32 \bassFloat g g' g, |
				c8 r r r32 \bassFloat g g' g, |
				c8 r r r32 \bassFloat g g' g, |
				c8 r r r32 \bassFloat g g' g, |
			} >>
			}
			\set Staff.timeSignatureFraction = 6/8
			c8[ r <c' e b'>\arpeggio r <g' e' g>\arpeggio] r32 g,, g' g, |
			c8[ r <c' e b'>\arpeggio r <g' e' g>\arpeggio] r32 g,, g' g, |

		}
	>>
}
