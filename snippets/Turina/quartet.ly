sfr = #(make-dynamic-script "sfr")
dimmolto = \tweak DynamicText.self-alignment-X #LEFT
         #(make-dynamic-script
            (markup #:normal-text #:italic "dim. molto"))

global = {
}
music = {
	\time 3/4
	\override Score.TimeSignature #'style = #'single-digit
	\set Score.beamExceptions = #'()
	<<
	\new Staff \with {
		fontSize = #-2
		\override StaffSymbol #'staff-space = #(magstep -2)
	} { 
		\set Score.skipBars = ##t
		\set Staff.instrument = \markup { "Violin" }
		\set Staff.midiInstrument = #"violin"
		\clef treble \global
		\relative a'' {
			R2.*2 |
			b8-.(\sfr b-.) b4 e8( b') |
			b,,8-.( b-.) b4\dimmolto e8( b') |
			e,,4\p( d8 e) g( a) |
		}
	}

	\new Staff \with {
		fontSize = #-2
		\override StaffSymbol #'staff-space = #(magstep -2)
	} { 
		\set Score.skipBars = ##t
		\set Staff.instrument = \markup { "Viola" }
		\set Staff.midiInstrument = #"violin"
		\clef alto \global
		\relative a' {
			R2.*2 |
			<g cis>2.\sfr | r4 cis,(\dimmolto <c e>) | b2.\pp
		}
	}

	\new Staff \with {
		fontSize = #-2
		\override StaffSymbol #'staff-space = #(magstep -2)
	} { 
		\set Score.skipBars = ##t
		\set Staff.instrument = \markup { "Cello" }
		\set Staff.midiInstrument = #"cello"
		\clef bass \global
		\relative a, {
			R2.*2 | a2.\sfr | r4 g'(\dimmolto d) | <g, d'>2.\pp
		}
	}
	\new PianoStaff <<
		\set Score.skipBars = ##t
		\set PianoStaff.instrument = \markup { "Pianoforte." }
		\set PianoStaff.midiInstrument = #"acoustic grand"
		\context Staff = upper \relative a' {
			\clef treble \global
			\mark \markup \smaller \box \musicglyph #"four"
				<< {
					e4\( dis8 e g a |
					b b b4 c8 d! |
					e2\)
				} \\ {
					cis='2 e8 <dis! fis> |
					<d! fis gis> <d fis gis> q2 |
					<g! b cis>
				} >> r4 |
				<cis=' e g b>2\( <c e fis b>4 |
				<b d e b'>\) r r
		}
		\context Dynamics = dynamics { s2.\mf s s s4 s\dimmolto }
		\context Staff = lower \relative a, {
			\clef bass \global
			<a g'>2 <d! c'>4 |
			<e, b' e>2. |
			<a e' a>2 r4 |
			q2 <d, a' d>4 |
			<g d' g> r r
		}
	>>
	>>
}
