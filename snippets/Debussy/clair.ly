global = {
	\key des \major
	\tempo \markup {\normal-text "Tempo rubato"}
}
music = {
	\time 9/8
	\new PianoStaff <<
		\new Staff \relative a''  {
			\clef treble \global
			\times 3/2 { r8 <f bes f'>--\( ~ }
			q <es bes' es>-- q--
			q-- <des bes' des>-- q--
			q-- <c ges' bes c>-- q--
			\times 3/2 { q-- <des bes' des>-- }
			<bes ges' bes>4.-- \)
		}
		\new Staff \relative a   {
			\clef bass \global
			<< {
				\times 3/2 { r8 \clef treble
				\once \override NoteColumn.force-hshift = #1.7
				\override Tie.minimum-length = 4
				\override TieColumn.tie-configuration = #'((0.0 . 1) (-2.0 . 1) (-4.0 . -1))
					<f' ges bes>_-_\( ~ }
				q <es ges bes>_- q_-
				q_- <des ges bes>_- q_-
				q_- <c ges' bes>_- q_-
				\times 3/2 { q_- <des ges bes>_- }
				<bes des ges>4._- \)
			} \\ {
				<es,,, es'>2.
			} >>
		}
	>>
}
