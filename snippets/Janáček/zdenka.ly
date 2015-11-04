global = {
	\key bes \major
	\set Staff.baseMoment = #(ly:make-moment 1 2)
	\set Timing.beamExceptions = #'(
		(end .
			(
				((1 . 8) . (4 4))  
				((1 . 16) . (4 4))
			)))
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
	\time 2/4
	\new PianoStaff <<
		\new Staff = "up" \relative a' {
			\clef treble \global
			\tempo \markup \normal-text "Andante"
			\mergeDifferentlyDottedOn

			<< {
				d8( g f es | d4. c8) | bes4\( a | bes16(^\< c\! d^\> c)\! bes8\) r |
				d,8(\< g\! f\> es)\! | d(^\< bes'\> a\! g) |
				\set Staff.baseMoment = #(ly:make-moment 1 4)
				d( g ~ g16 fis e fis | g a bes a g8)
			} \\ {
				d=''8\paren\p[ bes\< a bes16\! c] | d8 bes\> a4\! | bes8 d,4 c8 | bes4 d8 s |
				s2 | d4 es | d c\< | bes4.\!
			} >> r8 \bar ":|."

		}
		\new Staff = "down" \relative a {
			\clef bass   \global

			r4^\markup { \halign #-0.6
				\override #'(baseline-skip . 1.5) \italic \concat \vcenter
				{ "(" \column { \fontsize #-2 { " legato" "sempre " } } ")" }
			}
			f'8(\< g16 a)\! | bes8(\> g f es)\! |
			<< {
				d\noBeam g,( f^\< es)\! | d f bes16( c d c | bes4) c8 a |
				<\parenthesize d4 > c | bes a | g4.
			} \\ {
				r4 r8 f=, | bes4 bes'8 r | bes4 a8 f | bes4 c, | d d, | g g'8
			} >> r8
		}
	>>
}
