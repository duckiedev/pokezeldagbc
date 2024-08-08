MACRO pcmwav_def
\1_id::
	dba \1
ENDM

MACRO ldpcmwav
	ld \1, (\2_id - PCMWavPointerTable) / 3
ENDM
