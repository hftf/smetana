#(set-default-paper-size "a3" 'landscape)

byetuplets = { \override Staff.TupletNumber #'stencil = ##f }
hituplets = { \override Staff.TupletNumber #'stencil = #ly:tuplet-number::print }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \override Staff.TupletBracket #'bracket-visibility = #ly:tuplet-number::print }

hat = \markup { \line { \path #0.1 #'((moveto 0 1)(rlineto 0 0.5)(rlineto 2 0)(rlineto 0 -0.5)) } }
rhMarkText = \markup {
	\override #'(baseline-skip . 2)
	\center-column {
		\line { \override #'(font-encoding . latin1) \normalsize \fontsize #-1 \italic "m.d." }
		\hat
}}

global = {
	\key gis \minor

	\set Staff.baseMoment = #(ly:make-moment 1 4)
	\set Staff.beatStructure = #'(1 1 1 1 1 1)
	\byetuplets \byebrackets
}


\layout {
	\context {
		\Score
		\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/2)
		\override DynamicTextSpanner.dash-period = #-1
	}
}

music = {
	\time 3/2
	\set Score.tempoWholesPerMinute = #(ly:make-moment 172 4)
	\new PianoStaff <<
		\new Staff \relative a' {
			\clef treble \global
			% \override Staff.TupletNumber.outside-staff-priority = ##f
			\override Staff.TupletNumber.X-offset = #3.75
			\slurUp

			% << { gis2 fis4 e fis gis } \\ { <gis, e'>2 gis <gis cis>4 r } >> |
			% \tuplet 3/2 { r8 b'( a gis e cis b gis' fis e cis b e a, gis b fis e) } |
			<< {
				gis2\( fis4 e
					\hituplets \once \override Staff.TupletNumber.Y-offset = #2
					\tuplet 3/2 { e( fis gis)\) } \byetuplets
			} \\ {
				<gis, e'>2 gis <gis cis>4 r
			} >> |
			\tuplet 3/2 { r8 b'( a gis e cis b gis' fis e cis b e a, gis b fis e) } |
			\override Staff.TupletNumber.Y-offset = #3
			<< {
				b''2\( ais4 gis \hituplets \tuplet 3/2 2 { gis( ais b)   } |
				dis2 cis4 b    \tuplet 3/2 2 { b(   cis dis) \byetuplets |
				<b, gis' b e>8\noBeam\) }
			} \\ {
				<b gis'>2 b1 |
				<b gis'>2 <dis gis> <dis gis> |
			} >>
			\tuplet 3/2 {
				b'8( ais gis e cis b gis' fis e cis b e b gis ais b e
				) |
				% <b fisis'>)
			}
		}
		\new Dynamics {
			% s2\p s1\cresc
			% s1.\f\>
			s2\p s16. s32\cresc s4. s2
			s2\f s1\dim
			s2\mf s16. s32\cresc s4. s2
			s1.\cresc
			s4\sf s\dim s1\!
			% s4\sf s\dim s1
		}
		\new Staff \relative a   {
			\clef bass \global
			\set fingeringOrientations = #'(up)

			\tuplet 3/2 {
				gis,8 e' d,   gis  e' <b'\finger \rhMarkText>
				gis,  e' d,   gis  e' <b'\finger \hat>
				gis,  e' cis, gis' e' <cis'\finger \hat>
			}
			<cisis,,, cisis'>4 <e' e'>2 q q4
			\tuplet 3/2 {
				b'8 gis' dis, b' gis' <dis'\finger \hat>
				b,  gis' dis, b' gis' <dis'\finger \hat>
				b,  gis' dis, b' gis' <dis'\finger \hat>
			}
			\tuplet 3/2 {
				b,  b'   dis,, b' gis' <dis'\finger \hat>
				b,  gis' dis,  b' gis' <dis'\finger \hat>
				b,  gis' dis,  b' gis' <dis'\finger \hat>
			}
			\hituplets \override Staff.TupletNumber.Y-offset = #-6.25
			\tuplet 3/2 2 { <dis,,, dis'>4( <b' b'> <gis' gis'>) }
				<e' e'> <gis, gis'>2 <dis dis'>4
		}
	>>
}
