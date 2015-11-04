#(set-default-paper-size "a3" 'landscape)

byetuplets = { \override Staff.TupletNumber #'stencil = ##f }
hituplets = { \override Staff.TupletNumber #'stencil = #ly:tuplet-number::print }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \override Staff.TupletBracket #'bracket-visibility = #ly:tuplet-number::print }

ffe = \tweak DynamicText.self-alignment-X #LEFT
	#(make-dynamic-script
		(markup #:dynamic "ff" #:normal-text #:italic "e con anima"))
sempreff = \tweak DynamicText.self-alignment-X #0.6
	#(make-dynamic-script
		(markup #:normal-text #:italic "sempre" #:dynamic "ff"))

global = {
	\key a \minor
}

\layout {
	\context {
		\Score
		\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/6)
		
	}
}

music = {
	\time 3/8
	\set Score.tempoWholesPerMinute = #(ly:make-moment 90 4)
	\new PianoStaff <<
		\new Staff = "up" \relative c'  {
			\tempo \markup \normal-text "Pesante, ma con fuoco"
			\clef treble \global
			\partial 4

			e8-> f-> |
			g8.-> f16-> e8-> | d-> e16-> f-> e-> f-> |
			g8.-> f16-> e8->^- ~ | e16 d-> e-> f-> e-> f-> |
			d8.-> e16-> d8->^- ~ | d16 e-> d8-> bes16->( c32 bes |
			a4.->) | s8 <e' e'>-> <f a f'>-> |
			<< {
				<g g'>8.->( f'16 e8 ~ |
				e16 d e f e f) |
				g8.-> f16 e8-> |
				d e16 f e f |
				d8. e16 d8 ~ |
				d16 e d8-> bes16-> c32 bes |
				a4.->
			} \\ {
				r8 c-- r |
				<a a'>-- r <bes bes'>-- |
				r <g cis>-- r |
				<a a'>-- r <bes bes'>-- |
				r <a a'>-- r |
				<bes bes'> r <g g'> |
				r <e e'> r
			} >>
		}
		\new Dynamics {
			\override DynamicTextSpanner.dash-period = #-1
			s4\ffe |
			s4. s s s s s s
			s8 s4\sempreff
			s4. s s s s s
			s8\dim s\!
		}
		\new Staff = "down" \relative c,   {
			\clef bass \global

			a8-> <d a'>-- |
			a-> <d e bes'>-- a-> | <d e bes'>-- a-> <d e bes'>-- |
			a-> <d e bes'>-- a-> | <d e bes'>-- a-> <d e bes'>-- |
			a-> <d e bes'>-- a-> | <d e bes'>-- a-> <d g>-- |
			<< {
				r8 e'--[ r | e--] s
			} \\ {
				a,,-> <e' a>-- a,-> | <e' a>--[ a,->]
			} >>
			<f'' a d>-- | \autoBeamOff
			a,-- <g' c e>-- a,-- | <f' a e'>-- a,-- <f' bes d>-- |
			a,-- <e' g cis>-- a,-- | <f' a d>-- a,-- <g' bes d>-- |
			a,-- <f' a d>-- a,-- | <g' bes d>-- a,-- <e' g d'> |
			a,-- <e' a>-- a,-- | %<e' a>-- \autoBeamOn a,-. a,-. |
		}
		% \new Dynamics {
		% 	\set pedalSustainStyle = #'mixed
		% 	s4\sustainOn \repeat unfold 8 { s4.\sustainOff\sustainOn }
		% 	\repeat unfold 2 { s4.\sustainOff\sustainOn s4\sustainOff\sustainOn s8\sustainOff\sustainOn }
		% 	\repeat unfold 3 { s4.\sustainOff\sustainOn }
		% 	s4.\sustainOff
		% }
	>>
}
