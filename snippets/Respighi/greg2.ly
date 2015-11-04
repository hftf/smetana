#(set-default-paper-size "a3" 'landscape)

byetuplets = { \override Staff.TupletNumber #'stencil = ##f }
hituplets = { \override Staff.TupletNumber #'stencil = #ly:tuplet-number::print }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \override Staff.TupletBracket #'bracket-visibility = #ly:tuplet-number::print }

global = {
	\key cis \minor
	\numericTimeSignature

	% \set Staff.baseMoment = #(ly:make-moment 1 4)
	\set Staff.beatStructure = #'(1 1 1 1)
}


\layout {
	\context {
		\Score
		\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/2)
		
	}
}

music = {
	\time 2/2
	\set Score.tempoWholesPerMinute = #(ly:make-moment 172 4)
	\new PianoStaff <<
		\new Staff \relative a {
			\clef bass \global
			\byetuplets \byebrackets

			\tuplet 3/2 2 {
				e8( fis e <fis b> e b fis' e fis e <cis' e> b) | \clef treble
				b( cis b <fis' b>^\markup { \italic "string." } e b fis' e fis e <cis' e> b) |
				b( cis b <fis' b> e b fis' e fis e <cis' e> b) |
				b( cis b <fis' b> e b
					\ottava #1
					\set Staff.ottavation = "8"
					\once \override Staff.OttavaBracket.outside-staff-priority = ##f
					\once \override Staff.OttavaBracket.Y-offset = 5.8
					fis' e fis e <cis' e> b) | \bar "||"
				\tempo \markup \normal-text "Tempo I."
				\set Staff.baseMoment = #(ly:make-moment 1 4)
				<gis cis> cis, <gis' cis> cis, <cis gis'> gis
				<cis gis'> gis \ottava #0 <gis cis> cis, <gis' cis> cis, |
				<cis gis'> gis <cis gis'> gis <gis cis> cis,
				<gis' cis> cis, <cis gis'> gis <cis gis'> gis |
			}

		}
		\new Dynamics {
			\override DynamicTextSpanner.dash-period = #-1
			s2\ff s8 s4.\cresc
			s1*3
			s1\ff
		}
		\new Staff \relative a,,   {
			\clef bass \global

			<e e'>2-^ \tuplet 3/2 { q4 <gis gis'> <b b'> } |
			q2 <b' b'>8 <gis gis'>4. |
			<cis cis'>2-^ \clef treble <cis' cis'>8 <b b'>4 q8 |
			q4 <gis gis'> <b b'>8 <cis cis'> <dis dis'>4 | \clef bass
			<cis,,, cis'>4 <e e'>2.-> |
			\tuplet 3/2 { <cis cis'>4 <e e'> <fis fis'> } <gis gis'>2 |
		}
	>>
}
