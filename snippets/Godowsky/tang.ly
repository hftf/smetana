global = {
	\key e \minor
}
menop = \tweak DynamicText.self-alignment-X #LEFT
         #(make-dynamic-script
            (markup #:normal-text #:italic "meno" #:dynamic "p"))

music = {
	\time 3/4
	\new PianoStaff <<
		\new Staff \relative a' {
			\clef treble \global \partial 2
			
			<< {
				s4 g8^\p( a |
				<g b>-. q-. q-. q-.) <fis ais d>4->( |
				\override Hairpin.to-barline = ##f
				<g b>2) a8^\<( g |
				\revert Hairpin.to-barline
				fis2\!) <a, g'>4->^\>( |
				e'8-.^\< e-. e-. e\! ~ e4) |
				r4 <dis fis b>-- r
			} \\ {
				<b= g' b>4-- dis4( |
				d!2) c8( d |
				e-. e-. e-. e-.) <g, dis'>4 |
				<ais d>2 cis8 dis |
				\once \override NoteColumn.force-hshift = 0.5 g,2 s4 |
				s r fis
			} \\ {
				s2 s2. s s
				\slurDown c'4-\shape #'((1 . 0.5) (0 . 1) (0 . 1) (0 . 1.25))( b
				\once \override NoteColumn.force-hshift = 1.6
				\stemDown <fis ais fis'>4)(_\p |
				b)\menop
			} >>
		}
		\new Staff \relative a, {
			\clef bass   \global \partial 2
			<b e g>4 <b,, b'> |
			<e e'> <b'' e g b>-- <b,, b'> |
			<e e'> <b'' e g b>-- <b,, b'> |
			<< {
				e'8-.( e-. e-.^\> e ~ e4\!)
			} \\ {
				<e, c'>4 \slurUp <c' c'>-\shape #'((1 . -0.5) (0 . -1) (0 . -1) (-0.5 . -0.75))( <b b'>) \slurNeutral
			} >> |
			\override Hairpin.to-barline = ##f
			<e, e'> <d' e g d'>^\(
				<c fis c'>^\>^\shape #'((0 . -2.5) (0 . -1.75) (0 . -1.75) (-1 . -1))( |
			<b b'>\!)\) <fis'' b>-- <fis,, fis'>
		}
		\new Dynamics {
			s4 s4\sustainOn |
			s2\sustainOn s4\sustainOn |
			s2\sustainOn s4\sustainOn |
			s2\sustainOn s4\sustainOn |
			s4\sustainOn s4\sustainOn s4\sustainOn |
			s2\sustainOn s4\sustainOn |
		}
	>>
}
