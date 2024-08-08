MACRO pcm
; All of the pcm data has one trailing byte that is never processed.
	dw .End - .Start - 1
.Start
	\1
.End
ENDM

SECTION "Pokemon Cries 1", ROMX

HonedgeHCry::
    pcm INCBIN "audio/sfx_pcm/honedgeh_cry.pcm"
