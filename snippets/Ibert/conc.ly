music = {
	\time 2/4
	\set Score.tempoWholesPerMinute = #(ly:make-moment 92 4)
	<<
		\new Staff \with {
			fontSize = #-2
			\override StaffSymbol #'staff-space = #(magstep -2)
		} { 
			\set Staff.midiInstrument = #"flute"
			\clef treble
			\relative a'' {
				\acciaccatura { f8 } des'2\( ~ | des ~ |
				\tuplet 3/2 4 { des8 f, a des, f bes, } |
				des'2 ~ | des ~ |
				\tuplet 3/2 4 { des8\) f,( a des, f bes,) }
			}
		}
		\new PianoStaff <<
			\set PianoStaff.midiInstrument = #"acoustic grand" %"
			\context Staff = upper \relative a {
				\clef treble
				\mark \markup \smaller \box \number 52
				\override Score.MetronomeMark.self-alignment-X = -1.2
				\tempo \markup \normal-text "Tempo"
				\grace s8
				r4 <des es>4^( ~ | q16 <c f>4.. ~ | q2) |
				r4 <des es>4^( ~ | q16 <c f>4.. ~ | q2) |
			}
			\context Dynamics = dynamics { s2\pp }
			\context Staff = lower \relative a, {
				\clef bass
				\set Staff.beamExceptions = #'(
				(end .
					(
						((1 . 8) . (4 4))  
						((1 . 16) . (4 4))
					)))
				\grace s8
				<< {
					bes8-. <f' bes>-. es-. bes-. |
				} \\ {
					bes2\laissezVibrer
				} >>
				<f' bes>8-. es-. bes-. <f' bes>-. |
				es-. bes-. <f' bes>-. es-. |
				bes8-. <f' bes>-. es-. bes-. |
				<f' bes>8-. es-. bes-. <f' bes>-. |
				es-. bes-. <f' bes>-. es-. |
			}
		>>
	>>
}
