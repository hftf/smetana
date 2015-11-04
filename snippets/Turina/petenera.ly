% #(set-default-paper-size "a3" 'landscape)

byetuplets = { \override Staff.TupletNumber #'stencil = ##f }
hituplets = { \override Staff.TupletNumber #'stencil = #ly:tuplet-number::print }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \override Staff.TupletBracket #'bracket-visibility = #ly:tuplet-number::print }

global = {
	\key cis \minor
}

\layout {
	\context {
		\Score
		\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/6)
		
	}
}

music = {
	\time 3/8
	\set Score.tempoWholesPerMinute = #(ly:make-moment 90 4)
	\new PianoStaff <<
		\new Staff = "up" \relative c'  {
			\clef treble \global
			\partial 4

			s8
			<< {
				e(^\pp | fis8. e16 dis!8 | dis e fis | fis4. ~ | fis) |
				fis8.( e16 dis8 ~ | dis fis e | dis4. ~ | dis4) b'8 |
			} \\ {
				d,8 | cis4. | cis | dis8. e16 dis8 ~ | dis16 e dis8. e16 |
				cis4. ~ | cis | cis ~ | cis4 fis8 |
			} >>
		}
		\new Dynamics {
			\override DynamicTextSpanner.dash-period = #-1
			s
		}
		\new Staff = "down" \relative c   {
			\clef bass \global

			gis'4 |
			a,8( e' a | \clef treble a' dis4) \clef bass |
			b,,8( fis' b | \clef treble b' fis'4) \clef bass |
			a,,,8( e' a | \clef treble a' dis4) \clef bass |
			gis,,,8( dis' gis | \clef treble gis' <a dis>4) \clef bass |
		}
		% \new Dynamics {
		% 	\set pedalSustainStyle = #'mixed
		% 	s4\sustainOn \repeat unfold 8 { s4.\sustainOff\sustainOn }
		% 	\repeat unfold 2 { s4.\sustainOff\sustainOn s4\sustainOff\sustainOn s8\sustainOff\sustainOn }
		% 	\repeat unfold 3 { s4.\sustainOff\sustainOn }
		% 	s4.\sustainOff
		% }
	>>
}
