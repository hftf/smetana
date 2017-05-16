music = {
	\time 2/4
	% \set Score.tempoWholesPerMinute = #(ly:make-moment 92 4)
	<<
		\new Staff \with {
			fontSize = #-2
			\override StaffSymbol #'staff-space = #(magstep -2)
		} { 
			\set Staff.midiInstrument = #"flute"
			\clef treble
			\relative a''' {
				a16\ff r r8 r4 | R2 | R | r4 r8 b,16(\f cis |
				d8) b-. d-. b-. | d16([ fis] e8) r cis-. |
				d-. b-. d-. b-. | d16([ fis] e8) r4 |
			}
		}
		\new PianoStaff <<
			\set PianoStaff.midiInstrument = #"acoustic grand" %"
			\context Staff = upper \relative a' {
				\clef treble
				\override Score.MetronomeMark.padding = 5
				\tempo \markup \normal-text "Presto giocoso" 4 = 160-168
				<a cis e a>4-> <b d gis>8-. <cis a'>-. |
				<b d>->( <a cis>-.) r <cis a'>-. |
				<b gis'>-. <cis a'>-. <b gis'>-. <cis a'>-. |
				<b d>->( <a cis>-.) r4 |
				<d fis a d>-. <b d fis b>-. |
				q8->( <e gis b e>) r4 |
				<d fis a d>-. <b d fis b>-. |
				q8->( <e gis b e>) r4 |

			}
			\context Dynamics = dynamics { s16\ff s-\markup \italic "Très mordant" s4. s2 s s s\f }
			\context Staff = lower \relative a,, {
				\clef bass
				<a a'>4 q8 q | q4 r8 a''-. |
				a,-. a'-. gis,-. a'-. | gis->( a) r4 |
				\clef treble
				<< <fis' a>4 \\ { d8 a-. b-. a-. } >> |
				b[ e gis b] |
				<< <fis a>4 \\ { d8 a b a } >> |
				b[ e gis b] |
			}
			\context Dynamics = pedal { s2 s4. s8-\markup \italic "sans péd." s2 s\sustainOn }
		>>
	>>
}
