music = {
	\new Staff \relative a {
		\clef treble
		\time 2/4
		\set Score.tempoWholesPerMinute = #(ly:make-moment 80 4)
		\set Staff.midiInstrument = #"flute"

		\partial 4
		\tuplet 5/4 { des16\( f as bes es }

		\bar "||"
		\once \override Score.MetronomeMark.outside-staff-priority = ##f
		\tempo \markup \normal-text "a Tempo"
		\time 6/8

		f4. des ~ | des8\) as\( es' f, bes ges |
		f'4. des ~ | des8\) as\( es' f, bes ges |
		as'4.\< ~ as8 ces4 ~ | ces8 bes\> as\) as4.\! |
	}
}
