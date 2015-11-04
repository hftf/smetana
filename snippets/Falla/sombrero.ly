#(set-default-paper-size "a3" 'landscape)

byetuplets = { \override Staff.TupletNumber #'stencil = ##f }
hituplets = { \override Staff.TupletNumber #'stencil = #ly:tuplet-number::print }
byebrackets = { \override Staff.TupletBracket #'bracket-visibility = ##f }
hibrackets = { \override Staff.TupletBracket #'bracket-visibility = #ly:tuplet-number::print }

ppsubito = \tweak DynamicText.self-alignment-X #LEFT
	#(make-dynamic-script
		(markup #:dynamic "pp" #:normal-text #:italic "subito"))

global = {
	\key c \major
}

\layout {
	\context {
		\Score
		\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/7)
		
	}
}

music = {
	\time 6/8
	\new PianoStaff <<
		\new Staff = "up" \relative c''  {
			\clef treble
			\override Score.MetronomeMark.outside-staff-priority = ##f
			\override Score.MetronomeMark.Y-offset = 7

			\tempo \markup { \normal-text "Poco più mosso." } 4. = 72
			\global
			
			\repeat unfold 2 { <e c'>8-_ a-. b16( g) <e c'>8-_ a-. b16( g) | }
			\repeat unfold 2 { <f c'>8-_ a-. b16( g) <f c'>8-_ a-. b16( g) | }
			\repeat unfold 2 { <e c'>16( a) <e b'>8-_ g-. <e c'>16( a) <e b'>8-_ g-. | }
			\repeat unfold 2 { <f c'>16( a) <f b>8-_ g-. <f c'>16( a) <f b>8-_ g-. | }
			<e c'>16-> a b g <e c'>[ a b g] <e c'>-> a b g |
			% <e c'>-> a b g c a <e b'>-> g c a b g |
			% <f c'>16-> a b g <f c'>[ a b g] <f c'>-> a b g |
			% <f c'>-> a b g c a <f b>-> g c a b g |
		}
		\new Dynamics {
			\override DynamicTextSpanner.dash-period = #-1
			s2.\ppsubito s s s
			s\cresc s s s
			s\f
		}
		\new Staff = "down" \relative c,   {
			\clef bass \global

			\repeat unfold 2 { <c g'>8-. r r <g g'>-. r r | }
			\repeat unfold 2 { <d' g>-. r r <g, g'>-. r r | }
			\repeat unfold 2 { <c g'>-. <g g'>-. r <c g'>-. <g g'>-. r | }
			\repeat unfold 2 { <d' g>-. <g, g'>-. r <d' g>-. <g, g'>-. r | }
			<c g'>-> g c g <c g'>-> g | %<c g'>^> g c <g g'>^> c g |
			% <d' g>^> g, d' g, <d' g>^> g, | <d' g>^> g, d' <g, g'>^> d' g, |
		}
	>>
}
