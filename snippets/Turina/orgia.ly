#(set-default-paper-size "a3" 'landscape)

byetuplets = { \override Staff.TupletNumber #'stencil = ##f }
hituplets = { \override Staff.TupletNumber #'stencil = #ly:tuplet-number::print }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \override Staff.TupletBracket #'bracket-visibility = #ly:tuplet-number::print }

global = {
	\key a \minor
}

\layout {
	\context {
		\Score
		\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
	}
}

music = {
	\time 2/4
	\set Score.tempoWholesPerMinute = #(ly:make-moment 120 4)
	\new PianoStaff <<
		\new Staff = "up" \relative c'''  {
			\clef treble \global

			% \ottava #1
			<a cis e a>8 \noBeam
			% \ottava #0
			e,16 f g4 ~ |
			g8 e16 f g4 ~ |
			g8 e16 f g a c bes |
			\acciaccatura { a bes } a g e f g a c bes |
			a8 d16 c bes c a bes |
			\acciaccatura { a bes } a g c bes a bes g a |
			\acciaccatura { g a } g f d e f g a bes |
			c d c bes a bes g a |
			f^\markup "Rit." g e f d e <c e> <bes d e> |
			<a cis e>8. r16 <a'' cis e a>4-> |
		}
		\new Dynamics {
			s2-\markup { \dynamic fff \italic "con sentimento salvatico" } |
			s2*7 s2\fff
		}
		\new Staff = "down" \relative c'  {
			\clef treble \global

			<a cis e g>8 r r4 | R2*7 |
			r4 r8 \clef bass <e,, e'>8 |
			<a a'>8. r16
			% \clef treble
			<a'' cis e a>4-> |
		}
	>>
}
