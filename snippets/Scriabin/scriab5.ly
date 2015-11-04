#(set-default-paper-size "a3" 'landscape)

global = {
	\key fis \major
}
byetuplets = { \override TupletNumber #'stencil = ##f }
hituplets = { \revert TupletNumber #'stencil }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \revert Staff.TupletBracket #'bracket-visibility }

music = {
	\time 2/4
	% \tempo "Allegro. Impetuoso. Con stravaganza"
	\new PianoStaff <<
		\new Staff \relative a, {
			\clef bass \global
			\tuplet 5/4 { r32 e(\< a b cis } dis8-^)\!
			\tuplet 5/4 { r32 a(\<^\markup "accel." cis e fis } gis8-^)\!
			\byetuplets \byebrackets
			% \newSpacingSection
			\tuplet 5/4 { r32 e(\< a b cis } dis8-^)\! \clef treble
			\tuplet 5/4 { r32 a(\< cis e fis } gis8^^)\!
			\tempo \markup { \normal-text "Presto" }
			r \acciaccatura { e32 a b cis } dis8-^
			r \acciaccatura { a32 cis e fis } gis8-^
			r \acciaccatura { e32 a b cis^\markup "accel." } dis8-^
			\ottava #1 \set Staff.ottavation = "8"
			r \acciaccatura { a32 cis e fis } gis8-^
			r \acciaccatura { e32 a b cis } dis8-^
			r \acciaccatura { a32 cis e fis } gis8-^
			R2\fermataMarkup \time 5/8
		}
		\new Staff \relative a,, {
			\ottava #-1 \set Staff.ottavation = "8"
			\clef bass   \global
			\override Staff.OttavaBracket.extra-offset = #'(-4.0 . 0.0)
			\override Staff.OttavaBracket.shorten-pair = #'(0.0 . -4.4)
			\override Staff.UnaCordaPedal.self-alignment-X = #LEFT
			\once \override Score.UnaCordaPedal.stencil = ##f
			dis,16(\sustainOn \unaCorda a' dis, a' \tuplet 3/2 { e'8 a, e' }
			\ottava #0
			dis16\treCorde a' dis, a' e'8) r
			\override DynamicTextSpanner.dash-period = #-1
			\acciaccatura dis a' r \acciaccatura a e' r^\cresc \clef treble
			\acciaccatura dis a' r \acciaccatura a e' r
			\override Score.SustainPedal.X-offset = #1
			\acciaccatura dis a' r \acciaccatura a e'\ff r\sustainOff
			R2\fermataMarkup

		}
	>>
}
