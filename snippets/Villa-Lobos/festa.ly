#(set-default-paper-size "a3" 'landscape)

global = {
	\key c \minor
}

fixStem = {
  %\once \override Stem.length = #12
  \once \override Accidental.extra-offset = #'(1.75 . 0)
}
fixRight = {
  \once \override NoteHead.X-offset = #1.8
  \once \override Stem.rotation = #'(55 0 -1)
  \once \override Stem.length = #4.4
  \once \override Stem.extra-offset = #'(1.8 . 0)
  \once \override Flag.style = #'no-flag
  \once \override Accidental.extra-offset = #'(3.5 . 0)
}
fixLeft = {
  \once \override NoteHead.X-offset = #-1.9
  \once \override Stem.length = #4.4
  \once \override Stem.rotation = #'(-55 0 -1)
  \once \override Stem.extra-offset = #'(-1.9 . 0)
  \once \override Flag.style = #'no-flag
  \once \override Accidental.extra-offset = #'(0.75 . 0)
}


byetuplets = { \override TupletNumber #'stencil = ##f }
hituplets = { \revert TupletNumber #'stencil }
byebrackets = { \override TupletBracket #'bracket-visibility = ##f }
music = {
	\time 5/4
	\set Score.tempoWholesPerMinute = #(ly:make-moment 100 4)
	\new PianoStaff <<
		% \set PianoStaff.instrumentName = #"Piano  "
		\new Staff \relative a''  {
			\clef treble \global
			\override Score.MetronomeMark.outside-staff-priority = ##f
			\override Score.MetronomeMark.Y-offset = 7.5
			\tempo \markup { \normal-text "Meno" }
			\once \override Staff.OttavaBracket.bracket-flare = #'(3 . 0.5)
			\once \override Staff.OttavaBracket.outside-staff-priority = ##f
			\once \override Staff.OttavaBracket.Y-offset = 6
			\ottava #1 \set Staff.ottavation = "8"
			\tuplet 4/4 { bes'16 c, es as }
			\tuplet 5/4 4 { g g, c f es
				bes f d' c es,
				g c \ottava #0 bes c, es
				as g g, c f
			} |
			\tuplet 4/4 { es f, d' as }
			es' b as' g
			f b bes g
			es' d b as'
			\ottava #1 \set Staff.ottavation = "8"
			g f d' cis |
			\acciaccatura g' f bes,! d g
			f g, bes es
			d d, g c
			bes f c a'
			g bes, d g
		}
		\new Staff \relative c'   {
			\clef treble   \global
			r8^\mf <g c es g>4^> <as c es as>^> <g c es g>8^> <bes c es bes'>^> <as c es as>4^> <g c es g>8^> |
			r8 <g b es g>4^> <as b es as>^> <g b es g>8^> 
				<< { \fixStem <es' bes'!>^> } \\ { \voiceOne \fixLeft bes! } \\ { \voiceOne \fixRight b! } >>
				<as b es as>4^> <g b es g>8^> |
			r8 <g bes! d g>4^> <as bes d as'>^> <g bes d g>8^> <bes d bes'>^> <as bes d as'>4^> <g bes d g>8^> |
			%\clef bass
			%r8 <f as c f>4^> <g as c g'>^> <f as c f>8^> <as c as'>^> <g as c g'>4^> <f as c f>8^> |

		}
		\new Staff \relative c,   {
			\clef bass   \global
			<c c'>1^\mf ~ q4 |
			<b b'>1 ~ q4 |
			<bes bes'>1 ~ q4 |
			%<as as'>1 ~ q4 |
			%<g g'>1 ~ q4 |
			%<fis fis'>1 ~ q4 |
		}
	>>
}
