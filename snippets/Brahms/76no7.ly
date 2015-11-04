global = {
	\key a \minor
}
paren =
#(define-event-function (parser location dyn) (ly:event?)
   (make-dynamic-script
    #{ \markup \concat {
     \normal-text \italic (
	 \pad-x #0.2 #(ly:music-property dyn 'text)
	 \normal-text \italic )
       }
    #}))

byetuplets = { \override Staff.TupletNumber #'stencil = ##f }
hituplets = { \revert Staff.TupletNumber #'stencil }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \revert Staff.TupletBracket #'bracket-visibility }

music = {
	\time 2/2
	\new PianoStaff <<
		\new Staff = "up" \relative a' {
			\clef treble \global
			\tempo \markup \normal-text "Moderato semplice"
			\partial 2

			<< {
				<e c' e>4(\mp <a c a'> | d2 <c e>4) r |
				r2 e,4( a | g4. f8 e4.)-\shape #'((0 . 2) (0 . 2) (0 . 1) (-0.5 . -3))(\< dis8 |
				e4. dis8 <e e'>4)( \oneVoice <a c a'>\mp | <g d' g>4. <f d' f>8 ~ q4. <e c' e>8 ~ |
				q4. <d b' d>8 <c a' c>4 <b gis' b>) | r
				% \override DynamicLineSpanner #'outside-staff-priority = ##f
				% \override Slur.outside-staff-priority = #4
				<c a' c>( ^\< <b gis' b>4.\> <a a'>8)\! |
				q4_\portato r8 e''8( ~ e dis e dis) \bar "||"
			} \\ {
				s2 | <g=' g'>4. <f f'>8 e4.( dis8\> |
				e4. dis8 e4)\p c | b2 c4 r4
			} >>
		}
		\new Staff = "down" \relative a,, {
			\clef bass   \global

			<a a'>2( | <b b'> <c c'>4) r |
			e'4.( dis8 e4 <f, c'>) | <g g'>2 <c g'>4 r |
			e4.( dis8) <e, e'>4( <a, a'> | <b b'>2 <c c'> |
			<d d'> <e e'>4.)(^\> <dis dis'>8 | <e e'>4. <dis dis'>8 <e e'>4 <c c'>) |
			<a a'>_\portato\p r r2
		}
	>>
}
