#(set-default-paper-size "a3" 'landscape)

global = {
	\key c \minor
}
music = {
	\time 3/8
	\new PianoStaff <<
		\new Staff = "up" \relative a' {
			\clef treble \global
			\tempo \markup \normal-text "Andante mesto"

			R4.*3 | r8 c( d |
			es f g | as bes c) |
			g4( es8 | f d f |
			g4)( c,8 | d \acciaccatura f es8. d16 |
			d4.) | r8_\markup { \italic "più " \dynamic p } c( d |
			es f g | as bes c |
			g4)( es8 | f d f |
			es4)( c8 | d \acciaccatura f es d |
			c4.)
		}
		\new Dynamics {
			s\p
		}
		\new Staff = "down" \relative a, {
			\clef bass   \global

			c8 <c' es g>4 | f,,8 <as' c d f>4 |
			c,8 <c' es g>4 | f,,8 <as' c d f>4 |
			c,8 <c' es g>4 | f,,8 <as' c d f>4 |
			c,8 <c' es g>4 | f,,8 <as' c f>4 |
			c,,8 <c'' es g>4 | d,,8 <as'' c f>4 |
			g,8 <g' c f>4 | g,8 <g' b f'>4 |
			c,8 <g' c es>4 | bes,8 <bes' d as'>4 |
			es,8 <bes' es g>4 | as,8 <as' c f>4 |
			g,8 <g' c es>4 | g,8\noBeam <g' ~ c fis> <g b f'> |
			c,8 <c' es g>4 |
		}
	>>
}
