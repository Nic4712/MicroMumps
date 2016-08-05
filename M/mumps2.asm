; ===========================================================================
; UC Davis MocroMumps for CP/M - version 4.06
; Rebuilt by Marcelo F. Dantas in February of 2014
; marcelo.f.dantas@gmail.com
; ===========================================================================
;
			org 100h
			jp	Init
; ---------------------------------------------------------------------------
BOOT:		equ 0000h
BDOS:		equ 0005h
Page0BUF:	equ 0080H
;
FALSE:		equ 0
TRUE:		equ 1
;
STRNG:		equ 1
;
INTLN:		equ 5
PTRLN:		equ 2
;
Prompt:		equ '>'
Space:		equ ' '
Quotes:		equ '"'
Exclamation:	equ '!'
Plus:		equ '+'
Minus:		equ '-'
Asterisk:	equ '*'
Dollar:		equ '$'
Point:		equ '.'
Comma:		equ ','
Slash:		equ '/'
Backslash:	equ '\'
Carat:		equ '^'
LeftP:		equ '('
RightP:		equ ')'
Percent:	equ '%'
Question:	equ '?'
Semicolon:	equ ';'
Colon:		equ ':'
Pound:		equ '#'
LeftB:		equ '['
;
tknTAB:		equ 25h
tknCRLF:	equ 26h
; ---------------------------------------------------------------------------
		dw byte_A581
		dw InPort6		; Check	reader device availability
GlobalsDR:	db 0
RoutinesDR:	db 0
ClrScrSize:	db 6
ClrScr:		db 1Bh, 5Bh, 'H', 1Bh, 5Bh, 'J', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0
		dw 0AAC1h
PartSize:	dw 2000h
ErrorsDR:	db 0
ErrorsFCB:	db 0
		db 'ERRORS  DAT'
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0
GlobalsFCB:	db 0
		db 'GLOBALS DAT'
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0
AutoexecFlag:	db 0
CmdLineSz:	db 0
CmdLine:	db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
Ptr:		dw 0
Ptr1:		dw 0
Ptr2:		dw 0
Ptr3:		dw 0
word_0274:	dw 0
word_0276:	dw 0
word_0278:	dw 0
word_027A:	dw 0
word_027C:	dw 0
word_027E:	dw 0
		db 0
		db 0
		db 0
		db 0
PtrX:		dw 0
PtrX1:		dw 0
PtrX2:		dw 0
		db 0,0,0,0,0,0,0,0
word_0292:	dw 0
		db 0
		db 0
		db 0
		db 0
pName:		dw 0
word_029A:	dw 0
pIndex:		dw 0
		db 0
		db 0
		db 0
		db 0
SetBs:		dw 0
word_02A4:	dw 0
		db 0
		db 0
VarPtr:		dw 0			; Points to a var in the symbol	table
		db 0,0,0,0,0,0
word_02B0:	dw 0
word_02B2:	dw 0
		db 0
		db 0
		db 0
		db 0
word_02B8:	dw 0
		db 0,0,0,0,0,0
word_02C0:	dw 0
		db 0,0,0,0,0,0
word_02C8:	dw 0
		dw 0
word_02CC:	dw 0
		dw 0
word_02D0:	dw 0
pFCBAddr:	dw 0
word_02D4:	dw 0
word_02D6:	dw 0
pDevice:	dw 0
pDevX:		dw 0
pDevY:		dw 0
word_02DE:	dw 0
word_02E0:	dw 0
word_02E2:	dw 0
word_02E4:	dw 0
pFRWBuffer:	dw 0
pGLBBuffer1:	dw 0
		dw 0
pGLbBuffer2:	dw 0
pGLBBuffer3:	dw 0
		dw 0
word_02F2:	dw 0
word_02F4:	dw 0
		dw 0
word_02F8:	dw 0
word_02FA:	dw 0
		dw 0
word_02FE:	dw 0
		org 300h
TokenTable:	equ 3
; 1 - a-z   B -	&    15	- ,    1F - Space Nbsp
; 2 - A-Z   C -	!    16	- :    20 - `
; 3 - 0-9   D -	<    17	- "    21 - |
; 4 - '     E - >    18 - @    22 - ~
; 5 - +	    F -	[    19	- (    23 - {
; 6 - -	   10 -	]    1A	- )    24 - }
; 7 - *	   11 -	=    1B	- $    25 - Tab
; 8 - /	   12 -	_    1C	- .    26 - LF CR
; 9 - #	   13 -	%    1D	- ;    27 - FF
; A - \	   14 -	^    1E	- ?    32 - Invalid
TokenTBL:	db 32h,	32h, 32h, 32h, 32h, 32h, 32h, 32h
		db 32h,	25h, 26h, 32h, 27h, 26h, 32h, 32h
		db 32h,	32h, 32h, 32h, 32h, 32h, 32h, 32h
		db 32h,	32h, 32h, 32h, 32h, 32h, 32h, 32h
		db 1Fh,	0Ch, 17h, 9, 1Bh, 13h, 0Bh, 4
		db 19h,	1Ah, 7,	5, 15h,	6, 1Ch,	8
		db 3, 3, 3, 3, 3, 3, 3,	3
		db 3, 3, 16h, 1Dh, 0Dh,	11h, 0Eh, 1Eh
		db 18h,	2, 2, 2, 2, 2, 2, 2
		db 2, 2, 2, 2, 2, 2, 2,	2
		db 2, 2, 2, 2, 2, 2, 2,	2
		db 2, 2, 2, 0Fh, 0Ah, 10h, 14h,	12h
		db 20h,	1, 1, 1, 1, 1, 1, 1
		db 1, 1, 1, 1, 1, 1, 1,	1
		db 1, 1, 1, 1, 1, 1, 1,	1
		db 1, 1, 1, 23h, 21h, 24h, 22h,	32h
		db 32h,	32h, 32h, 32h, 32h, 32h, 32h, 32h
		db 32h,	32h, 32h, 32h, 32h, 32h, 32h, 32h
		db 32h,	32h, 32h, 32h, 32h, 32h, 32h, 32h
		db 32h,	32h, 32h, 32h, 32h, 32h, 32h, 32h
		db 1Fh,	2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 29h, 2Bh
		db 2Bh,	2Bh, 2Bh, 2Bh, 2Bh, 2Bh, 2Bh, 2Bh
		db 2Ch,	29h, 29h, 29h, 29h, 29h, 29h, 29h
		db 29h,	29h, 29h, 29h, 29h, 29h, 29h, 29h
		db 29h,	29h, 29h, 29h, 29h, 29h, 29h, 29h
		db 29h,	29h, 29h, 29h, 29h, 29h, 29h, 29h
		db 29h,	29h, 29h, 29h, 29h, 29h, 29h, 29h
		db 29h,	29h, 29h, 29h, 29h, 29h, 2Ch, 2Ch
		db 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0
		org 400h
MulTable:	equ 4
MulTBL:		db 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 1, 2, 3, 4, 5, 6,	7
		db 8, 9, 0, 0, 0, 0, 0,	0
		db 0, 2, 4, 6, 8, 10h, 12h, 14h
		db 16h,	18h, 0,	0, 0, 0, 0, 0
		db 0, 3, 6, 9, 12h, 15h, 18h, 21h
		db 24h,	27h, 0,	0, 0, 0, 0, 0
		db 0, 4, 8, 12h, 16h, 20h, 24h,	28h
		db 32h,	36h, 0,	0, 0, 0, 0, 0
		db 0, 5, 10h, 15h, 20h,	25h, 30h, 35h
		db 40h,	45h, 0,	0, 0, 0, 0, 0
		db 0, 6, 12h, 18h, 24h,	30h, 36h, 42h
		db 48h,	54h, 0,	0, 0, 0, 0, 0
		db 0, 7, 14h, 21h, 28h,	35h, 42h, 49h
		db 56h,	63h, 0,	0, 0, 0, 0, 0
		db 0, 8, 16h, 24h, 32h,	40h, 48h, 56h
		db 64h,	72h, 0,	0, 0, 0, 0, 0
		db 0, 9, 18h, 27h, 36h,	45h, 54h, 63h
		db 72h,	81h
TimeoutFL:	db 0
bIsGlbOpen:	db 0
		db 0
		db 0
		db 0
STCnt:		db 0
NameLen:	db 0
StrLen:		db 0
tmpChar:	db 0
		db 0
Count:		db 0
WarmBoot:	db 0
SetFL:		db 0
SetSW:		db 0
DT:		db 0
ForFL:		db 0
DollarJ:	db 0
bFlagNext:	db 0
bFlagOrder:	db 0
DN:		db 0
GotoFL:		db 0
		db 0
KillFL:		db 0
		db 0
		db 0
byte_04B3:	db 0
INF:		db 0
ViewParam:	db 0
PF:		db 0
		db 0
byte_04B8:	db 0
GLB:		db 0
IOTemp1:	db 0
IOTemp2:	db 0
I1:		db 0
I2:		db 0
I3:		db 0
I4:		db 0
I5:		db 0
I6:		db 0
		db 0
byte_04C3:	db 0
II:		db 0
IT:		db 0
ITX:		db 0
N:		db 0
		db 0
		db 0
		db 0
byte_04CB:	db 0
byte_04CC:	db 0
		db 0
byte_04CE:	db 0
		db 0
byte_04D0:	db 0
NR:		db 0
bmFlag1:	db 0			; b2:Routine not saved
byte_04D3:	db 0
		db 0,0,0,0,0
Drive:		db 0
byte_04DA:	db 0
DeviceInUse:	db 0
		db 0
FCBType:	db 0			; 0:Global, 1:Routine, 2:File
		db 0
byte_04DF:	db 0
		db 0,0,0,0,0,0
IXT:		db 0
byte_04E7:	db 0
byte_04E8:	db 0
byte_04E9:	db 0
byte_04EA:	db 0
byte_04EB:	db 0
byte_04EC:	db 0
byte_04ED:	db 0
byte_04EE:	db 0
byte_04EF:	db 0
Signal1:	db 0
byte_04F1:	db 0
		db 0
byte_04F3:	db 0
PrintTgl:	db 0
StopTgl:	db 0
NumOfParams:	db 0
Delete:		db 0
byte_04F8:	db 0
byte_04F9:	db 0
		db 0
		db 0
		db 0
byte_04FD:	db 0
		db 0
byte_04FF:	db 0
Vptr:		dw 0
word_0502:	dw 0
word_0504:	dw 0
		db 0
		db 0
		db 0
		db 0
word_050A:	dw 0
word_050C:	dw 0
word_050E:	dw 0
word_0510:	dw 0
byte_0512:	db 0
word_0513:	dw 0
byte_0515:	db 0, 0, 0
byte_0518:	db 0, 0, 0
byte_051B:	db 0, 0, 0
		db 0, 0, 0
byte_0521:	db 0, 0, 0
byte_0524:	db 0, 0, 0
		db 0, 0, 0
byte_052A:	db 0, 0, 0
byte_052D:	db 0, 0, 0
byte_0530:	db 0, 0, 0
byte_0533:	db 0, 0, 0
		db 0, 0, 0
		db 0, 0, 0
		db 0, 0, 0
byte_053F:	db 0, 0, 0
glbptrUnk:	db 0, 0, 0
byte_0545:	db 0
byte_0546:	db 0
byte_0547:	db 0
byte_0548:	db 0
byte_0549:	db 0
byte_054A:	db 0
; =============== S U B	R O U T	I N E =======================================
; Startup initializations
Start:
		ld	hl, RandomSeed	; Initializes random seed
		ld	(pSynStack), hl
		ld	de, 1000
		add	hl, de		; HL <-	RandomSeed+1000
		ld	(Ptr), hl
		ld	(pPlus1000), hl
		ld	(hl), 43
		inc	hl
		ld	(Ptr), hl
		ld	de, 13
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	(word_A632), hl	; AA91
		ex	de, hl
		ld	hl, (Ptr)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	hl, (word_A632)
		ex	de, hl
		ld	hl, (Ptr)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(hl), 71
		inc	hl
		ld	(Ptr), hl
		ld	(pIndex), hl
		ld	(word_A634), hl
		ld	de, Nil
		call	sub_980E	; AA96 <- Nil
		ld	hl, (Ptr)
		ld	de, 3
		add	hl, de
		ld	(hl), 0
		inc	hl
		ld	(Ptr), hl
		ld	hl, (pIndex)
		ex	de, hl
		ld	hl, (Ptr)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	hl, (pIndex)
		ex	de, hl
		ld	hl, (Ptr)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(hl), 43
		inc	hl
		ld	(Ptr), hl
		ld	hl, (PartSize)	; HL <-	Partition Size
		ld	de, 23
		add	hl, de
		ld	(pIndex), hl
		ex	de, hl
		ld	hl, (Ptr)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	(word_A626), hl
		ld	(word_9F96), hl
		ld	(pRtnName), hl
		ld	(hl), 0
		ld	de, 11
		add	hl, de
		ld	(Ptr), hl
		ld	hl, (word_A626)
		ex	de, hl
		ld	hl, (Ptr)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	hl, (word_A626)
		ex	de, hl
		ld	hl, (Ptr)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	(word_9F98), hl
		ld	(word_9F9A), hl
		ld	(pStartOfRtn), hl
		ld	(pCurRtnLine), hl
		ld	(pEndOfRtn), hl
		ld	(hl), 26
		ld	de, (PartSize)
		add	hl, de
		ld	(Ptr), hl
		ld	(pSymbolTbl), hl
		ld	de, 0
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	(pEnd),	hl
		ld	de, 5
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(hl), 0
		inc	hl
		ld	(hl), 1
		inc	hl
		ld	(hl), 255
		inc	hl
		ld	(hl), 43
		inc	hl
		ld	(Ptr), hl
		ld	(word_A628), hl
		ld	(word_A62A), hl
		ld	(hl), 45
		inc	hl
		ld	(Ptr), hl
		ld	de, 0
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	(pIndex), hl
		ld	de, 4
		add	hl, de
		ld	(Ptr), hl
		ld	de, 0
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(hl), 45
		inc	hl
		ld	(hl), 43
		inc	hl
		ld	(Ptr), hl
		ex	de, hl
		ld	hl, (pIndex)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (pIndex)
		ld	de, 2
		add	hl, de
		ld	(pIndex), hl
		ld	hl, (Ptr)
		ex	de, hl
		ld	hl, (pIndex)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	(pIndex), hl
		ld	(hl), 45
		inc	hl
		ld	(Ptr), hl
		ld	hl, (BDOS+1)	; Gets BDOS address
		ld	(bBDOSaddr), hl
		or	a
		sbc	hl, de
		jp	c, GameOver	; Terminate execution
		ld	hl, (bBDOSaddr)
		dec	hl
		ld	(hl), 43
		ld	de, (pIndex)
		or	a
		sbc	hl, de
		ld	(bBDOSaddr), hl
		ex	de, hl
		ld	hl, (Ptr)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	hl, (word_A628)
		ex	de, hl
		ld	hl, (Ptr)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	hl, (word_A628)
		ex	de, hl
		ld	hl, (Ptr)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (bBDOSaddr)
		ld	de, 0F9DEh	; 63966
		add	hl, de
		jp	nc, GameOver	; Terminate execution
		ld	hl, (pPlus1000)
		ld	sp, hl
		ld	ix, (pSynStack)
		call	SSChk		; Check	for room on the	syntax stack
		xor	a
		ld	(DeviceInUse), a
		call	sub_574A
		call	BGetChar	; GetChar (BIOS	call)
		ld	a, (Result)
		cp	0
		jp	z, Greet
		ld	a, (tmpChar)
		cp	3
		jp	nz, Greet
		xor	a
		ld	(AutoexecFlag),	a
Greet:
		ld	a, (AutoexecFlag)
		cp	1
		jp	z, NoGreet
		ld	hl, sGreet
		call	putStr		; Output 0x00 terminated string	pointed	by HL
		call	putCrLf		; Outputs a CrLf
NoGreet:
		ld	hl, 0
		ld	(pStkPos), hl
		ld	hl, 0
		ld	(word_A624), hl
		ld	hl, 0
		ld	(SymEnd), hl
		xor	a
		ld	(bmFlag1), a	; b2:Routine not saved
		ld	(bIsGlbOpen), a
		ld	(byte_04D3), a
		ld	(WarmBoot), a
		ld	(byte_A69D), a
; End of function Start
; =============== S U B	R O U T	I N E =======================================
; Prepare initial execution
Main:
		xor	a
		ld	(Result), a
		ld	(Case),	a
		ld	(bmActFlag), a
		ld	(Token), a
		ld	(SetFL), a
		ld	(IndFL), a
		ld	(IndSW), a
		ld	(DoSW),	a
		ld	(ForSW), a
		ld	(bmFlag), a
		ld	(byte_0548), a
		ld	a, 1
		ld	(Mode),	a
		xor	a
		ld	(IODevice), a
		ld	a, 2
		ld	(IfSW),	a
		xor	a
		ld	(DollarJ), a
		ld	(DN), a
		ld	(PF), a
		ld	(GLB), a
		ld	(byte_A69C), a
		ld	(byte_0549), a
		ld	(byte_A6A4), a
		ld	(byte_A69F), a
		ld	a, 255
		ld	(byte_0545), a
		ld	a, 0
		ld	(SetSW), a
		ld	(GotoFL), a
		ld	(byte_A610), a
		ld	(byte_A6A1), a
		ld	hl, 0
		ld	(word_A049), hl
MainLoop:				; Get line to execute
		call	Input
		ld	a, (byte_A69C)
		or	a
		jp	z, MainLoop1
		ld	a, 1
		ld	(byte_A69C), a
MainLoop1:
		xor	a
		ld	(byte_04FF), a
		ld	hl, AutoexecFlag
		ld	a, (hl)
		or	00000010b
		ld	(hl), a
		ld	a, (bmFlag)
		cp	00000100b
		jp	nz, MainLoop4
		ld	a, 00000011b
		ld	(bmFlag), a
		ld	a, (IndSW)
		or	a
		jp	z, MainLoop2
		call	sub_69DD
		ret
MainLoop2:
		ld	a, (DoSW)
		or	a
		jp	z, MainLoop3
		call	sub_6612
		ret
MainLoop3:
		ld	a, 1
		ld	(Mode),	a
		jp	MainLoop
MainLoop4:
		ld	hl, bmActFlag
		ld	a, 11111101b
		and	(hl)
		ld	(hl), a
		xor	a
		ld	(ForSW), a
		ld	hl, bmActFlag
		ld	a, 11111110b
		and	(hl)
		ld	(hl), a
		xor	a
		ld	(IndFL), a
MainLoop5:				; Execute command
		ld	a, (Token)
		cp	tknCRLF		; Is it	CR or LF?
		jp	z, MainLoop9
MainLoop6:
		ld	a, (Token)
		cp	1Dh		; Is it	';'?
		jp	z, MainLoop9
		ld	a, (byte_A69C)
		and	00000100b
		jp	z, MainLoop7
		ld	a, 1
		ld	(byte_A69C), a
MainLoop7:
		ld	hl, bmActFlag
		ld	a, 11111110b
		and	(hl)
		ld	(hl), a
		xor	a
		ld	(byte_04CB), a
		ld	(bmFlag), a
		ld	(word_A652), ix
		call	sub_8506
		call	BGetChar2	; GetChar if A!=0x00 (BIOS call)
		ld	a, (byte_A69C)
		and	00000001b
		jp	z, MainLoop8
		call	sub_55D2
MainLoop8:
		ld	a, (bmActFlag)
		and	00000010b
		jp	nz, MainLoop9
		ld	a, (bmFlag)
		cp	1
		jp	z, MainLoop6
MainLoop9:				; GetChar if A!=0x00 (BIOS call)
		call	BGetChar2
		xor	a		; Reset	LinAct and ComAct
		ld	(bmActFlag), a
		ld	a, (ForSW)
		or	a
		jp	z, MainLoop
		ret
; End of function Main
; =============== S U B	R O U T	I N E =======================================
; Get line to execute
Input:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (GotoFL)
		cp	1
		jp	z, Input1
		ld	a, (IndSW)
		or	a
		jp	nz, Input17
		ld	a, (AutoexecFlag)
		cp	1
		jp	z, Input5
		ld	a, (byte_04FF)
		or	a
		jp	nz, Input15
Input1:
		ld	a, (Mode)
		or	a
		jp	z, Input6
		ld	a, (AutoexecFlag)
		cp	3
		jp	z, loc_3982
Input2:
		ld	a, (IODevice)
		or	a
		jp	z, Input3
		xor	a
		ld	(DeviceInUse), a
		call	sub_574A
		ld	a, (DeviceInUse)
		ld	(IODevice), a
Input3:					; Outputs a CrLf
		call	putCrLf
		ld	a, Prompt	; Prints out the command prompt
		call	putChar		; Outputs the character	on A to	the console
		ld	a, (WarmBoot)
		cp	1
		jp	z, Input4
		call	RandomSeed	; Initializes random seed
		ld	a, 1
		ld	(WarmBoot), a
Input4:
		call	sub_9998
		call	putCrLf		; Outputs a CrLf
		ld	a, (CmdLineSz)
		or	a
		jp	z, Input2
		ld	hl, 0
		ld	(word_A636), hl
Input5:
		ld	hl, CmdLine
		ld	(word_02B0), hl
		dec	hl
		ld	(pStkPos), hl
		call	sub_5A30
		ld	a, (Result)
		cp	0
		jp	z, Input13
		call	sub_5DB5
		jp	Input2
Input6:
		ld	a, (byte_A691)
		cp	1
		jp	z, Input8
Input7:
		ld	hl, (pStkStart)
		inc	hl
		ld	(pStkStart), hl
		ld	a, (hl)
		cp	0Ah
		jp	nz, Input7
		inc	hl
		ld	(pStkStart), hl
		ld	a, (hl)
		cp	1Ah
		jp	z, Input16
Input8:
		ld	a, 0
		ld	(byte_A691), a
		ld	hl, (pStkStart)
		ld	(pStkPos), hl
		ld	(pCurRtnLine), hl
		xor	a
		ld	(IT), a
Input9:
		ld	hl, (pStkPos)
		ld	a, (hl)
		cp	9
		jp	z, Input10
		ld	a, (hl)
		cp	Space
		jp	z, Input10
		ld	a, (hl)
		cp	0Dh
		jp	z, Error00	; Missing linestart character
		inc	hl
		ld	(pStkPos), hl
		ld	hl, IT
		inc	(hl)
		jp	Input9
Input10:
		ld	hl, (pStkPos)
		inc	hl
		ld	(pStkPos), hl
		ld	a, (hl)
		cp	9
		jp	z, Input10
		ld	a, (hl)
		cp	Space
		jp	z, Input10
		ld	a, (hl)
		cp	0Dh
		jp	z, Input7
		ld	a, (IT)
		or	a
		jp	z, Input12
		cp	8
		jp	c, Input11
		ld	a, 8
		ld	(IT), a
Input11:
		ld	hl, byte_A668
		ld	a, (IT)
		ld	(hl), a
		inc	hl
		ld	(Ptr), hl
		ld	de, (Ptr)
		ld	hl, (pStkStart)
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		ld	de, ibcdUnk07
		ld	hl, ibcdV0
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		jp	Input15
Input12:
		ld	hl, ibcdUnk07
		ld	c, 5
		call	IbcdHL		; Increments by	1 the C	bytes long BCD pointed by (HL)
		jp	Input15
Input13:
		ld	hl, (pDevX)
		ld	de, ibcdV0
		call	Copy5DEHL	; Copy 5 bytes from (DE) to (HL) ; SetI
		ld	hl, (pDevY)
		ld	c, 5
		call	IbcdHL		; Increments by	1 the C	bytes long BCD pointed by (HL)
		ld	c, 5
		call	IbcdHL		; Increments by	1 the C	bytes long BCD pointed by (HL)
		ld	a, (bmFlag)
		or	a
		jp	z, Input14
		cp	7
		jp	z, Input14
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(IT), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
Input14:
		ld	a, (CmdLineSz)
		cp	255
		jp	z, Error11	; String too long
		ld	hl, CmdLineSz
		inc	(hl)
		ld	(pStkStart), ix
		ld	hl, (pStkStart)
		ld	(pStkPos), hl
		ld	hl, (word_02B0)
		ld	a, (CmdLineSz)
		call	sub_97B3
		ld	(word_02B0), hl
		ld	a, (CmdLineSz)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
Input15:
		ld	hl, (pStkPos)
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ret
Input16:
		ld	hl, (pStkStart)
		ld	(pCurRtnLine), hl
Input17:
		ld	a, 4
		ld	(bmFlag), a
		ret
; End of function Input
; =============== S U B	R O U T	I N E =======================================
; Entry	point of BREAK command
ecBreak:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, ecBreak3
		cp	1
		jp	nz, ecBreak2
ecBreak1:				; String-Value expression
		call	StrExp
		ld	a, 1
		ld	(Case),	a
ecBreak2:
		ld	a, (bmActFlag)
		or	a
		call	z, bcBreak	; Body of BREAK	command
ecBreak3:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		or	a
		jp	z, ecBreak1
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecBreak
; =============== S U B	R O U T	I N E =======================================
; Entry	point of CLOSE command
ecClose:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, ecClose3
		cp	1
		jp	nz, Error14	; Illegal command terminator
ecClose1:				; Expression
		call	Expr
		ld	a, (bmActFlag)
		or	a
		call	z, DevNtoShort	; Converts device # to short
		ld	a, (Token)
		cp	16h		; Is it	':'?
		jp	nz, ecClose2
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	DevParam	; Device parameters
ecClose2:
		ld	a, (bmActFlag)
		or	a
		call	z, bcClose	; Body of CLOSE	command
ecClose3:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		or	a
		jp	z, ecClose1
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecClose
; =============== S U B	R O U T	I N E =======================================
; Entry	point of DO command
ecDo:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, ecDo2
		cp	1
		jp	nz, Error14	; Illegal command terminator
ecDo1:					; Check	for DO-able branch point
		call	Trans
		ld	a, (Case)
		or	a
		jp	z, ecDo2
		ld	a, (bmActFlag)	; Stack	DO information;	do transpt
		or	a
		call	z, bcDo		; Body of DO command
ecDo2:					; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		or	a
		jp	z, ecDo1
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecDo
; =============== S U B	R O U T	I N E =======================================
; Entry	point of ELSE command
ecElse:
		call	PostCond1
		ld	a, (Case)
		cp	2
		jp	z, ecElse1
		cp	3
		jp	nz, Error14	; Illegal command terminator
		ld	a, (bmActFlag)
		or	a
		call	z, bcElse	; Body of ELSE command
ecElse1:
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecElse
; =============== S U B	R O U T	I N E =======================================
; Entry	point of FOR command
ecFor:
		ld	a, (Token)
		cp	1Fh		; Is it	' '?
		jp	nz, Error14	; Illegal command terminator
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	LVarName	; Check	for local variable name
		ld	a, (Result)
		or	a
		jp	z, Error23	; Illegal variable name
		ld	(Vptr),	ix
		ld	a, (bmActFlag)
		or	a
		call	z, sub_494A
		ld	a, (Token)
		cp	11h		; Is it	'='?
		jp	nz, Error27	; Missing equal	sign
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
loc_0B4D:				; Expression
		call	Expr
		ld	a, (Token)
		cp	16h		; Is it	':'?
		jp	z, loc_0B69
		ld	a, (bmActFlag)
		or	a
		call	z, sub_38CF
		ld	a, (bmActFlag)
		or	a
		call	z, sub_430C
		jp	loc_0BF1
loc_0B69:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		ld	a, (bmActFlag)
		or	a
		call	z, sub_41F6
		ld	(word_02FE), ix
		call	NumExp		; Numeric-Value	expression
		ld	a, (Token)
		cp	16h		; Is it	':'?
		jp	z, loc_0BAC
		ld	a, 1
		ld	(byte_04F3), a
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4DB3
loc_0B8E:
		ld	a, (bmActFlag)
		or	a
		call	z, sub_430C
		ld	a, 4
		ld	(Case),	a
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4380
		ld	a, (Case)
		cp	4
		jp	z, loc_0BF1
		jp	loc_0B8E
loc_0BAC:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		ld	(word_02F8), ix
		call	NumExp		; Numeric-Value	expression
		ld	a, 2
		ld	(byte_04F3), a
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4DB3
		ld	a, 4
		ld	(Case),	a
		ld	a, (bmActFlag)
		or	a
		call	z, sub_463E
		ld	a, (Case)
		cp	1
		jp	nz, loc_0BF1
loc_0BD6:
		ld	a, (bmActFlag)
		or	a
		call	z, sub_430C
		ld	a, 4
		ld	(Case),	a
		ld	a, (bmActFlag)
		or	a
		call	z, sub_46E2
		ld	a, (Case)
		cp	1
		jp	z, loc_0BD6
loc_0BF1:
		ld	a, (bmActFlag)
		or	a
		call	z, sub_47DD
		ld	a, (Token)
		cp	15h		; Is it	','?
		jp	nz, loc_0C06
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		jp	loc_0B4D
loc_0C06:
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4839
		call	ComArgEnd3
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecFor
; =============== S U B	R O U T	I N E =======================================
; Entry	point of GOTO command
ecGoto:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, loc_0C39
		cp	1
		jp	nz, Error14	; Illegal command terminator
loc_0C28:				; Transfer point primitive
		call	Trans
		ld	a, (Case)
		or	a
		jp	z, loc_0C39
		ld	a, (bmActFlag)
		or	a
		call	z, sub_3E37
loc_0C39:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, loc_0C28
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecGoto
; =============== S U B	R O U T	I N E =======================================
; Entry	point of HALT command
ecHalt:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	2
		jp	z, ecHalt1
		cp	3
		jp	nz, Error14	; Illegal command terminator
ecHalt1:
		ld	a, (bmActFlag)
		or	a
		call	z, sub_3977
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecHalt
; =============== S U B	R O U T	I N E =======================================
; Entry	point of HANG command
ecHang:
		call	PostCond	; Command postconditional and delimiter
ecHang1:
		ld	a, (Case)
		cp	4
		jp	z, ecHang3
		cp	1
		jp	nz, Error14	; Illegal command terminator
ecHang2:				; Integer-Value	expression
		call	IntExp
		ld	a, (bmActFlag)
		or	a
		call	z, bcHang	; Body of HANG command
ecHang3:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, ecHang2
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecHang
; =============== S U B	R O U T	I N E =======================================
; Entry	point of IF command
ecIf:
		call	PostCond1
		ld	a, (Case)
		cp	2
		jp	z, ecIf3
		cp	4
		jp	z, ecIf2
		cp	1
		jp	z, ecIf1
		ld	a, (bmActFlag)
		or	a
		call	z, bcIf		; Body of IF command
		jp	ecIf3
ecIf1:					; Truth-Value expression
		call	TVExp
		ld	a, (bmActFlag)
		or	a
		call	z, CaseToIfSW	; Move the contents of (case) to (ifsw)
		ld	a, (Case)
		cp	1
		jp	z, ecIf2
		ld	a, (bmActFlag)
		or	a
		call	z, SetAFb1	; Sets bit 1 of	bmActFlag
ecIf2:					; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, ecIf1
ecIf3:
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecIf
; =============== S U B	R O U T	I N E =======================================
; Entry	point of KILL comand
ecKill:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, loc_0D56
		cp	1
		jp	z, loc_0CFD
		ld	a, (bmActFlag)
		or	a
		call	z, sub_39ED
		jp	loc_0D61
loc_0CFD:
		ld	a, (Token)
		cp	19h		; Is it	'('?
		jp	nz, loc_0D4C
		xor	a
		ld	(KillFL), a
loc_0D09:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		call	LVarName	; Check	for local variable name
		ld	a, (Result)
		cp	1
		jp	z, loc_0D21
		ld	a, (bmActFlag)
		or	a
		call	z, sub_3FBA
		jp	Error23		; Illegal variable name
loc_0D21:
		ld	a, (bmActFlag)
		or	a
		call	z, sub_3A04
		ld	a, (Token)
		cp	15h		; Is it	','?
		jp	z, loc_0D09
		cp	1Ah		; Is it	')'?
		jp	z, loc_0D3F
		ld	a, (bmActFlag)
		or	a
		call	z, sub_3FBA
		jp	Error12		; Unmatched parentheses
loc_0D3F:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		ld	a, (bmActFlag)
		or	a
		call	z, sub_3A88
		jp	loc_0D56
loc_0D4C:				; Global/Local variable	name
		call	GLVarName
		ld	a, (bmActFlag)
		or	a
		call	z, sub_3AEA
loc_0D56:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, loc_0CFD
loc_0D61:
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecKill
; =============== S U B	R O U T	I N E =======================================
; Entry	point of LOCK command
ecLock:
		call	PostCond	; Command postconditional and delimiter
		ld	a, 1
		ld	(Locks), a
		ld	a, (Case)
		cp	4
		jp	z, loc_0D95
		cp	1
		jp	z, loc_0D88
		ld	a, (bmActFlag)
		or	a
		call	z, sub_49F2
		jp	loc_0DA0
loc_0D88:
		call	sub_126B
		call	sub_15DE
		ld	a, (bmActFlag)
		or	a
		call	z, sub_49E3
loc_0D95:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, loc_0D88
loc_0DA0:
		xor	a
		ld	(Locks), a
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecLock
; =============== S U B	R O U T	I N E =======================================
; Entry	point of OPEN command
ecOpen:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, ecOpen3
		cp	1
		jp	nz, Error14	; Illegal command terminator
ecOpen1:				; Expression
		call	Expr
		ld	a, (bmActFlag)
		or	a
		call	z, DevNtoShort	; Converts device # to short
		ld	a, (Token)
		cp	16h		; Is it	':'?
		jp	nz, ecOpen2
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	sub_15DE
		ld	a, (Result)
		cp	1
		jp	z, ecOpen2
		call	DevParam	; Device parameters
		call	sub_15DE
ecOpen2:
		ld	a, (bmActFlag)
		or	a
		call	z, bcOpen
ecOpen3:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, ecOpen1
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecOpen
; =============== S U B	R O U T	I N E =======================================
; Entry	point of QUIT command
ecQuit:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	2
		jp	z, ecQuit1
		cp	3
		jp	nz, Error14	; Illegal command terminator
ecQuit1:
		ld	a, (bmActFlag)
		or	a
		call	z, bcQuit	; Body of QUIT command
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecQuit
; =============== S U B	R O U T	I N E =======================================
; Entry	point of READ command
ecRead:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, ecRead6
		cp	1
		jp	nz, Error14	; Illegal command terminator
ecRead2:
		ld	a, (Token)
		cp	7		; Is it	'*'?
		jp	nz, ecRead3
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	LVarName	; Check	for local variable name
		ld	a, (Result)
		cp	1
		jp	nz, Error23	; Illegal variable name
		xor	a
		ld	(TimeoutFL), a
		call	sub_15DE
		ld	a, (bmActFlag)
		or	a
		call	z, sub_3C2E
		jp	ecRead6
ecRead3:				; Checks if needed to output !,	# or ?x
		call	ChkCRLFSP
		ld	a, (Result)
		cp	1
		jp	z, ecRead6
		call	StrLit		; Check	for string literal
		ld	a, (Result)
		cp	1
		jp	nz, ecRead4
		ld	a, (bmActFlag)
		or	a
		call	z, sub_3CCC
		jp	ecRead6
ecRead4:				; Check	for local variable name
		call	LVarName
		ld	a, (Result)
		cp	1
		jp	nz, Error18	; Illegal character
		ld	a, (Token)
		cp	9		; Is it	'#'?
		jp	nz, ecRead5
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	IntExp		; Integer-Value	expression
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4E07
ecRead5:
		ld	a, 1
		ld	(TimeoutFL), a
		call	sub_15DE
		ld	a, (bmActFlag)
		or	a
		call	z, sub_3CD3
ecRead6:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, ecRead2
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecRead
; =============== S U B	R O U T	I N E =======================================
; Entry	point of SET command
ecSet:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, ecSet3
		cp	1
		jp	nz, Error14	; Illegal command terminator
ecSet1:					; Check	for (settable) function	name
		call	CkFunction
		ld	a, (Result)
		cp	1
		jp	z, ecSet2
		call	sub_126B
ecSet2:
		ld	a, (Token)
		cp	11h		; Is it	'='?
		jp	nz, Error27	; Missing equal	sign
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	Expr		; Expression
		ld	a, (bmActFlag)
		or	a
		call	z, sub_33D6
ecSet3:					; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, ecSet1
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecSet
; =============== S U B	R O U T	I N E =======================================
; Entry	point of USE command
ecUse:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, ecUse4
		cp	1
		jp	nz, Error14	; Illegal command terminator
ecUse2:					; Expression
		call	Expr
		ld	a, (bmActFlag)
		or	a
		call	z, DevNtoShort	; Converts device # to short
		ld	a, (Token)
		cp	16h		; Is it	':'?
		jp	nz, ecUse3
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	DevParam	; Device parameters
ecUse3:
		ld	a, (bmActFlag)
		or	a
		call	z, sub_3BAC
ecUse4:					; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, ecUse2
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecUse
; =============== S U B	R O U T	I N E =======================================
; Entry	point of VIEW command
ecView:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, ecView3
		cp	1
		jp	z, ecView2
ecView1:
		xor	a
		ld	(ViewParam), a
		ld	a, (bmActFlag)
		or	a
		call	z, ShowVars	; View a list of local vars
		jp	ecView4
ecView2:				; Integer-Value	expression
		call	IntExp
		ld	a, (bmActFlag)
		or	a
		call	z, bcView	; Body of VIEW command
ecView3:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, ecView2
ecView4:
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecView
; =============== S U B	R O U T	I N E =======================================
; Entry	point of WRITE command
ecWrite:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, ecWrite3
		cp	1
		jp	nz, ecView1
ecWrite1:
		ld	a, (Token)
		cp	7		; Is it	'*'?
		jp	nz, ecWrite2
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	IntExp		; Integer-Value	expression
		ld	a, (bmActFlag)
		or	a
		call	z, WriteAst	; Writes *n
		jp	ecWrite3
ecWrite2:				; Checks if needed to output !,	# or ?x
		call	ChkCRLFSP
		ld	a, (Result)
		cp	1
		jp	z, ecWrite3
		call	Expr		; Expression
		ld	a, (bmActFlag)
		or	a
		call	z, Write
ecWrite3:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, ecWrite1
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecWrite
; =============== S U B	R O U T	I N E =======================================
; Entry	point of XECUTE	command
ecXecute:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, ecXecute3
		cp	1
		jp	nz, Error14	; Illegal command terminator
ecXecute1:				; String-Value expression
		call	StrExp
		call	ArgCond		; Argument conditional
		ld	a, (Case)
		cp	1
		jp	z, ecXecute2
		ld	a, (bmActFlag)
		or	a
		call	z, sub_2B1D
		jp	ecXecute3
ecXecute2:
		ld	a, (bmActFlag)
		or	a
		call	z, bcXecute	; Body of XECUTE command
ecXecute3:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, ecXecute1
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecXecute
; =============== S U B	R O U T	I N E =======================================
; Entry	point of ZDELETE command
eczDelete:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, eczDelete2
		cp	1
		jp	nz, Error14	; Illegal command terminator
eczDelete1:				; Routine name primitive
		call	RoutineN
		ld	a, (bmActFlag)
		or	a
		call	z, bczDelete	; Body of ZDELETE command
eczDelete2:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, eczDelete1
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function eczDelete
; =============== S U B	R O U T	I N E =======================================
; Entry	point of ZGO command
eczGo:
		call	PostCond1
		ld	a, (Case)
		cp	4
		jp	z, eczGo2
		cp	1
		jp	nz, eczGo1
		call	IntExp		; Integer-Value	expression
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4D30
eczGo1:
		ld	a, (bmActFlag)
		or	a
		call	z, bczGo	; Body of ZGO command
eczGo2:
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function eczGo
; =============== S U B	R O U T	I N E =======================================
; Entry	point of ZINSERT command
eczInsert:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, loc_108E
		cp	1
		jp	nz, Error14	; Illegal command terminator
loc_106F:				; String-Value expression
		call	StrExp
		ld	a, (Token)
		cp	16h		; Is it	':'?
		jp	nz, loc_1087
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	Liner
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4900
loc_1087:
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4C9E
loc_108E:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, loc_106F
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function eczInsert
; =============== S U B	R O U T	I N E =======================================
; Entry	point of ZLOAD command
eczLoad:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, loc_10BB
		cp	1
		jp	nz, Error14	; Illegal command terminator
loc_10B1:				; Routine name primitive
		call	RoutineN
		ld	a, (bmActFlag)
		or	a
		call	z, sub_48E5
loc_10BB:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, loc_10B1
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function eczLoad
; =============== S U B	R O U T	I N E =======================================
; Entry	point of ZMOVE command
eczMove:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, loc_1107
		cp	1
		jp	z, loc_10E8
		ld	a, (bmActFlag)
		or	a
		call	z, sub_48F9
		jp	loc_1112
loc_10E8:
		ld	a, (Token)
		cp	16h		; Is it	':'?
		jp	nz, loc_10FD
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4BEC
		jp	loc_1107
loc_10FD:
		call	Liner
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4900
loc_1107:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, loc_10FD
loc_1112:
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function eczMove
; =============== S U B	R O U T	I N E =======================================
; Entry	point of ZOPTION command
eczOption:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, loc_1145
		cp	1
		jp	z, loc_1134
		ld	a, (bmActFlag)
		or	a
		call	z, sub_333B
		jp	loc_1150
loc_1134:
		ld	a, (bmActFlag)
		or	a
		call	z, ZeroToS	; Zero Top of Stack
		call	DevParam	; Device parameters
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4CC9
loc_1145:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, loc_1134
loc_1150:
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function eczOption
; =============== S U B	R O U T	I N E =======================================
; Entry	point of PRINT/ZPRINT command
ecPrint:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, loc_1191
		cp	1
		jp	z, loc_1172
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4914
		jp	loc_119C
loc_1172:
		ld	a, (Token)
		cp	7		; Is it	'*'?
		jp	nz, loc_1187
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4BF3
		jp	loc_1191
loc_1187:
		call	sub_12AF
		ld	a, (bmActFlag)
		or	a
		call	z, sub_492D
loc_1191:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, loc_1172
loc_119C:
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecPrint
; =============== S U B	R O U T	I N E =======================================
; Entry	point of ZREMOVE command
eczRemove:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, eczRemove3
		cp	1
		jp	z, eczRemove1
		ld	a, (bmActFlag)
		or	a
		call	z, sub_48A2
		jp	eczRemove4
eczRemove1:
		ld	a, (Token)
		cp	7		; Is it	'*'?
		jp	nz, eczRemove2
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4C0D
		jp	eczRemove3
eczRemove2:
		call	sub_12AF
		ld	a, (bmActFlag)
		or	a
		call	z, sub_48D2
eczRemove3:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, eczRemove1
eczRemove4:
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function eczRemove
; =============== S U B	R O U T	I N E =======================================
; Entry	point of ZSAVE command
eczSave:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	4
		jp	z, eczSave2
		cp	1
		jp	z, eczSave1
		ld	a, (bmActFlag)
		or	a
		call	z, bczSave	; Body of ZSAVE	command
		jp	eczSave3
eczSave1:				; Routine name primitive
		call	RoutineN
		ld	a, (bmActFlag)
		or	a
		call	z, bczSaveN	; Body of ZSAVE	<name> command
eczSave2:				; Command argument ending
		call	ComArgEnd
		ld	a, (Result)
		cp	1
		jp	nz, eczSave1
eczSave3:
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function eczSave
; =============== S U B	R O U T	I N E =======================================
; Ambiguous H commands
ecHangHalt:
		call	PostCond	; Command postconditional and delimiter
		ld	a, (Case)
		cp	2
		jp	z, ecHangHalt1
		cp	3
		jp	nz, ecHang1
ecHangHalt1:				; Halt
		ld	a, (bmActFlag)
		or	a
		call	z, sub_3977
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function ecHangHalt
; =============== S U B	R O U T	I N E =======================================
; Transfer point primitive
Trans:
		call	SSChk		; Check	for room on the	syntax stack
		call	Entry		; Routine entry
		ld	a, (bmActFlag)
		or	a
		call	z, PushCase	; Push CASE in the stack (AC71)
		call	ArgCond		; Argument conditional
		ld	a, (Case)	; X return; Transfer point executable
		cp	1
		jp	z, TransEnd
		ld	a, (bmActFlag)	; Remove label[^routine] from stack
		or	a
		call	z, ClrTRInfo	; Clear	off transpt info (AC69)
TransEnd:
		ld	a, 1
		ld	(Result), a
		ret
; End of function Trans
; =============== S U B	R O U T	I N E =======================================
sub_126B:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 1
		ld	(SetSW), a
		ld	a, (bmActFlag)
		or	a
		call	z, ZeroToS	; Zero Top of Stack
		ld	a, (Token)
		cp	19h		; Is it	'('?
		jp	z, loc_128B
		call	GLVarName	; Global/Local variable	name
		call	sub_2723
		jp	loc_12A4
loc_128B:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		call	GLVarName	; Global/Local variable	name
		call	sub_2723
		ld	a, (Token)
		cp	15h		; Is it	','?
		jp	z, loc_128B
		cp	1Ah		; Is it	')'?
		jp	nz, Error12	; Unmatched parentheses
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
loc_12A4:
		ld	a, 1
		ld	(Result), a
		ld	a, 0
		ld	(SetSW), a
		ret
; End of function sub_126B
; =============== S U B	R O U T	I N E =======================================
sub_12AF:
		call	SSChk		; Check	for room on the	syntax stack
		call	Liner
		ld	a, 1
		ld	(Case),	a
		ld	a, (Token)
		cp	16h		; Is it	':'?
		jp	nz, loc_12E2
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, (Token)
		cp	1Fh		; Is it	' '?
		jp	z, loc_12D2
		cp	tknCRLF		; Is it	CR or LF?
		jp	nz, loc_12DA
loc_12D2:
		ld	a, 3
		ld	(Case),	a
		jp	loc_12E2
loc_12DA:
		call	Liner
		ld	a, 2
		ld	(Case),	a
loc_12E2:
		ld	a, 1
		ld	(Result), a
		ret
; End of function sub_12AF
; =============== S U B	R O U T	I N E =======================================
; Check	for (settable) function	name
CkFunction:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 1
		ld	(byte_0548), a
		call	Function	; Check	for function reference
		xor	a
		ld	(byte_0548), a
		ret
; End of function CkFunction
; =============== S U B	R O U T	I N E =======================================
; Missing linestart character
Error00:
		xor	a
		call	PrintErr	; Outputs error	message
; End of function Error00
; =============== S U B	R O U T	I N E =======================================
; Stack	overflow
Error01:
		ld	a, 1
		call	PrintErr	; Outputs error	message
; End of function Error01
; =============== S U B	R O U T	I N E =======================================
; Arithmetic overflow
Error02:
		ld	a, 2
		call	PrintErr	; Outputs error	message
; End of function Error02
; =============== S U B	R O U T	I N E =======================================
; Undefined local variable
Error03:
		ld	a, 3
		call	PrintErr	; Outputs error	message
; End of function Error03
; =============== S U B	R O U T	I N E =======================================
; Illegal function name
Error04:
		ld	a, 4
		call	PrintErr	; Outputs error	message
; End of function Error04
; =============== S U B	R O U T	I N E =======================================
; Illegal command name
Error05:
		ld	a, 5
		call	PrintErr	; Outputs error	message
; End of function Error05
; =============== S U B	R O U T	I N E =======================================
; Undefined program name
Error06:
		ld	a, 6
		call	PrintErr	; Outputs error	message
; End of function Error06
; =============== S U B	R O U T	I N E =======================================
; Undefined global name
Error07:
		ld	a, 7
		call	PrintErr	; Outputs error	message
; End of function Error07
; =============== S U B	R O U T	I N E =======================================
; Global+value too long
Error08:
		ld	a, 8
		call	PrintErr	; Outputs error	message
; End of function Error08
; =============== S U B	R O U T	I N E =======================================
; Directory full
Error09:
		ld	a, 9
		call	PrintErr	; Outputs error	message
; End of function Error09
; =============== S U B	R O U T	I N E =======================================
; Program larger than partition
Error10:
		ld	a, 10
		call	PrintErr	; Outputs error	message
; End of function Error10
; =============== S U B	R O U T	I N E =======================================
; String too long
Error11:
		ld	a, 11
		call	PrintErr	; Outputs error	message
; End of function Error11
; =============== S U B	R O U T	I N E =======================================
; Unmatched parentheses
Error12:
		ld	a, 12
		call	PrintErr	; Outputs error	message
; End of function Error12
; =============== S U B	R O U T	I N E =======================================
; Illegal use of NOT operator
Error13:
		ld	a, 13
		call	PrintErr	; Outputs error	message
; End of function Error13
; =============== S U B	R O U T	I N E =======================================
; Illegal command terminator
Error14:
		ld	a, 14
		call	PrintErr	; Outputs error	message
; End of function Error14
; =============== S U B	R O U T	I N E =======================================
; Too many naked references
Error15:
		ld	a, 15
		call	PrintErr	; Outputs error	message
; End of function Error15
; =============== S U B	R O U T	I N E =======================================
; Unauthorized global access
Error16:
		ld	a, 16
		call	PrintErr	; Outputs error	message
; End of function Error16
; =============== S U B	R O U T	I N E =======================================
; Division by zero
Error17:
		ld	a, 17
		call	PrintErr	; Outputs error	message
; End of function Error17
; =============== S U B	R O U T	I N E =======================================
; Illegal character
Error18:
		ld	a, 18
		call	PrintErr	; Outputs error	message
; End of function Error18
; =============== S U B	R O U T	I N E =======================================
; Syntax stack overflow
Error19:
		ld	a, 19
		call	PrintErr	; Outputs error	message
; End of function Error19
; =============== S U B	R O U T	I N E =======================================
; Illegal expression
Error20:
		ld	a, (bmActFlag)
		or	a
		call	z, sub_3FBA
		ld	a, 20
		call	PrintErr	; Outputs error	message
; End of function Error20
; =============== S U B	R O U T	I N E =======================================
; Illegal pattern
Error21:
		ld	a, 21
		call	PrintErr	; Outputs error	message
; End of function Error21
; =============== S U B	R O U T	I N E =======================================
; Missing comma
Error22:
		ld	a, 22
		call	PrintErr	; Outputs error	message
; End of function Error22
; =============== S U B	R O U T	I N E =======================================
; Illegal variable name
Error23:
		ld	a, 23
		call	PrintErr	; Outputs error	message
; End of function Error23
; =============== S U B	R O U T	I N E =======================================
; Illegal use of indirection
Error24:
		ld	a, 24
		call	PrintErr	; Outputs error	message
; End of function Error24
; =============== S U B	R O U T	I N E =======================================
; Undefined routine number
Error25:
		ld	a, 25
		call	PrintErr	; Outputs error	message
; End of function Error25
; =============== S U B	R O U T	I N E =======================================
; Illegal numeric literal
Error26:
		ld	a, 26
		call	PrintErr	; Outputs error	message
; End of function Error26
; =============== S U B	R O U T	I N E =======================================
; Missing equal	sign
Error27:
		ld	a, 27
		call	PrintErr	; Outputs error	message
; End of function Error27
; =============== S U B	R O U T	I N E =======================================
; Illegal routine or label name
Error28:
		ld	a, 28
		call	PrintErr	; Outputs error	message
; End of function Error28
; =============== S U B	R O U T	I N E =======================================
; Invalid name syntax
Error29:
		ld	a, 29
		call	PrintErr	; Outputs error	message
; End of function Error29
; =============== S U B	R O U T	I N E =======================================
; Unimplemented	operation
Error30:
		ld	a, 30
		call	PrintErr	; Outputs error	message
; End of function Error30
; =============== S U B	R O U T	I N E =======================================
; Symbol table overflow
Error31:
		ld	a, 31
		call	PrintErr	; Outputs error	message
; End of function Error31
; =============== S U B	R O U T	I N E =======================================
; Duplicated label
Error33:
		ld	a, 33
		call	PrintErr	; Outputs error	message
; End of function Error33
; =============== S U B	R O U T	I N E =======================================
; Invalid line reference
Error34:
		ld	a, 34
		call	PrintErr	; Outputs error	message
; End of function Error34
; =============== S U B	R O U T	I N E =======================================
; No true value	in $SELECT
Error35:
		ld	a, 35
		call	PrintErr	; Outputs error	message
; End of function Error35
; =============== S U B	R O U T	I N E =======================================
; Naked	global reference illegal
Error36:
		ld	a, 36
		call	PrintErr	; Outputs error	message
; End of function Error36
; =============== S U B	R O U T	I N E =======================================
; Global file not on disk
Error37:
		ld	a, 37
		call	PrintErr	; Outputs error	message
; End of function Error37
; =============== S U B	R O U T	I N E =======================================
; Routine not on disk
Error38:
		ld	a, 38
		call	PrintErr	; Outputs error	message
; End of function Error38
; =============== S U B	R O U T	I N E =======================================
; Disk I/O error
Error39:
		ld	a, 39
		call	PrintErr	; Outputs error	message
; End of function Error39
; =============== S U B	R O U T	I N E =======================================
; Routine is unnamed
Error40:
		ld	a, 40
		call	PrintErr	; Outputs error	message
; End of function Error40
; =============== S U B	R O U T	I N E =======================================
; Routine already in library
Error41:
		ld	a, 41
		call	PrintErr	; Outputs error	message
; End of function Error41
; =============== S U B	R O U T	I N E =======================================
; Remove or save routine
Error42:
		ld	a, 42
		call	PrintErr	; Outputs error	message
; End of function Error42
; =============== S U B	R O U T	I N E =======================================
; Only used in indirect	mode
Error43:
		ld	a, 43
		call	PrintErr	; Outputs error	message
; End of function Error43
; =============== S U B	R O U T	I N E =======================================
; Illegal command during BREAK
Error44:
		ld	a, 44
		call	PrintErr	; Outputs error	message
; End of function Error44
; =============== S U B	R O U T	I N E =======================================
; Command only used during BREAK
Error45:
		ld	a, 45
		call	PrintErr	; Outputs error	message
; End of function Error45
; =============== S U B	R O U T	I N E =======================================
; Subscript missing
Error46:
		ld	a, 46
		call	PrintErr	; Outputs error	message
; End of function Error46
; =============== S U B	R O U T	I N E =======================================
; Invalid subscript
Error47:
		ld	a, 47
		call	PrintErr	; Outputs error	message
; End of function Error47
; =============== S U B	R O U T	I N E =======================================
; Invalid parameter
Error48:
		ld	a, 48
		call	PrintErr	; Outputs error	message
; End of function Error48
; =============== S U B	R O U T	I N E =======================================
; Device not open
Error49:
		ld	a, 49
		call	PrintErr	; Outputs error	message
; End of function Error49
; =============== S U B	R O U T	I N E =======================================
; Running out of global	space
Error50:
		ld	a, 50
		call	PrintErr	; Outputs error	message
; End of function Error50
; =============== S U B	R O U T	I N E =======================================
; Reading from write only device
Error51:
		ld	a, 51
		call	PrintErr	; Outputs error	message
; End of function Error51
; =============== S U B	R O U T	I N E =======================================
; Invalid device number
Error52:
		ld	a, 52
		call	PrintErr	; Outputs error	message
; End of function Error52
; =============== S U B	R O U T	I N E =======================================
; Invalid repetition count
Error54:
		ld	a, 54
		call	PrintErr	; Outputs error	message
; End of function Error54
; =============== S U B	R O U T	I N E =======================================
; Invalid read count
Error55:
		ld	a, 55
		call	PrintErr	; Outputs error	message
; End of function Error55
; =============== S U B	R O U T	I N E =======================================
; Argument conditional
ArgCond:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 1		; Set X	return
		ld	(Case),	a
		ld	a, (Token)
		cp	16h		; Is it	':'?
		jp	nz, ArgCond1
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	TVExp		; Check	for boolean expression
ArgCond1:
		ld	a, 1
		ld	(Result), a
		ret
; End of function ArgCond
; =============== S U B	R O U T	I N E =======================================
; Command postconditional and delimiter
PostCond:
		call	SSChk		; Check	for room on the	syntax stack
		call	ArgCond		; Argument conditional
		ld	a, (Case)
		cp	1
		jp	z, PostCond1
		ld	a, (bmActFlag)
		or	a
		call	z, SetAFb0	; Sets bit 0 of	bmActFlag
PostCond1:				; Check	for room on the	syntax stack
		call	SSChk
		ld	a, (Token)
		cp	1Fh		; Is it	' '?
		jp	z, PostCond2
		cp	tknCRLF		; Is it	CR or LF?
		jp	nz, Error14	; Illegal command terminator
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000010b
		ld	(hl), a
		ld	a, 2
		ld	(Case),	a
		jp	PostCond5
PostCond2:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		ld	a, (Token)
		cp	1Fh		; Is it	' '?
		jp	nz, PostCond3
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, 3
		ld	(Case),	a
		jp	PostCond5
PostCond3:				; Argument level indirection
		call	IndArg
		ld	a, (Result)
		cp	1
		jp	nz, PostCond4
		ld	a, (Case)
		cp	4
		jp	z, PostCond5
PostCond4:
		ld	a, 1
		ld	(Case),	a
PostCond5:
		ld	a, 1
		ld	(Result), a
		ret
; End of function PostCond
; =============== S U B	R O U T	I N E =======================================
; Command argument ending
ComArgEnd:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Token)
		cp	15h		; Is it	','?
		jp	nz, ComArgEnd2
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	IndArg		; Argument level indirection
		ld	a, (Result)
		cp	1
		jp	nz, ComArgEnd1
		ld	a, (Case)
		cp	4
		jp	z, ComArgEnd	; Command argument ending
ComArgEnd1:
		xor	a
		ld	(Result), a
		ret
ComArgEnd2:
		call	sub_1C40
		ld	a, (Result)
		cp	1
		jp	z, ComArgEnd	; Command argument ending
ComArgEnd3:				; Check	for room on the	syntax stack
		call	SSChk
ComArgEnd4:
		ld	a, (Token)
		cp	1Fh		; Is it	' '?
		jp	nz, ComArgEnd5
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		jp	ComArgEnd4
ComArgEnd5:
		ld	a, (Token)
		cp	1Dh		; Is it	';'?
		jp	z, ComArgEnd6
		cp	tknCRLF		; Is it	CR or LF?
		jp	nz, ComArgEnd7
ComArgEnd6:
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000010b
		ld	(hl), a
ComArgEnd7:
		ld	a, 1
		ld	(Result), a
		ret
; End of function ComArgEnd
; =============== S U B	R O U T	I N E =======================================
; Argument level indirection
IndArg:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Token)
		cp	18h		; Is it	'@'?
		jp	z, IndArg1
		xor	a
		ld	(Result), a
		ret
IndArg1:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		call	ExprAtom	; Expression atom
		call	sub_2129
		ld	a, (Case)
		cp	1
		jp	nz, IndArg2
		ld	a, (Token)
		cp	18h		; Is it	'@'?
		jp	z, IndArg1
IndArg2:
		ld	a, 1
		ld	(Result), a
		ret
; End of function IndArg
; =============== S U B	R O U T	I N E =======================================
; Name level indirection
IndName:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Token)	; Look for @
		cp	18h		; Is it	'@'?
		jp	z, IndName1
		call	AC16		; Test for flag	from argument leve; Set	Case
		jp	IndName2
IndName1:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		call	ExprAtom	; Expression atom
		ld	a, 4		; In case semantic execution inhibited
		ld	(Case),	a
		ld	a, (bmActFlag)	; Set NamInd; Execute Stack; Set Case
		or	a
		call	z, AC109	; Put indirect string on stack
		ld	a, (Case)	; Syntax checking only
		cp	1
		jp	nz, IndName2
		ld	a, (Token)	; Look for another at sign
		cp	18h		; Is it	'@'?
		jp	z, IndName1
IndName2:
		ld	a, 1
		ld	(Result), a
		ret
; End of function IndName
; =============== S U B	R O U T	I N E =======================================
; Checks if needed to output !,	# or ?x
ChkCRLFSP:
		call	SSChk		; Check	for room on the	syntax stack
		call	DoCRLFFF	; Outputs W ! and W #
		ld	a, (Result)
		cp	1
		jp	z, ChkCRLFSP1
		call	DoHSPC		; Outputs W ?X (Horizontal Spacing)
		ld	a, (Result)
		cp	1
		jp	z, ChkCRLFSP2
		xor	a
		ld	(Result), a
		ret
ChkCRLFSP1:				; Outputs W ! and W #
		call	DoCRLFFF
		ld	a, (Result)
		cp	1
		jp	z, ChkCRLFSP1
		call	DoHSPC		; Outputs W ?X (Horizontal Spacing)
ChkCRLFSP2:
		ld	a, 1
		ld	(Result), a
		ret
; End of function ChkCRLFSP
; =============== S U B	R O U T	I N E =======================================
; Outputs W ! and W #
DoCRLFFF:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Token)
		cp	0Ch		; Is it	'!'?
		jp	nz, DoCRLFFF1
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, (bmActFlag)
		or	a
		call	z, PrintCRLF
		jp	DoCRLFFF3
DoCRLFFF1:
		ld	a, (Token)
		cp	9		; Is it	'#'?
		jp	z, DoCRLFFF2
		xor	a
		ld	(Result), a
		ret
DoCRLFFF2:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		ld	a, (bmActFlag)
		or	a
		call	z, PrintFF
DoCRLFFF3:
		ld	a, 1
		ld	(Result), a
		ret
; End of function DoCRLFFF
; =============== S U B	R O U T	I N E =======================================
; Outputs W ?X (Horizontal Spacing)
DoHSPC:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Token)
		cp	1Eh		; Is it	'?'?
		jp	z, DoHSPC1
		xor	a
		ld	(Result), a
		ret
DoHSPC1:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		call	IntExp		; Integer-Value	expression
		ld	a, (bmActFlag)
		or	a
		call	z, HSPC		; Outputs horizontal spacing (W	?x or R	?x)
		ld	a, 1
		ld	(Result), a
		ret
; End of function DoHSPC
; =============== S U B	R O U T	I N E =======================================
sub_15DE:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Token)
		cp	16h		; Is it	':'?
		jp	z, loc_15EE
		xor	a
		ld	(Result), a
		ret
loc_15EE:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		call	NumExp		; Numeric-Value	expression
		ld	a, (bmActFlag)
		or	a
		call	z, sub_486E
		ld	a, 1
		ld	(Result), a
		ret
; End of function sub_15DE
; =============== S U B	R O U T	I N E =======================================
; Routine entry
Entry:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Token)
		cp	14h		; Is it	'^'?
		jp	nz, Entry1
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	RoutineN	; Check	for routine name
		ld	a, 1		; Routine name only case
		ld	(Case),	a
		jp	Entry2
Entry1:					; Check	for label name[+offset]
		call	Liner
		xor	a		; Label	only case
		ld	(Case),	a
		ld	a, (Token)
		cp	14h		; Is it	'^'?
		jp	nz, Entry2
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	RoutineN	; Check	for routine name
		ld	a, 2		; Label	and routine name
		ld	(Case),	a
Entry2:
		ld	a, 1
		ld	(Result), a
		ret
; End of function Entry
; =============== S U B	R O U T	I N E =======================================
; Routine name primitive
RoutineN:
		call	SSChk		; Check	for room on the	syntax stack
		call	IndName		; Name level indirection
		ld	a, (Case)	; Syntax checking only
		cp	4
		jp	z, RoutineN1
		call	NameLit		; Check	for a name literal
		ld	a, (Result)
		cp	1
		jp	nz, Error28	; Illegal routine or label name
		ld	a, (bmActFlag)
		or	a
		call	z, AC110	; Check	for end	of all levels of name indir
RoutineN1:
		ld	a, 1
		ld	(Result), a
		ret
; End of function RoutineN
; =============== S U B	R O U T	I N E =======================================
Liner:
		call	SSChk		; Check	for room on the	syntax stack
		call	Label		; Check	for label name
Linof:					; Check	for room on the	syntax stack
		call	SSChk
		ld	a, (Token)
		cp	5		; Is it	'+'?
		jp	z, Linof1
		ld	a, (bmActFlag)	; Zero ToS (zero offset)
		or	a
		call	z, ZeroToS	; Zero Top of Stack
		xor	a
		ld	(Result), a
		ret
Linof1:					; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		call	IntExp		; Check	for integer offset expression
		ld	a, 1
		ld	(Result), a
		ret
; End of function Liner
; =============== S U B	R O U T	I N E =======================================
Label:
		call	SSChk		; Check	for room on the	syntax stack
		call	IndName		; Name level indirection
		ld	a, (Case)
		cp	4
		jp	z, Label2
		call	NameLit		; Check	for a name literal
		ld	a, (Result)
		cp	1
		jp	z, Label1
		call	NumLabel	; Check	for a numeric label
		ld	a, (Result)
		cp	1
		jp	nz, Error28	; Illegal routine or label name
Label1:
		ld	a, (bmActFlag)
		or	a
		call	z, AC110	; Check	for end	of all levels of name indir
Label2:
		ld	a, 1
		ld	(Result), a
		ret
; End of function Label
; =============== S U B	R O U T	I N E =======================================
; Device parameters
DevParam:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Token)
		cp	19h		; Is it	'('?
		jp	z, DevParam1
		call	Expr		; Expression
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4A8E
		jp	DevParam4
DevParam1:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		jp	DevParam3
DevParam2:				; Expression
		call	Expr
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4A8E
		call	sub_1718
		ld	a, (Result)
		cp	1
		jp	nz, DevParam2
		ld	a, (Case)
		cp	2
		jp	z, DevParam4
DevParam3:
		call	sub_1718
		ld	a, (Result)
		cp	1
		jp	nz, DevParam2
		ld	a, (Case)
		cp	2
		jp	z, DevParam4
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4ADA
		jp	DevParam3
DevParam4:
		ld	a, 1
		ld	(Result), a
		ret
; End of function DevParam
; =============== S U B	R O U T	I N E =======================================
sub_1718:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 1
		ld	(Case),	a
		ld	a, (Token)
		cp	16h		; Is it	':'?
		jp	z, loc_173A
		ld	a, 2
		ld	(Case),	a
		ld	a, (Token)
		cp	1Ah		; Is it	')'?
		jp	z, loc_173A
		xor	a
		ld	(Result), a
		ret
loc_173A:
		ld	a, 1
		ld	(Result), a
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ret
; End of function sub_1718
; =============== S U B	R O U T	I N E =======================================
; String-Value expression
StrExp:
		call	SSChk		; Check	for room on the	syntax stack
		call	Expr		; Expression
		ld	a, (bmActFlag)
		or	a
		call	z, Null1
		ld	a, 1
		ld	(Result), a
		ret
; End of function StrExp
; =============== S U B	R O U T	I N E =======================================
; Numeric-Value	expression
NumExp:
		call	SSChk		; Check	for room on the	syntax stack
		call	Expr		; Expression
		ld	a, (bmActFlag)
		or	a
		call	z, ExprToNum	; Convert expression to	numeric	value
		ld	a, 1
		ld	(Result), a
		ret
; End of function NumExp
; =============== S U B	R O U T	I N E =======================================
; Integer-Value	expression
IntExp:
		call	SSChk		; Check	for room on the	syntax stack
		call	Expr		; Expression
		ld	a, (bmActFlag)	; Convert to numeric value
		or	a
		call	z, ExprToInt	; Convert expression to	integer
		ld	a, 1
		ld	(Result), a
		ret
; End of function IntExp
; =============== S U B	R O U T	I N E =======================================
; Truth-Value expression
TVExp:
		call	SSChk		; Check	for room on the	syntax stack
		call	Expr		; Expression
		ld	a, 1		; In case semantic execution inhibited
		ld	(Case),	a
		ld	a, (bmActFlag)
		or	a
		call	z, ExpToTV	; Convert expression to	truth-value
		ld	a, 1
		ld	(Result), a
		ret
; End of function TVExp
; =============== S U B	R O U T	I N E =======================================
; Expression
Expr:
		call	SSChk		; Check	for room on the	syntax stack
		call	ExprAtom	; Expression atom
Expr1:
		call	sub_1E76
		ld	a, (Result)
		cp	1
		jp	z, Expr5
		ld	a, (Token)
		cp	4		; Is it	'''?
		jp	z, Expr3
		cp	1Eh		; Is it	'?'?
		jp	nz, Expr2
		ld	hl, bmFlag1	; b2:Routine not saved
		ld	a, 11111101b
		and	(hl)
		ld	(hl), a
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		jp	Expr4
Expr2:
		ld	a, 1
		ld	(Result), a
		ret
Expr3:					; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		call	sub_1C60
		ld	a, (Result)
		cp	1
		jp	z, Expr5
		ld	a, (Token)
		cp	1Eh		; Is it	'?'?
		jp	nz, Error13	; Illegal use of NOT operator
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	hl, bmFlag1	; b2:Routine not saved
		ld	a, (hl)
		or	00000010b
		ld	(hl), a
Expr4:
		call	sub_17FF
		ld	a, (bmActFlag)
		or	a
		call	z, sub_44A6
		jp	Expr1
Expr5:					; Expression atom
		call	ExprAtom
		ld	a, (bmActFlag)
		or	a
		call	z, sub_31CA
		jp	Expr1
; End of function Expr
; =============== S U B	R O U T	I N E =======================================
sub_17FF:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (bmActFlag)
		or	a
		call	z, Null1
		ld	(word_02FA), ix
		call	IndName		; Name level indirection
		ld	a, (Case)
		cp	4
		jp	z, loc_1835
		call	sub_183B
		ld	a, (Result)
		cp	1
		jp	nz, Error21	; Illegal pattern
loc_1823:
		call	sub_183B
		ld	a, (Result)
		cp	1
		jp	z, loc_1823
		ld	a, (bmActFlag)
		or	a
		call	z, AC110	; Check	for end	of all levels of name indir
loc_1835:
		ld	a, 1
		ld	(Result), a
		ret
; End of function sub_17FF
; =============== S U B	R O U T	I N E =======================================
sub_183B:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Token)
		cp	1Ch		; Is it	'.'?
		jp	nz, loc_1865
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4E73
		call	IntLit		; Check	for integer literal
		ld	a, (Result)
		cp	1
		jp	z, loc_1898
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4C3E
		jp	loc_1898
loc_1865:				; Check	for integer literal
		call	IntLit
		ld	a, (Result)
		cp	1
		jp	z, loc_1871
		ret
loc_1871:
		ld	a, (Token)
		cp	1Ch		; Is it	'.'?
		jp	nz, loc_1891
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	IntLit		; Check	for integer literal
		ld	a, (Result)
		cp	1
		jp	z, loc_1898
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4C3E
		jp	loc_1898
loc_1891:
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4E9C
loc_1898:
		call	sub_1FD4
		ld	a, (Result)
		cp	1
		jp	z, loc_18AE
		call	StrLit		; Check	for string literal
		ld	a, (Result)
		cp	1
		jp	nz, Error21	; Illegal pattern
loc_18AE:
		ld	a, 1
		ld	(Result), a
		ret
; End of function sub_183B
; =============== S U B	R O U T	I N E =======================================
; Expression atom
ExprAtom:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (bmActFlag)
		or	a
		call	z, ZeroToS	; Zero Top of Stack
		call	UnaryOp		; Count	unary operators	( ', + and -)
		ld	a, (Token)	; Look for left	parenthesis
		cp	19h		; Is it	'('?
		jp	nz, ExprAtom1
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	Expr		; Expression
		ld	a, (Token)	; Look for right parenthesis
		cp	1Ah		; Is it	')'?
		jp	nz, Error12	; Unmatched parentheses
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
ExprAtomEnd:
		ld	a, (bmActFlag)
		or	a
		call	z, ApplyUnOp	; Apply	unary operators, stack ExprAtom
		ld	a, 1
		ld	(Result), a
		ret
ExprAtom1:				; Check	for numeric literal
		call	NumLit
		ld	a, (Result)
		cp	1
		jp	z, ExprAtomEnd
		call	StrLit		; Check	for string literal
		ld	a, (Result)
		cp	1
		jp	z, ExprAtomEnd
		call	Function	; Check	for function reference
		ld	a, (Result)
		cp	1
		jp	z, ExprAtomEnd
		call	LVarName	; Check	for local variable name
		ld	a, (Result)
		cp	1
		jp	nz, ExprAtom2
		ld	a, (bmActFlag)	; Search symbol	table for LocalVarName
		or	a
		call	z, sub_42C0	; (todo) AC81
		jp	ExprAtomEnd
ExprAtom2:				; Global variable name
		call	GVarName
		ld	a, (Result)
		cp	1
		jp	nz, Error20	; Illegal expression
		ld	a, (bmActFlag)
		or	a
		call	z, sub_443E	; (todo) AC85
		jp	ExprAtomEnd
; End of function ExprAtom
; =============== S U B	R O U T	I N E =======================================
; Global/Local variable	name
GLVarName:
		call	SSChk		; Check	for room on the	syntax stack
		call	LVarName	; Check	for local variable name
		ld	a, (Result)
		cp	1
		jp	nz, GLVarName1
		ld	a, (bmActFlag)
		or	a
		call	z, PushOne	; Push a 1 in the stack
		jp	GLVarNameE
GLVarName1:				; Global variable name
		call	GVarName
		ld	a, (Result)
		cp	1
		jp	nz, Error23	; Illegal variable name
		ld	a, (bmActFlag)
		or	a
		call	z, PushMinusOne	; Push a -1 in the stack
GLVarNameE:
		ld	a, 1
		ld	(Result), a
		ret
; End of function GLVarName
; =============== S U B	R O U T	I N E =======================================
; Check	for local variable name
LVarName:
		call	SSChk		; (todo) finish	this
		call	IndName		; Name level indirection
		ld	a, (Case)
		cp	4
		jp	z, GVarNameEnd
		xor	a
		ld	(GLB), a
		call	NameLit		; Check	for a name literal
		ld	a, (Result)
		cp	1
		jp	z, Subscript
		xor	a
		ld	(Result), a
		ret
; End of function LVarName
; =============== S U B	R O U T	I N E =======================================
; Global variable name
GVarName:
		call	SSChk		; Check	for room on the	syntax stack
		call	IndName		; Check	for global variable indirection
		ld	a, (Case)	; Syntax checking only
		cp	4
		jp	z, GVarNameEnd
		ld	a, (Token)
		cp	14h		; Is it	'^'?
		jp	z, GVarName1
		xor	a		; Not a	global reference
		ld	(Result), a
		ret
GVarName1:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		ld	a, 1
		ld	(GLB), a
		ld	a, (Token)
		cp	19h		; Is it	'('?
		jp	nz, GVarName2
		call	NakedRef	; Naked	reference
		jp	Subscript
GVarName2:				; Check	for a name literal
		call	NameLit
		ld	a, (Result)
		cp	1
		jp	nz, Error23	; Illegal variable name
Subscript:
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4D6E	; (todo) AC27
GVarName3:
		ld	a, (Token)
		cp	19h		; Is it	'('?
		jp	nz, GVarName5
GVarName4:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		ld	a, (bmActFlag)
		or	a
		call	z, PushGlobal	; Push global on stack
		call	Expr		; Check	for subscript expression
		ld	a, (bmActFlag)	; Stack	expression value as integer
		or	a
		call	z, sub_29C5	; (todo) AC22
		ld	a, (Token)	; Look or comma	(more subscripts)
		cp	15h		; Is it	','?
		jp	z, GVarName4
		cp	1Ah		; Is it	')'?
		jp	nz, Error12	; Unmatched parentheses
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
GVarName5:
		ld	a, (IndFL)
		cp	1
		jp	nz, GVarName6
		ld	a, (bmActFlag)	; Check	end of one or more levels of name indirection
		or	a
		call	z, CkEndNLI	; Check	for end	on name	level indirection
		ld	a, (Token)
		cp	18h		; Is it	'@'?
		jp	nz, GVarName6
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		jp	GVarName3
GVarName6:
		xor	a
		ld	(GLB), a
GVarNameEnd:
		ld	a, 1
		ld	(Result), a
		ret
; End of function GVarName
; =============== S U B	R O U T	I N E =======================================
; Check	for function reference
Function:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Token)
		cp	1Bh		; Is it	'$'?
		jp	z, Function1
		xor	a		; Not a	function or special variable
		ld	(Result), a
		ret
Function1:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		call	GetFunSVName	; Get Function/Special Variable	name
		ld	a, 1
		ld	(Result), a
		ret
; End of function Function
;
;====================  FUNCTION	TABLE  ======================================
;
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $ASCII	function
efAscii:
		call	FSIEX		; String then integer expression primitive
		ld	a, (bmActFlag)
		or	a
		call	z, bfAscii	; Body of $ASCII function
		jp	fEnd		; Function ending primitive
; End of function efAscii
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $CHAR function
efChar:
		ld	a, (bmActFlag)
		or	a
		call	z, ZeroToS	; Zero Top of Stack
efChar1:				; Integer-Value	expression
		call	IntExp
		ld	a, (bmActFlag)
		or	a
		call	z, bfChar	; Body of $CHAR	function
		ld	a, (Token)
		cp	15h		; Is it	','?
		jp	nz, efChar2	; Compress character on	stack
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		jp	efChar1
efChar2:				; Compress character on	stack
		ld	a, (bmActFlag)
		or	a
		call	z, AC104	; Make stack ToS to string for $CHAR
		jp	fEnd		; Function ending primitive
; End of function efChar
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $DATA function
efData:
		call	GLVarName	; Global/Local variable	name
		ld	a, (bmActFlag)
		or	a
		call	z, bfData	; Body of $DATA	function
		jp	fEnd		; Function ending primitive
; End of function efData
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $EXTRACT function
efExtract:
		call	FSIEX		; String then integer expression primitive
		ld	a, (Result)
		cp	1
		jp	z, efExtract1
		ld	a, 1
		ld	(Case),	a
		jp	efExtract2
efExtract1:				; Integer expression primitive
		call	IntExpr
		ld	a, 2
		ld	(Case),	a
efExtract2:				; Extract characters
		ld	a, (bmActFlag)
		or	a
		call	z, bfExtract	; Body of $EXTRACT function
		jp	fEnd		; Function ending primitive
; End of function efExtract
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $FIND function
efFind:
		call	FSSEX		; Two strings then integer expression primitive
		ld	a, (bmActFlag)
		or	a
		call	z, bfFind	; Body of $FIND	function
		jp	fEnd		; Function ending primitive
; End of function efFind
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $JUSTIFY function
efJustify:
		call	Expr		; Expression
		call	IntExpr		; Integer expression primitive
		ld	a, (Result)
		cp	1
		jp	nz, Error22	; Missing comma
		call	IntExpr		; Integer expression primitive
		ld	a, (bmActFlag)
		or	a
		call	z, bfJustify	; Body of $JUSTIFY function
		jp	fEnd		; Function ending primitive
; End of function efJustify
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $LENGTH function
efLength:
		call	StrExp		; String-Value expression
		ld	a, 0
		ld	(Result), a
		ld	a, (Token)
		cp	15h		; Is it	','?
		jp	nz, efLength1
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	StrExp		; String-Value expression
		ld	a, 1
		ld	(Result), a
efLength1:
		ld	a, (bmActFlag)
		or	a
		call	z, bfLength	; Body of $LENGTH function
		jp	fEnd		; Function ending primitive
; End of function efLength
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $NEXT function
efNext:
		ld	a, 1
		ld	(bFlagNext), a
		call	GLVarName	; Global/Local variable	name
		ld	a, (bmActFlag)
		or	a
		call	z, bfNxtOrd	; Body of $NEXT	and $ORDER functions
		xor	a
		ld	(bFlagNext), a
		jp	fEnd		; Function ending primitive
; End of function efNext
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $ORDER	function
efOrder:
		ld	a, 1
		ld	(bFlagOrder), a
		call	GLVarName	; Global/Local variable	name
		ld	a, (bmActFlag)
		or	a
		call	z, bfNxtOrd	; Body of $NEXT	and $ORDER functions
		xor	a
		ld	(bFlagOrder), a
		jp	fEnd		; Function ending primitive
; End of function efOrder
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $PIECE	command
efPiece:
		call	FSSEX		; Two strings then integer expression primitive
		ld	a, 1
		ld	(Case),	a
		ld	a, (Result)
		cp	0
		jp	z, efPiece1
		call	IntExpr		; Integer expression primitive
		ld	a, 2
		ld	(Case),	a
efPiece1:
		ld	a, (bmActFlag)
		or	a
		call	z, sub_3367
		jp	fEnd		; Function ending primitive
; End of function efPiece
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $RANDOM function
efRandom:
		call	IntExp		; Integer-Value	expression
		ld	a, (bmActFlag)
		or	a
		call	z, bfRandom	; Body of $RANDOM function
		jp	fEnd		; Function ending primitive
; End of function efRandom
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $SELECT function
efSelect:
		ld	a, (bmActFlag)
		push	af
		call	sub_2616
efSelect1:				; Truth-Value expression
		call	TVExp
		ld	a, (Token)
		cp	16h		; Is it	':'?
		jp	nz, Error18	; Illegal character
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, (bmActFlag)
		or	a
		jp	nz, efSelect2
		ld	a, (Case)
		cp	1
		jp	z, efSelect3
		ld	a, (bmActFlag)
		or	a
		call	z, SetAFb0	; Sets bit 0 of	bmActFlag
efSelect2:				; Expression
		call	Expr
		call	ClrAFB0		; Clears bit 0 of bmActFlag
		jp	efSelect4
efSelect3:				; Expression
		call	Expr
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4A81
efSelect4:
		ld	a, (Token)
		cp	15h		; Is it	','?
		jp	nz, efSelect5
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		jp	efSelect1
efSelect5:
		call	CheckTrueV
		pop	af
		ld	(bmActFlag), a
		jp	fEnd		; Function ending primitive
; End of function efSelect
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $TEXT function
efText:
		call	Linof
		ld	a, (Result)
		cp	1
		jp	nz, efText1
		ld	a, (bmActFlag)
		or	a
		call	z, bfTextO	; Body of $TEXT	function with Offset
		jp	fEnd		; Function ending primitive
efText1:
		call	Liner
		ld	a, (bmActFlag)
		or	a
		call	z, bfTextL	; Body of $TEXT	function with LineRef
		jp	fEnd		; Function ending primitive
; End of function efText
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $VIEW function	(not implemented)
efView:
		jp	Error30		; Unimplemented	operation
		jp	fEnd		; Function ending primitive
; End of function efView
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $ZCHECK function
efzCheck:
		call	Expr		; Expression
		ld	a, (bmActFlag)
		or	a
		call	z, bfcCheck	; Body of $ZCHECK function
		jp	fEnd		; Function ending primitive
; End of function efzCheck
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $ZEXISTS function
efzExists:
		call	Expr		; Expression
		ld	a, (bmActFlag)
		or	a
		call	z, bfzExists	; Body of $ZEXISTS function
		jp	fEnd		; Function ending primitive
; End of function efzExists
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $ZORDER function
efzOrder:
		ld	a, 1
		ld	(bFlagOrder), a
		call	GVarName	; Global variable name
		xor	a
		ld	(bFlagOrder), a
		ld	a, (Result)
		cp	0
		jp	z, Error20	; Illegal expression
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4EAC
		jp	fEnd		; Function ending primitive
; End of function efzOrder
;
;===============  FUNCTION PRIMITIVE TABLE  =================================
;
; =============== S U B	R O U T	I N E =======================================
; Two strings then integer expression primitive
FSSEX:
		call	SSChk		; Check	for room on the	syntax stack
		call	StrExp		; String-Value expression
		ld	a, (Token)
		cp	15h		; Is it	','?
		jp	nz, Error22	; Missing comma
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
; End of function FSSEX
; =============== S U B	R O U T	I N E =======================================
; String then integer expression primitive
FSIEX:
		call	SSChk		; Check	for room on the	syntax stack
		call	StrExp		; String-Value expression
IntExpr:				; Integer expression primitive
		call	SSChk
		ld	a, (Token)
		cp	15h		; Is it	','?
		jp	z, FP1
		xor	a
		ld	(Result), a
		ret
FP1:					; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		call	IntExp		; Integer-Value	expression
		ld	a, 1
		ld	(Result), a
		ret
; End of function FSIEX
; =============== S U B	R O U T	I N E =======================================
; Function ending primitive
fEnd:
		ld	a, (Token)
		cp	1Ah		; Is it	')'?
		jp	nz, Error12	; Unmatched parentheses
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, 1
		ld	(Result), a
		ret
; End of function fEnd
;
;============  END OF FUNCTION PRIMITIVE TABLE	=============================
;
; =============== S U B	R O U T	I N E =======================================
sub_1C40:
		call	SSChk		; Check	for room on the	syntax stack
		xor	a
		ld	(Result), a
		ld	a, (IndFL)
		cp	2
		jp	nz, locret_1C5F
		ld	a, (Token)
		cp	tknCRLF		; Is it	CR or LF?
		jp	nz, Error24	; Illegal use of indirection
		call	IndRet		; Return from indirection
		ld	a, 1
		ld	(Result), a
locret_1C5F:
		ret
; End of function sub_1C40
; =============== S U B	R O U T	I N E =======================================
sub_1C60:
		call	SSChk		; Check	for room on the	syntax stack
		xor	a
		ld	(Result), a
		ld	a, (Token)
		cp	0Bh		; Is it	'&'?
		jp	c, locret_1CA6
		ld	a, 11h
		ld	hl, Token
		cp	(hl)
		jp	c, locret_1CA6
		ld	a, (bmActFlag)
		or	a
		jp	nz, loc_1C9E
		ld	a, 0Eh
		ld	hl, Token
		cp	(hl)
		jp	c, loc_1C8E
		call	ExprToNum	; Convert expression to	numeric	value
		jp	loc_1C91
loc_1C8E:
		call	Null1
loc_1C91:
		ld	a, (Token)
		add	a, 32h
		ld	(Token), a
		ld	(ix+0),	a
		inc	ix
loc_1C9E:
		ld	a, 1
		ld	(Result), a
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
locret_1CA6:
		ret
; End of function sub_1C60
; =============== S U B	R O U T	I N E =======================================
; Get Function/Special Variable	name
GetFunSVName:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (byte_0548)
		or	a
		jp	z, GetFunSVName1
		call	sub_850B
		jp	GetFunSVName2
GetFunSVName1:
		call	sub_8525
GetFunSVName2:
		ret
; End of function GetFunSVName
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $HOROLOG variable
evHorolog:
		ld	a, (bmActFlag)
		or	a
		jp	nz, fFinish
		call	GetCurTime	; Returns nothing as this is CP/M
		ld	hl, ibcdDay
		call	CharToStr	; Convert char (0-255) to string
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I1), a
		ld	(ix+0),	','     ; Push $H delimiter (,)
		inc	ix
		ld	hl, ibcdUnk03
		call	CharToStr	; Convert char (0-255) to string
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I2), a
		ld	a, (I1)
		ld	hl, I2
		add	a, (hl)
		ld	(I1), a
		ld	hl, I1
		inc	(hl)
		ld	a, (I1)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ret
; End of function evHorolog
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $IO variable
evIo:
		ld	a, (IODevice)
		ld	(IT), a
		jp	sub_1E68
; End of function evIo
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $JOB variable
evJob:
		ld	de, ibcdTemp0
		ld	hl, ibcdUnk08
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		jp	sub_1E5A
; End of function evJob
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $STORAGE variable
evStorage:
		ld	a, (bmActFlag)
		or	a
		jp	nz, fFinish
		ld	hl, (pSymbolTbl)
		ld	de, (word_9F9A)
		or	a
		sbc	hl, de
		ld	(pIndex), hl
		call	sub_9321
		ret
; End of function evStorage
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $TEST variable
evTest:
		ld	a, (IfSW)
		cp	2
		jp	z, Error03	; Undefined local variable
		ld	(IT), a
		jp	sub_1E68
; End of function evTest
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $X variable
evX:
		ld	a, (byte_0548)
		or	a
		jp	z, evX1
		ld	(SetBs), ix
		ld	a, 1
		ld	(SetFL), a
		ld	(ix+0),	24h	; '$'
		inc	ix
		ld	(ix+0),	58h	; 'X'
		inc	ix
		ret
evX1:
		ld	de, ibcdTemp0
		ld	hl, (pDevX)
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		jp	sub_1E5A
; End of function evX
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $Y variable
evY:
		ld	a, (byte_0548)
		or	a
		jp	z, evY1
		ld	(SetBs), ix
		ld	a, 1
		ld	(SetFL), a
		ld	(ix+0),	24h	; '$'
		inc	ix
		ld	(ix+0),	59h	; 'Y'
		inc	ix
		ret
evY1:
		ld	de, ibcdTemp0
		ld	hl, (pDevY)
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		jp	sub_1E5A
; End of function evY
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $PIECE	variable
esvPiece:
		ld	(SetBs), ix
		call	GLVarName	; Global/Local variable	name
		ld	a, (Token)
		cp	15h		; Is it	','?
		jp	nz, Error22	; Missing comma
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	FSIEX		; String then integer expression primitive
		ld	a, (Result)
		cp	1
		jp	z, esvPiece1
		ld	a, 1
		ld	(Case),	a
		jp	esvPiece2
esvPiece1:				; Integer expression primitive
		call	IntExpr
		ld	a, 2
		ld	(Case),	a
esvPiece2:
		ld	a, (Token)
		cp	1Ah		; Is it	')'?
		jp	nz, Error12	; Unmatched parentheses
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, (bmActFlag)
		or	a
		call	z, sub_4E86
		ld	a, 1
		ld	(SetFL), a
		ret
; End of function esvPiece
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $ERROR	variable
esvError:
		ld	a, (bmActFlag)
		or	a
		jp	nz, fFinish
		ld	a, (byte_0548)
		or	a
		jp	nz, esvError1
		ld	hl, byte_A04B
		call	sub_97D5
		ret
esvError1:
		ld	hl, byte_A04B
		ld	(word_A049), hl
		ret
; End of function esvError
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $ZNAME	variable
evzName:
		ld	a, (bmActFlag)
		or	a
		jp	nz, fFinish
		ld	hl, (pRtnName)
		call	sub_97D5
		ret
; End of function evzName
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $ZCOUNT variable
evzCount:
		ld	a, (bmActFlag)
		or	a
		jp	nz, fFinish
		call	sub_7974
		ld	hl, (word_A648)
		ld	(pIndex), hl
		call	sub_9321
		ret
; End of function evzCount
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $ZGLOBAL variable
evzGlobal:
		ld	a, (bmActFlag)
		or	a
		jp	nz, fFinish
		ld	a, (GlobalsDR)
		add	a, 41h		; 'A'
		ld	(IT), a
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	1
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ret
; End of function evzGlobal
; =============== S U B	R O U T	I N E =======================================
; Entry	point of $ZROUTINE variable
evzRoutine:
		ld	a, (bmActFlag)
		or	a
		jp	nz, fFinish
		ld	a, (RoutinesDR)
		add	a, 41h		; 'A'
		ld	(IT), a
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	1
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ret
; End of function evzRoutine
; =============== S U B	R O U T	I N E =======================================
sub_1E5A:
		ld	a, (bmActFlag)
		or	a
		jp	nz, fFinish
		ld	hl, ibcdTemp0
		call	CharToStr	; Convert char (0-255) to string
		ret
; End of function sub_1E5A
; =============== S U B	R O U T	I N E =======================================
sub_1E68:
		ld	a, (bmActFlag)
		or	a
		jp	nz, fFinish
		ld	a, (IT)
		call	IntToStr
; End of function sub_1E68
; =============== S U B	R O U T	I N E =======================================
fFinish:
		ret
; End of function fFinish
; =============== S U B	R O U T	I N E =======================================
sub_1E76:
		call	SSChk		; Check	for room on the	syntax stack
		xor	a
		ld	(Result), a
		ld	a, (Token)
		cp	5		; Is it	'+'?
		jp	c, locret_1EB7
		ld	a, 12h
		ld	hl, Token
		cp	(hl)		; Is it	'_'?
		jp	c, locret_1EB7
		ld	a, (bmActFlag)
		or	a
		jp	nz, loc_1EAF
		ld	a, 0Eh
		ld	hl, Token
		cp	(hl)		; Is it	'>'?
		jp	c, loc_1EA4
		call	ExprToNum	; Convert expression to	numeric	value
		jp	loc_1EA7
loc_1EA4:
		call	Null1
loc_1EA7:
		ld	a, (Token)
		ld	(ix+0),	a
		inc	ix
loc_1EAF:
		ld	a, 1
		ld	(Result), a
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
locret_1EB7:
		ret
; End of function sub_1E76
; =============== S U B	R O U T	I N E =======================================
; Naked	reference
NakedRef:
		ld	a, (Locks)
		cp	1
		jp	z, Error36	; Naked	global reference illegal
		ld	a, (bmActFlag)
		or	a
		jp	nz, NakedRefEnd
		ld	a, 1
		ld	(NR), a
		ld	(ix+0),	0
		inc	ix
		ld	(ix+0),	3
		inc	ix
NakedRefEnd:
		ret
; End of function NakedRef
; =============== S U B	R O U T	I N E =======================================
; Check	for string literal
StrLit:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 0
		ld	(Result), a
		ld	a, (Token)
		cp	17h		; Is it	'"'?
		jp	nz, StrLitEnd
		ld	a, 1		; It is	a string
		ld	(Result), a
		xor	a		; Initialize character count
		ld	(NumOfParams), a
		ld	a, (PF)
		or	a
		jp	z, StrLit2
		ld	a, (bmActFlag)
		or	a
		jp	nz, StrLit2
		ld	hl, ibcdUnk05
		call	StrToInt	; Converts string on ToS to integer
		ld	hl, ibcd1
		call	StrToInt	; Converts string on ToS to integer
		ld	hl, ibcdUnk05
		ld	a, (hl)
		and	11110000b
		jp	nz, StrLit1
		ld	hl, ibcd1
		ld	de, ibcdUnk05
		call	SCmp0		; Compares two strings (sets BC=INTLN*257 first)
		jp	c, Error54	; Invalid repetition count
StrLit1:
		ld	(ix+0),	0
		inc	ix
		ld	(TPP), ix
		ld	(ix+0),	0
		inc	ix
StrLit2:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		ld	a, (Token)	; Is it	the end	of the string?
		cp	17h		; Is it	'"'?
		jp	nz, StrLit3
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, (Token)
		cp	17h		; Is it	'"'?
		jp	nz, StrLit5
		jp	StrLit4
StrLit3:
		ld	a, (Token)
		cp	1		; Is it	'a' to 'z'?
		jp	c, Error18	; Illegal character
		cp	tknTAB		; Is it	TAB?
		jp	c, StrLit4
		jp	Error18		; Illegal character
StrLit4:
		ld	a, (bmActFlag)
		or	a
		jp	nz, StrLit2
		ld	a, (NumOfParams)
		cp	255
		jp	z, Error11	; String too long
		ld	hl, (pStkPos)
		ld	a, (hl)
		ld	(ix+0),	a
		inc	ix
		ld	hl, NumOfParams
		inc	(hl)
		jp	StrLit2
StrLit5:
		ld	a, (bmActFlag)
		or	a
		jp	nz, StrLitEnd
		ld	a, (PF)
		cp	0
		jp	z, StrLit6
		ld	hl, (TPP)
		ld	a, (NumOfParams)
		ld	(hl), a
		ld	(TPP), ix
		ld	hl, (TPP)
		ld	de, ibcd1
		call	Copy5DEHL	; Copy 5 bytes from (DE) to (HL) ; SetI
		ld	hl, (TPP)
		ld	de, 5
		add	hl, de
		ld	(TPP), hl
		ld	de, ibcdUnk05
		call	Copy5DEHL	; Copy 5 bytes from (DE) to (HL) ; SetI
		ld	hl, (TPP)
		ld	de, 5
		add	hl, de
		ld	(TPP), hl
		ld	ix, (TPP)
		call	SSChk		; Check	for room on the	syntax stack
		jp	StrLitEnd
StrLit6:				; Save length of string
		ld	a, (NumOfParams)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
StrLitEnd:
		ld	a, 0
		ld	(PF), a
		ret
; End of function StrLit
; =============== S U B	R O U T	I N E =======================================
sub_1FD4:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 0
		ld	(Result), a
		xor	a
		ld	(Count), a
		ld	a, (Token)
		cp	2		; Is it	'A' to 'Z'?
		jp	z, loc_2002
		ld	a, (Token)
		cp	1		; Is it	'a' to 'z'?
		jp	nz, loc_1FFA
		ld	hl, (pStkPos)
		ld	a, 11011111b
		and	(hl)
		ld	(hl), a
		jp	loc_2002
loc_1FFA:
		ld	a, 1
		ld	(PF), a
		jp	locret_20DC
loc_2002:
		ld	a, (bmActFlag)
		or	a
		jp	nz, loc_203A
		ld	hl, ibcdUnk05
		call	StrToInt	; Converts string on ToS to integer
		ld	hl, ibcd1
		call	StrToInt	; Converts string on ToS to integer
		ld	hl, ibcdUnk05
		ld	a, (hl)
		and	11110000b
		jp	nz, loc_202A
		ld	hl, ibcd1
		ld	de, ibcdUnk05
		call	SCmp0		; Compares two strings (sets BC=INTLN*257 first)
		jp	c, Error54	; Invalid repetition count
loc_202A:
		ld	(ix+0),	1
		inc	ix
		ld	(TPP), ix
		ld	(ix+0),	0
		inc	ix
loc_203A:
		ld	hl, (pStkPos)
		ld	a, (hl)
		cp	55h		; 'U'
		jp	z, loc_206A
		ld	a, (hl)
		cp	4Ch		; 'L'
		jp	z, loc_206A
		ld	a, (hl)
		cp	41h		; 'A'
		jp	z, loc_206A
		ld	a, (hl)
		cp	4Eh		; 'N'
		jp	z, loc_206A
		ld	a, (hl)
		cp	50h		; 'P'
		jp	z, loc_206A
		ld	a, (hl)
		cp	43h		; 'C'
		jp	z, loc_206A
		ld	a, (hl)
		cp	45h		; 'E'
		jp	z, loc_206A
		jp	Error21		; Illegal pattern
loc_206A:
		ld	a, (bmActFlag)
		or	a
		jp	nz, loc_207E
		ld	hl, (pStkPos)
		ld	a, (hl)
		ld	(ix+0),	a
		inc	ix
		ld	hl, Count
		inc	(hl)
loc_207E:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		ld	a, (Token)
		cp	2		; Is it	'A' to 'Z'?
		jp	z, loc_203A
		ld	a, (Token)
		cp	1		; Is it	'a' to 'Z'?
		jp	nz, loc_209B
		ld	hl, (pStkPos)
		ld	a, 11011111b
		and	(hl)
		ld	(hl), a
		jp	loc_203A
loc_209B:
		ld	a, 1
		ld	(Result), a
		ld	a, (bmActFlag)
		or	a
		jp	nz, locret_20DC
		ld	hl, (TPP)
		ld	a, (Count)
		ld	(hl), a
		ld	(TPP), ix
		ld	hl, (TPP)
		ld	de, ibcd1
		call	Copy5DEHL	; Copy 5 bytes from (DE) to (HL) ; SetI
		ld	hl, (TPP)
		ld	de, 5
		add	hl, de
		ld	(TPP), hl
		ld	de, ibcdUnk05
		call	Copy5DEHL	; Copy 5 bytes from (DE) to (HL) ; SetI
		ld	hl, (TPP)
		ld	de, 5
		add	hl, de
		ld	(TPP), hl
		ld	ix, (TPP)
		call	SSChk		; Check	for room on the	syntax stack
locret_20DC:
		ret
; End of function sub_1FD4
; =============== S U B	R O U T	I N E =======================================
; Count	unary operators	( ', + and -)
UnaryOp:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (bmActFlag)
		or	a
		jp	nz, UnaryOp1
		dec	ix		; Get unary operator count
		ld	a, (ix+0)
		ld	(IT), a
UnaryOp1:
		ld	a, (Token)
		cp	4		; Is it	'''?
		jp	c, UnaryOp3
		ld	a, 6
		ld	hl, Token
		cp	(hl)		; Is it	'-'?
		jp	c, UnaryOp3
		ld	a, (bmActFlag)
		or	a
		jp	nz, UnaryOp2
		ld	a, (Token)	; Save unary operator
		ld	(ix+0),	a
		inc	ix
UnaryOp2:				; Increment count
		ld	hl, IT
		inc	(hl)
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		jp	UnaryOp1
UnaryOp3:
		ld	a, (bmActFlag)
		or	a
		jp	nz, UnaryOpEnd
		ld	a, (IT)		; Save count
		ld	(ix+0),	a
		inc	ix
UnaryOpEnd:
		ret
; End of function UnaryOp
; =============== S U B	R O U T	I N E =======================================
sub_2129:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 1
		ld	(IT), a
		ld	a, 4
		ld	(Case),	a
		ld	a, (Token)
		cp	15h		; Is it	','?
		jp	z, loc_2148
		cp	1Fh		; Is it	' '?
		jp	z, loc_2148
		cp	tknCRLF		; Is it	CR of LF?
		jp	nz, loc_214D
loc_2148:
		ld	a, 2
		ld	(IT), a
loc_214D:
		ld	a, (bmActFlag)
		or	a
		jp	z, loc_2167
		ld	a, (IT)
		cp	2
		jp	z, locret_2166
		ld	a, 255
		ld	(Token), a
		ld	a, 3
		ld	(Case),	a
locret_2166:
		ret
loc_2167:
		call	Null1
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
		ld	(N), a
		ld	(Ptr), ix
		xor	a
		ld	(I1), a
loc_217F:
		ld	a, (N)
		or	a
		jp	z, loc_21C5
		ld	hl, (Ptr)
		dec	hl
		ld	(Ptr), hl
		ld	hl, N
		dec	(hl)
		ld	hl, (Ptr)
		ld	a, (hl)
		cp	0Dh
		jp	z, Error24	; Illegal use of indirection
		ld	a, (hl)
		cp	0Dh
		jp	z, Error24	; Illegal use of indirection
		ld	a, (hl)
		cp	Space
		jp	z, loc_21BB
		ld	a, (hl)
		cp	Quotes
		jp	nz, loc_217F
		ld	a, 1
		ld	hl, I1
		sub	(hl)
		ld	(I2), a
		ld	(I1), a
		jp	loc_217F
loc_21BB:
		ld	a, (I1)
		or	a
		jp	z, Error24	; Illegal use of indirection
		jp	loc_217F
loc_21C5:
		ld	a, (StrLen)
		cp	255
		jp	z, Error11	; String too long
		ld	hl, StrLen
		inc	(hl)
		ld	(ix+0),	0Dh
		inc	ix
		ld	a, (StrLen)
		ld	(ix+0),	a
		inc	ix
		ld	hl, (pStkStart)
		ld	(pLineBefore), hl
		ld	a, (Mode)
		cp	0
		jp	nz, loc_2207
		ld	de, (pLineBefore)
		ld	hl, (pStkPos)
		or	a
		sbc	hl, de
		ld	(pStkPos), hl
		ld	de, (pStartOfRtn)
		ld	hl, (pLineBefore)
		or	a
		sbc	hl, de
		ld	(pLineBefore), hl
loc_2207:
		ld	hl, (pLineBefore)
		call	sub_97BE
		ld	hl, (pStkPos)
		call	sub_97BE
		ld	hl, (Ptr)
		ld	(pStkPos), hl
		ld	(pStkStart), hl
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, (IT)
		cp	2
		jp	z, loc_2242
		ld	a, (Token)
		cp	4		; Is it	'''?
		jp	c, loc_2242
		cp	13h		; Is it	'%'?
		jp	z, loc_2242
		cp	14h		; Is it	'^'?
		jp	z, loc_2242
		cp	18h		; Is it	'@'?
		jp	nz, Error24	; Illegal use of indirection
loc_2242:
		ld	a, (IndFL)
		ld	(ix+0),	a
		inc	ix
		ld	a, (Mode)
		ld	(ix+0),	a
		inc	ix
		ld	a, (IT)
		ld	(IndFL), a
		ld	a, 3
		ld	(Mode),	a
		ld	a, 3
		ld	hl, IT
		sub	(hl)
		ld	(Case),	a
		ret
; End of function sub_2129
; =============== S U B	R O U T	I N E =======================================
; Check	for numeric literal
NumLit:
		call	SSChk		; Check	for room on the	syntax stack
		xor	a		; Minus	flag
		ld	(Signal1), a
		ld	a, 255		; Set digit count
		ld	(I1), a
		xor	a
		ld	(IT), a
		ld	(I2), a		; Size of integer part
		ld	(I3), a		; Size of decimal fraction
		ld	a, (bmFlag1)	; b2:Routine not saved
		and	STRNG
		jp	z, NumLit1
		ld	a, (StrLen)
		ld	(I1), a
NumLit1:
		ld	a, TRUE
		ld	(Delete), a	; Delete leading zeros
		ld	(PtrX1), ix	; Save start of	integer
		call	IntLit		; Check	for integer literal
		ld	a, (Result)
		cp	FALSE
		jp	z, NumLit3
		ld	a, (bmActFlag)
		or	a
		jp	nz, NumLit2
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I2), a
NumLit2:
		ld	a, 1
		ld	(IT), a
NumLit3:
		ld	(PtrX2), ix
		ld	a, (Token)
		cp	1Ch		; Is it	'.'?
		jp	nz, NumLit9
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	hl, I1
		dec	(hl)
		ld	a, (I1)
		or	a
		jp	z, NumLit22
		ld	a, (bmActFlag)
		or	a
		jp	nz, NumLit5
		ld	a, (I2)
		cp	1
		jp	nz, NumLit4
		ld	hl, (PtrX1)
		ld	a, (hl)
		cp	30h		; '0'
		jp	nz, NumLit4
		dec	ix
		xor	a
		ld	(I2), a
		ld	hl, (PtrX2)
		dec	hl
		ld	(PtrX2), hl
NumLit4:				; Add decimal place
		ld	(ix+0),	Point
		inc	ix
NumLit5:				; Check	for integer literal
		call	IntLit
		ld	a, (Result)
		cp	FALSE
		jp	z, NumLit8
		ld	a, TRUE
		ld	(IT), a
		ld	a, (bmActFlag)
		or	a
		jp	nz, NumLit9
		dec	ix		; Get count of decimal digits
		dec	ix
		ld	a, (ix+0)
		ld	(I3), a
NumLit6:				; Get rid of trailing zeros
		dec	ix
		ld	a, (ix+0)
		ld	(tmpChar), a
		cp	30h		; '0'
		jp	nz, NumLit7
		ld	hl, I3
		dec	(hl)
		ld	a, (I3)
		or	a
		jp	nz, NumLit6
		jp	NumLit8
NumLit7:				; Put last digit back
		ld	a, (tmpChar)
		ld	(ix+0),	a
		inc	ix
		jp	NumLit9
NumLit8:
		ld	a, (bmActFlag)
		or	a
		jp	nz, NumLit9
		dec	ix		; Get rid of decimal place
NumLit9:
		ld	a, (Signal1)
		cp	1
		jp	z, NumLit22
		ld	a, (IT)
		cp	TRUE
		jp	nz, NumLitEnd
		ld	hl, (pStkPos)	; Check	for exponent
		ld	a, (hl)
		cp	45h		; 'E'
		jp	nz, NumLit22
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	hl, I1
		dec	(hl)
		ld	a, (I1)
		or	a
		jp	z, NumLit22
		ld	a, (Token)	; Check	for E+
		cp	5		; Is it	'+'?
		jp	z, NumLit10
		cp	6		; Is it	'-'?
		jp	nz, NumLit11
		ld	a, 1		; Set minus flag
		ld	(Signal1), a
NumLit10:
		ld	hl, I1
		dec	(hl)
		ld	a, (I1)
		or	a
		jp	z, NumLit22
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
NumLit11:
		ld	a, TRUE
		ld	(Delete), a
		call	IntLit		; Get exponent
		ld	a, (Result)
		or	a
		jp	z, NumLitErr
		ld	a, (bmActFlag)
		or	a
		jp	nz, NumLitEnd
		call	StrToChar	; Converts a string on ToS to char (0-255)
		ld	(I1), a
		ld	a, (Result)
		cp	FALSE
		jp	z, Error26	; Illegal numeric literal
		ld	a, 63h		; 'c' (todo) Check this
		ld	hl, I1
		cp	(hl)
		jp	c, Error26	; Illegal numeric literal
		ld	a, (I3)
		or	a
		jp	nz, NumLit12
		ld	a, (I2)
		or	a
		jp	z, NumLit22
		cp	1
		jp	nz, NumLit12
		ld	hl, (PtrX1)
		ld	a, (hl)
		cp	30h		; '0'
		jp	z, NumLit22
NumLit12:				; Jump is exponent < 0
		ld	a, (Signal1)
		cp	1
		jp	z, NumLit18
		ld	hl, (PtrX2)	; PtrX1	at decimal place
		ld	(PtrX1), hl
		inc	hl
		ld	(PtrX2), hl
		ld	a, (I2)		; Include I1 digits in integer part
		ld	hl, I1
		add	a, (hl)
		ld	(I2), a
		ld	a, (I1)		; Jump if Exp is < # of	fraction digits
		ld	hl, I3
		cp	(hl)
		jp	c, NumLit17
		ld	hl, I2
		cp	(hl)
		jp	nz, NumLit14
NumLit13:
		ld	a, (I3)
		or	a
		jp	z, NumLit14
		ld	hl, (PtrX2)
		ld	a, (hl)
		cp	30h		; '0'
		jp	nz, NumLit14
		inc	hl
		ld	(PtrX2), hl
		ld	hl, I3
		dec	(hl)
		ld	hl, I2
		dec	(hl)
		ld	hl, I1
		dec	(hl)
		jp	NumLit13
NumLit14:				; Shift	fraction over DP
		ld	hl, (PtrX1)
		ex	de, hl
		ld	hl, (PtrX2)
		ld	a, (I3)
		call	ShiftDn		; Shifts the stack towards its base
		ld	a, (I1)		; And add I1-I3	zeros
		ld	hl, I3
		sub	(hl)
		ld	(I1), a
NumLit15:
		ld	a, (I1)
		or	a
		jp	z, NumLit16
		ld	(ix+0),	30h	; '0'
		inc	ix
		ld	hl, I1
		dec	(hl)
		jp	NumLit15
NumLit16:
		xor	a
		ld	(I3), a
		jp	NumLit22
NumLit17:
		ld	a, (I3)
		ld	hl, I1
		sub	(hl)
		ld	(I3), a
		ld	de, (PtrX1)
		ld	hl, (PtrX2)
		ld	a, (I1)
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		ld	hl, (PtrX1)
		ld	a, (I1)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(PtrX1), hl
		ld	(hl), 2Eh	; '.'
		jp	NumLit22
NumLit18:
		ld	a, (I1)
		or	a
		jp	z, NumLit22
		ld	a, (I2)		; Jump if integer digits < EXP
		ld	hl, I1
		cp	(hl)
		jp	c, NumLit20
		ld	hl, (PtrX2)
		ld	(PtrX1), hl
		dec	hl
		ld	(PtrX2), hl
		ld	a, (I1)
		ld	(IXT), a
		ld	a, (I3)
		or	a
		jp	nz, NumLit19
		ld	(ix+0),	0
		inc	ix
NumLit19:
		ld	hl, (PtrX1)
		ex	de, hl
		ld	hl, (PtrX2)
		ld	a, (IXT)
		call	CopyDn		; Copy A bytes from (DE)-(HL) down
		ld	(PtrX2), hl
		ex	de, hl
		ld	(PtrX1), hl
		ld	(hl), 2Eh	; '.'
		ld	a, (I2)
		ld	hl, I1
		sub	(hl)
		ld	(I2), a
		jp	NumLit21
NumLit20:
		ld	hl, (PtrX1)
		inc	hl
		ld	(PtrX),	hl
		ex	de, hl		; Shift	fraction over DP
		ld	hl, (PtrX1)
		ld	a, (I2)
		call	ShiftUp		; Shifts the stack towards the top
		ld	hl, (PtrX)
		ld	(PtrX2), hl
		ld	hl, I3
		add	a, (hl)
		ld	(IXT), a
		ld	a, (I1)
		ld	hl, I2
		sub	(hl)
		ld	(I4), a
		ld	hl, (PtrX2)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(PtrX2), hl
		ex	de, hl
		ld	a, (IXT)
		call	ShiftUp		; Shifts the stack towards the top
		ld	hl, (PtrX1)
		ld	(hl), 2Eh	; '.'
		inc	hl
		ld	(PtrX1), hl
		ld	b, 30h		; '0'
		ld	a, (I4)
		call	FillHLB		; Fills	A bytes	pointed	by (hl)	with B
		xor	a
		ld	(I2), a
NumLit21:
		ld	a, (I3)
		ld	hl, I1
		add	a, (hl)
		ld	(I3), a
		or	a
		jp	nz, NumLit6
NumLit22:
		ld	a, (bmActFlag)
		or	a
		jp	nz, NumLitEnd
		ld	a, (I3)
		or	a
		jp	z, NumLit23
		ld	hl, I3		; Include DP
		inc	(hl)
NumLit23:				; Total	size
		ld	a, (I3)
		ld	hl, I2
		add	a, (hl)
		ld	(I3), a
		or	a
		jp	nz, NumLit24
		ld	(ix+0),	30h	; '0'
		inc	ix
		ld	a, 1
		ld	(I3), a
NumLit24:
		ld	a, (I3)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
NumLitEnd:
		ld	a, (IT)
		ld	(Result), a
		ret
NumLitErr:				; b2:Routine not saved
		ld	a, (bmFlag1)
		and	00000001b
		jp	z, Error26	; Illegal numeric literal
		jp	NumLit22
; End of function NumLit
; =============== S U B	R O U T	I N E =======================================
; Check	for integer literal
IntLit:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (bmFlag1)	; b2:Routine not saved
		and	STRNG
		jp	nz, IntLit1
		ld	a, 255		; Set digit count
		ld	(I1), a
IntLit1:
		xor	a
		ld	(N), a
		ld	a, FALSE
		ld	(Result), a
		ld	a, (I1)
		or	a
		jp	z, IntLitEnd
		ld	a, (Token)	; Check	for digit
		cp	3		; Is it	'0' to '9'?
		jp	nz, IntLitEnd
		ld	a, TRUE		; It is	a digit
		ld	(Result), a
IntLit2:
		ld	a, (I1)
		or	a
		jp	z, IntLit6
		ld	a, (Delete)
		cp	FALSE
		jp	z, IntLit3
		ld	hl, (pStkPos)
		ld	a, (hl)
		cp	30h		; '0'
		jp	z, IntLit5
		ld	a, FALSE
		ld	(Delete), a
IntLit3:
		ld	a, (bmActFlag)
		or	a
		jp	nz, IntLit4
		ld	hl, (pStkPos)
		ld	a, (hl)
		ld	(ix+0),	a
		inc	ix
IntLit4:
		ld	hl, N
		inc	(hl)
IntLit5:
		ld	hl, I1
		dec	(hl)
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, (Token)
		cp	3		; Is it	'0' to '9'?
		jp	z, IntLit2
IntLit6:
		ld	a, (bmActFlag)
		or	a
		jp	nz, IntLitEnd
		ld	a, (N)
		or	a
		jp	nz, IntLit7
		ld	(ix+0),	30h	; '0'
		inc	ix
		ld	hl, N
		inc	(hl)
IntLit7:
		ld	a, (N)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
IntLitEnd:
		ld	a, 0
		ld	(Delete), a
		ret
; End of function IntLit
; =============== S U B	R O U T	I N E =======================================
sub_2616:
		ld	a, (bmActFlag)
		ld	(IOTemp2), a
		or	a
		jp	z, locret_2625
		ld	a, 2
		ld	(bmActFlag), a
locret_2625:
		ret
; End of function sub_2616
; =============== S U B	R O U T	I N E =======================================
; Clears bit 0 of bmActFlag
ClrAFB0:
		ld	hl, bmActFlag
		ld	a, 11111110b
		and	(hl)
		ld	(hl), a
		ret
; End of function ClrAFB0
; =============== S U B	R O U T	I N E =======================================
CheckTrueV:
		ld	a, (IOTemp2)
		or	a
		jp	z, Error35	; No true value	in $SELECT
		ret
; End of function CheckTrueV
; =============== S U B	R O U T	I N E =======================================
; Check	for a name literal
NameLit:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Token)
		cp	1		; Is it	'a' to 'z'?
		jp	z, NameLit1
		cp	2		; Is it	'A' to 'Z'?
		jp	z, NameLit1
		cp	13h		; Is it	'%'?
		jp	z, NameLit1
		ld	a, 0		; Not a	name
		ld	(Result), a
		ret
NameLit1:				; It is	a name
		ld	a, 1
		ld	(Result), a
		xor	a
		ld	(NameLen), a
		ld	(pName), ix
NameLit2:
		ld	a, (bmActFlag)
		or	a
		jp	nz, NameLit3
		ld	a, (NameLen)
		cp	8
		jp	z, NameLit3
		ld	hl, (pStkPos)
		ld	a, (hl)		; Push the character
		ld	(ix+0),	a
		inc	ix
		ld	hl, NameLen
		inc	(hl)
NameLit3:				; Get next token value
		call	GToken
		ld	a, (Token)
		or	a
		jp	z, NameLit4
		ld	a, 3
		ld	hl, Token
		cp	(hl)
		jp	c, NameLit4
		jp	NameLit2
NameLit4:
		ld	a, (bmActFlag)
		or	a
		jp	nz, NameLitEnd
		ld	a, (NameLen)	; Save name length
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
NameLitEnd:
		ret
; End of function NameLit
; =============== S U B	R O U T	I N E =======================================
; Check	for name indir during arg indir
AC16:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 1
		ld	(Case),	a
		ld	a, (bmActFlag)
		or	a
		jp	z, AC16End
		ld	a, (Token)
		cp	0FFh		; (todo) Check this
		jp	nz, AC16End
		ld	a, 4
		ld	(Case),	a
		ld	hl, (pStkPos)
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
AC16End:
		ret
; End of function AC16
; =============== S U B	R O U T	I N E =======================================
; Check	for a numeric label
NumLabel:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Token)
		cp	3		; Is it	'0' to '9'?
		jp	z, NumLabel1
		xor	a
		ld	(Result), a
		ret
NumLabel1:
		ld	a, 1
		ld	(Result), a
		xor	a
		ld	(Count), a
NumLabel2:
		ld	a, (bmActFlag)
		or	a
		jp	nz, NumLabel3
		ld	a, (Count)
		cp	8
		jp	z, NumLabel3
		ld	hl, (pStkPos)
		ld	a, (hl)
		ld	(ix+0),	a
		inc	ix
		ld	hl, Count
		inc	(hl)
NumLabel3:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		ld	a, (Token)
		cp	3		; Is it	'0' to '9'?
		jp	z, NumLabel2
		ld	a, (bmActFlag)
		or	a
		jp	nz, NumLabelE
		ld	a, (Count)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
NumLabelE:
		ret
; End of function NumLabel
; =============== S U B	R O U T	I N E =======================================
sub_2723:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (bmActFlag)
		or	a
		jp	nz, locret_27A0
		ld	a, 1
		ld	(SetFL), a
		dec	ix
		ld	a, (ix+0)
		ld	(IOTemp1), a
		call	sub_9789
		ld	(Ptr3),	hl
		ld	(pIndex), ix
		ld	de, (Ptr3)
		ld	hl, (pIndex)
		or	a
		sbc	hl, de
		dec	hl
		ld	(pIndex), hl
		ld	a, (hl)
		ld	(Count), a
		inc	hl
		ld	(Ptr), hl
		or	a
		jp	nz, loc_2764
		ld	hl, (pIndex)
		ld	(SetBs), hl
loc_2764:
		ld	hl, Count
		inc	(hl)
		ld	a, (IOTemp1)
		cp	1
		jp	z, loc_277C
		ld	hl, (Ptr)
		inc	hl
		ld	a, (hl)
		or	10000000b
		ld	(hl), a
		dec	hl
		ld	(Ptr), hl
loc_277C:
		ld	bc, (Ptr3)
		ld	hl, (pIndex)
		ex	de, hl
		ld	hl, (Ptr)
		call	sub_971B
		ld	(Ptr), hl
		ex	de, hl
		ld	(pIndex), hl
		ld	ix, (pIndex)
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Count)
		ld	(ix+0),	a
		inc	ix
locret_27A0:
		ret
; End of function sub_2723
; =============== S U B	R O U T	I N E =======================================
; Apply	unary operators, stack ExprAtom
ApplyUnOp:
		call	SSChk		; Check	for room on the	syntax stack
		xor	a
		ld	(byte_04E9), a
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(byte_04E7), a
		ld	(Ptr2),	ix
		ld	hl, (Ptr2)
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(Ptr2),	hl
		dec	hl
		ld	(Ptr3),	hl
		ld	a, (hl)
		ld	(ITX), a
		or	a
		jp	z, loc_288D
		ld	a, (byte_04E7)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		call	ExprToNum	; Convert expression to	numeric	value
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(byte_04E7), a
		ld	hl, (Ptr2)
		ld	a, (hl)
		cp	Minus
		jp	nz, loc_2802
		ld	a, 1
		ld	(byte_04E9), a
		ld	hl, byte_04E7
		dec	(hl)
		ld	hl, (Ptr2)
		inc	hl
		ld	(Ptr2),	hl
loc_2802:
		ld	hl, (Ptr3)
		dec	hl
		ld	(Ptr3),	hl
		xor	a
		ld	(byte_04EA), a
		ld	(Case),	a
loc_2810:
		ld	hl, (Ptr3)
		ld	a, (hl)
		ld	(N), a
		cp	5
		jp	z, loc_2856
		cp	6
		jp	nz, loc_282C
		ld	a, (byte_04E9)
		xor	00000001b
		ld	(byte_04E9), a
		jp	loc_2856
loc_282C:
		ld	a, (byte_04EA)
		cp	1
		jp	z, loc_284A
		ld	a, 1
		ld	(byte_04EA), a
		ld	a, (byte_04E7)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		call	ExpToTV		; Convert expression to	truth-value
loc_284A:
		ld	a, (Case)
		xor	00000001b
		ld	(Case),	a
		xor	a
		ld	(byte_04E9), a
loc_2856:
		ld	hl, ITX
		dec	(hl)
		ld	hl, (Ptr3)
		dec	hl
		ld	(Ptr3),	hl
		ld	a, (ITX)
		or	a
		jp	nz, loc_2810
		inc	hl
		ld	(Ptr3),	hl
		ld	a, (byte_04EA)
		cp	1
		jp	z, loc_289D
		ld	hl, (Ptr2)
		ld	a, (hl)
		cp	30h		; '0'
		jp	z, loc_289D
		ld	a, (byte_04E9)
		or	a
		jp	z, loc_288D
		ld	hl, (Ptr3)
		ld	(hl), Minus
		inc	hl
		ld	(Ptr3),	hl
loc_288D:
		ld	hl, (Ptr3)
		ex	de, hl
		ld	hl, (Ptr2)
		ld	a, (byte_04E7)
		call	ShiftDn		; Shifts the stack towards its base
		jp	loc_28CF
loc_289D:
		ld	ix, (Ptr3)
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 1
		ld	(byte_04E7), a
		ld	a, (Case)
		or	a
		jp	z, loc_28C6
		ld	a, (byte_04E9)
		or	a
		jp	z, loc_28BD
		ld	(ix+0),	Minus
		inc	ix
loc_28BD:				; '1'
		ld	(ix+0),	31h
		inc	ix
		jp	loc_28CF
loc_28C6:				; '0'
		ld	(ix+0),	30h
		inc	ix
		jp	loc_28DA
loc_28CF:
		ld	a, (byte_04E9)
		or	a
		jp	z, loc_28DA
		ld	hl, byte_04E7
		inc	(hl)
loc_28DA:
		ld	a, (byte_04E7)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ret
; End of function ApplyUnOp
; =============== S U B	R O U T	I N E =======================================
; Zero Top of Stack
ZeroToS:
		ld	(ix+0),	0
		inc	ix
		ret
; End of function ZeroToS
; =============== S U B	R O U T	I N E =======================================
; Body of $JUSTIFY function
bfJustify:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, ibcdTemp1
		call	StrToInt	; Converts string on ToS to integer
		ld	a, (Result)
		cp	1
		jp	z, loc_298D
		call	Null1
loc_2904:
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(IT), a
		ld	hl, ibcdTemp1
		ld	a, (hl)
		and	11110000b
		jp	nz, loc_297E
		ld	hl, ibcdTemp0
		ld	a, (IT)
		call	sub_9535
		ld	de, ibcdTemp1
		call	SCmp0		; Compares two strings (sets BC=INTLN*257 first)
		jp	c, loc_297E
		jp	z, loc_297E
		ld	hl, ibcdTemp1
		ld	de, ibcdTemp0
		ld	c, 5
		call	SbcdDEHL	; Subtracts two	C bytes	long BCDs pointed by (DE) and (HL)
					; result goes in the BCD pointed by (HL)
		call	IntToChar	; Integer to char (0-255)
		ld	(N), a
		ld	a, (Result)
		cp	0
		jp	z, Error20	; Illegal expression
		ld	(Ptr1),	ix
		ld	hl, (Ptr1)
		ld	a, (IT)
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(Ptr1),	hl
		ld	a, (N)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(Ptr2),	hl
		ex	de, hl
		ld	hl, (Ptr1)
		ld	a, (IT)
		call	ShiftUp		; Shifts the stack towards the top
		ld	hl, N
		add	a, (hl)
		ld	(IT), a
		ld	hl, (Ptr1)
		ld	b, Space
		ld	a, (N)
		call	FillHLB		; Fills	A bytes	pointed	by (hl)	with B
loc_297E:
		ld	a, (IT)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ret
loc_298D:
		ld	hl, ibcdUnk02
		call	StrToInt	; Converts string on ToS to integer
		call	ExprToNum	; Convert expression to	numeric	value
		ld	hl, ibcdTemp1
		ld	a, (hl)
		and	11110000b
		jp	nz, Error30	; Unimplemented	operation
		call	IntToChar	; Integer to char (0-255)
		ld	(I6), a
		ld	a, (Result)
		cp	0
		jp	z, Error20	; Illegal expression
		ld	a, 1
		ld	(DollarJ), a
		call	sub_935C
		xor	a
		ld	(DollarJ), a
		ld	de, ibcdTemp1
		ld	hl, ibcdUnk02
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		jp	loc_2904
; End of function bfJustify
; =============== S U B	R O U T	I N E =======================================
sub_29C5:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_50FE
		ld	hl, (Ptr)
		ld	(Ptr2),	hl
		ld	(Ptr3),	hl
		ld	a, (hl)
		ld	(GLB), a
		dec	hl
		ld	a, (hl)
		ld	(SetSW), a
		dec	hl
		ld	a, (hl)
		ld	(NR), a
		dec	hl
		ld	a, (hl)
		ld	(IndFL), a
		ld	bc, -(PTRLN)
		add	hl, bc
		ld	(Ptr2),	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(Ptr1),	hl
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
		call	sub_4F6E
		ld	a, (Result)
		cp	0
		jp	z, loc_2A18
		ld	hl, StrLen
		inc	(hl)
		ld	hl, (Ptr3)
		ld	a, (IT)
		ld	(hl), a
		jp	loc_2A1F
loc_2A18:
		ld	hl, (Ptr3)
		inc	hl
		ld	(Ptr3),	hl
loc_2A1F:
		ld	a, (StrLen)
		or	a
		jp	nz, loc_2A2E
		ld	a, (bFlagOrder)
		cp	1
		jp	nz, Error47	; Invalid subscript
loc_2A2E:
		ld	hl, (Ptr2)
		ld	de, (Ptr1)
		or	a
		sbc	hl, de
		ld	(Ptr), hl
		inc	(hl)
		ld	hl, (Ptr2)
		ld	a, (StrLen)
		ld	(hl), a
		inc	hl
		ld	(Ptr2),	hl
		ex	de, hl
		ld	hl, (Ptr3)
		call	ShiftDn		; Shifts the stack towards its base
		ld	hl, (Ptr1)
		ld	c, a
		ld	b, 0
		add	hl, bc
		inc	hl
		ld	(Ptr1),	hl
		call	sub_97BE
		ret
; End of function sub_29C5
; =============== S U B	R O U T	I N E =======================================
; Body of ZSAVE	<name> command
bczSaveN:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, TRtnName	; Temp routine name storage
		call	sub_97A2
		ld	hl, TRtnName	; Temp routine name storage
		call	sub_97D5
		ld	a, (RoutinesDR)
		ld	(Drive), a
		ld	a, 1
		ld	(FCBType), a	; 0:Global, 1:Routine, 2:File
		call	FFirst		; Find first file
		ld	a, (Result)
		cp	1
		jp	nz, bczSaveN1
		ld	a, (bmFlag1)	; b2:Routine not saved
		and	00000100b
		jp	z, Error41	; Routine already in library
		call	FDelete		; Delete file
bczSaveN1:				; Save routine
		call	SaveRtn
		ld	hl, bmFlag1	; b2:Routine not saved
		ld	a, 11111011b	; Marks	bit 2 as routine saved
		and	(hl)
		ld	(hl), a
		ld	hl, (pRtnName)
		ex	de, hl
		ld	hl, TRtnName	; Temp routine name storage
		call	CopyHLDE	; Copy (HL) bytes from (HL) to (DE)
		ret
; End of function bczSaveN
; =============== S U B	R O U T	I N E =======================================
PrintCRLF:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 0Dh
		ld	(tmpChar), a
		call	writeChar	; Outputs the character	on A to	the current IODevice
		ld	a, 0Ah
		ld	(tmpChar), a
		call	writeChar	; Outputs the character	on A to	the current IODevice
		ld	hl, (pDevX)
		ld	de, ibcdV0
		call	Copy5DEHL	; Copy 5 bytes from (DE) to (HL) ; SetI
		ld	hl, (pDevY)
		ld	de, ibcdV1
		ld	c, 5
		call	AbcdDEHL	; Adds two C bytes long	BCDs pointed by	(DE) and (HL)
					; result goes in the BCD pointed by (HL)
		ret
; End of function PrintCRLF
; =============== S U B	R O U T	I N E =======================================
PrintFF:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 0Dh
		ld	(tmpChar), a
		call	writeChar	; Outputs the character	on A to	the current IODevice
		ld	a, (IODevice)
		or	a
		jp	nz, PrintFF2
		ld	hl, ClrScrSize
		ld	(Ptr), hl
		ld	a, (hl)
		ld	(IT), a
PrintFF1:
		ld	hl, (Ptr)
		inc	hl
		ld	(Ptr), hl
		ld	a, (hl)
		ld	(tmpChar), a
		call	writeChar	; Outputs the character	on A to	the current IODevice
		ld	hl, IT
		dec	(hl)
		ld	a, (IT)
		or	a
		jp	nz, PrintFF1
		jp	PrintFF3
PrintFF2:
		ld	a, 0Ch
		ld	(tmpChar), a
		call	writeChar	; Outputs the character	on A to	the current IODevice
PrintFF3:
		ld	hl, (pDevX)
		ld	de, ibcdV0
		call	Copy5DEHL	; Copy 5 bytes from (DE) to (HL) ; SetI
		ld	hl, (pDevY)
		ld	de, ibcdV0
		call	Copy5DEHL	; Copy 5 bytes from (DE) to (HL) ; SetI
		ret
; End of function PrintFF
; =============== S U B	R O U T	I N E =======================================
sub_2B1D:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ret
; End of function sub_2B1D
; =============== S U B	R O U T	I N E =======================================
sub_2B35:
		call	SSChk		; (todo) Remove	this
		ld	hl, 0
		ld	(Ptr), hl
		call	sub_97BE
		ret
; End of function sub_2B35
; =============== S U B	R O U T	I N E =======================================
; Outputs horizontal spacing (W	?x or R	?x)
HSPC:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
		ld	a, (hl)
		and	11110000b
		jp	nz, HSPCEnd
		ld	hl, (pDevX)
		ld	de, ibcdTemp0
		call	SCmp0		; Compares two strings (sets BC=INTLN*257 first)
		jp	c, HSPCEnd
		jp	z, HSPCEnd
		ld	de, ibcdTemp1
		ld	hl, ibcdTemp0
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		ld	hl, (pDevX)
		ld	de, ibcdTemp0
		ex	de, hl
		ld	c, 5
		call	SbcdDEHL	; Subtracts two	C bytes	long BCDs pointed by (DE) and (HL)
					; result goes in the BCD pointed by (HL)
		ld	hl, (pDevX)
		ld	de, ibcdTemp1
		call	Copy5DEHL	; Copy 5 bytes from (DE) to (HL) ; SetI
HSPC1:
		ld	hl, ibcdTemp0
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, HSPCEnd
		ld	c, 5
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		ld	a, Space
		ld	(tmpChar), a
		call	writeChar	; Outputs the character	on A to	the current IODevice
		jp	HSPC1
HSPCEnd:
		ret
; End of function HSPC
; =============== S U B	R O U T	I N E =======================================
; Sets bit 0 of	bmActFlag
SetAFb0:
		ld	hl, bmActFlag
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ret
; End of function SetAFb0
; =============== S U B	R O U T	I N E =======================================
; Body of ZSAVE	command
bczSave:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (pRtnName)
		ld	a, (hl)
		or	a
		jp	z, Error40	; Routine is unnamed
		call	sub_97D5
		ld	a, (RoutinesDR)
		ld	(Drive), a
		ld	a, 1
		ld	(FCBType), a	; 0:Global, 1:Routine, 2:File
		call	FFirst		; Find first file
		ld	a, (Result)
		cp	1
		jp	nz, bczSave1
		ld	a, (bmFlag1)	; b2:Routine not saved
		and	00000100b
		jp	z, bczSaveE
		call	FDelete		; Delete file
bczSave1:				; Save routine
		call	SaveRtn
		ld	hl, bmFlag1	; b2:Routine not saved
		ld	a, 11111011b	; Marks	bit 2 as routine saved
		and	(hl)
		ld	(hl), a
bczSaveE:
		ret
; End of function bczSave
; =============== S U B	R O U T	I N E =======================================
; Convert expression to	truth-value
ExpToTV:
		call	SSChk		; Check	for room on the	syntax stack
		call	ExprToNum	; Convert expression to	numeric	value
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(N), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ld	(TPP), ix
		ld	hl, (TPP)
		ld	a, (hl)
		cp	30h		; '0'
		jp	z, ExpToTV1
		ld	a, 1		; Return true
		ld	(Case),	a
		ret
ExpToTV1:				; Return false
		xor	a
		ld	(Case),	a
		ret
; End of function ExpToTV
; =============== S U B	R O U T	I N E =======================================
; Convert expression to	integer
ExprToInt:
		call	SSChk		; Check	for room on the	syntax stack
		call	ExprToNum	; Convert expression to	numeric	value
		xor	a		; It's an integer
		ld	(IT), a
		call	MkStr		; Make number into a string
		ret
; End of function ExprToInt
; =============== S U B	R O U T	I N E =======================================
Null1:
		ret
; End of function Null1
; =============== S U B	R O U T	I N E =======================================
; Convert expression to	numeric	value
ExprToNum:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 1
		ld	(IT), a
		call	MkStr		; Make number into a string
		ret
; End of function ExprToNum
; =============== S U B	R O U T	I N E =======================================
; Push a 1 in the stack
PushOne:
		ld	(ix+0),	1
		inc	ix
		ret
; End of function PushOne
; =============== S U B	R O U T	I N E =======================================
; Body of $ASCII function
bfAscii:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 1
		ld	(N), a
		ld	a, (Result)	; No integer
		cp	FALSE
		jp	z, bfAscii1
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
		ld	a, (hl)
		and	11110000b
		jp	nz, bfAscii2
		call	IntToChar	; Integer to char (0-255)
		ld	(N), a
		ld	a, (Result)
		cp	FALSE
		jp	z, bfAscii2
		ld	a, (N)
		or	a
		jp	z, bfAscii2
bfAscii1:
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
		or	a
		jp	z, bfAscii3
		ld	hl, N
		cp	(hl)
		jp	c, bfAscii3
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, N
		dec	(hl)
		ld	(Ptr), ix
		ld	hl, (Ptr)
		ld	a, (N)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(Ptr), hl
		ld	a, (hl)
		ld	(N), a
		ld	a, (N)
		call	IntToStr
		ret
bfAscii2:
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
bfAscii3:
		ld	a, (StrLen)
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, Minus1
		call	sub_97D5
		ret
; End of function bfAscii
; =============== S U B	R O U T	I N E =======================================
; View a list of local vars
ShowVars:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (pSymbolTbl)
		ld	de, 2
		add	hl, de
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, 5
		or	a
		sbc	hl, de
		jp	z, ShowVarsE
		ld	hl, (VarPtr)	; Points to a var in the symbol	table
		ld	(word_02B0), hl
		ld	de, 2
		add	hl, de
		ld	a, (hl)
		ld	(byte_04CC), a
		inc	hl
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ld	a, (hl)
		ld	(StrLen), a
		ld	(IT), a
		ld	hl, IT
		inc	(hl)
ShowVars1:
		ld	de, VarName
		ld	hl, (VarPtr)	; Points to a var in the symbol	table
		ld	a, (IT)
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		ld	a, (byte_04CC)
		or	a
		jp	nz, ShowVars2
		ld	hl, (word_02B0)
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	de, 3
		add	hl, de
		ld	(Ptr), hl
		ld	hl, VarName
		ld	(word_0274), hl
		ld	hl, (Ptr)
		ex	de, hl
		ld	hl, (word_0274)
		call	sub_967C
		jp	nz, ShowVars3
		ld	(word_0274), hl
		ex	de, hl
		ld	(Ptr), hl
ShowVars2:
		ld	(ix+0),	Asterisk
		inc	ix
		jp	ShowVars4
ShowVars3:
		ld	(ix+0),	Space
		inc	ix
ShowVars4:				; Points to a var in the symbol	table
		ld	hl, (VarPtr)
		inc	hl
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ld	a, (StrLen)
		call	sub_97B3
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ld	a, 14
		ld	hl, StrLen
		sub	(hl)
		ld	(I1), a
ShowVars5:
		ld	(ix+0),	Space
		inc	ix
		ld	hl, I1
		dec	(hl)
		ld	a, (I1)
		or	a
		jp	nz, ShowVars5
		ld	(ix+0),	0Fh
		inc	ix
		ld	(ix+0),	3
		inc	ix
		call	Write
		ld	a, (byte_04CC)
		or	a
		jp	nz, ShowVars6
		ld	(ix+0),	Quotes
		inc	ix
		ld	(ix+0),	1
		inc	ix
		ld	(ix+0),	3
		inc	ix
		call	Write
		ld	hl, (VarPtr)	; Points to a var in the symbol	table
		call	sub_97D5
		call	Write
		ld	(ix+0),	Quotes
		inc	ix
		ld	(ix+0),	1
		inc	ix
		ld	(ix+0),	3
		inc	ix
		call	Write
ShowVars6:
		call	PrintCRLF
		ld	a, (byte_04CC)
		or	a
		jp	z, ShowVars8
ShowVars7:
		ld	a, (ViewParam)
		or	a
		jp	z, ShowVars8
		call	sub_67BD
ShowVars8:
		ld	hl, (word_02B0)
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (VarPtr)	; Points to a var in the symbol	table
		add	hl, de
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, 5
		or	a
		sbc	hl, de
		jp	z, ShowVarsE
		ld	hl, VarName
		ld	(word_0274), hl
		ld	hl, (VarPtr)	; Points to a var in the symbol	table
		ld	(word_02B0), hl
		ld	de, 2
		add	hl, de
		ld	a, (hl)
		ld	(byte_04CC), a
		inc	hl
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ld	a, (hl)
		ld	(StrLen), a
		ld	(IT), a
		ld	hl, IT
		inc	(hl)
		ld	hl, (word_0274)
		ex	de, hl
		ld	hl, (VarPtr)	; Points to a var in the symbol	table
		ld	a, (IT)
		ld	c, a
		call	JSE		; Compare C bytes long strings pointed by (DE) and (HL)
		jr	nz, ShowVars9
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ex	de, hl
		ld	(word_0274), hl
		jp	ShowVars7
ShowVars9:
		jp	ShowVars1
ShowVarsE:
		ret
; End of function ShowVars
; =============== S U B	R O U T	I N E =======================================
; Body of $DATA	function
bfData:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		ld	a, (ix+0)
		ld	(IT), a
		call	sub_50CC
		xor	a
		ld	(II), a
		ld	a, (IT)		; Global or Local
		cp	1
		jp	nz, loc_2E87
		call	sub_6A99
		ld	a, (Result)
		cp	0
		jp	z, loc_2E5F
		ld	a, 1
		ld	(II), a
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
loc_2E5F:
		call	sub_6A25
		ld	a, (Result)
		cp	0
		jp	z, loc_2E79
loc_2E6A:
		ld	a, (I5)
		or	a
		jp	nz, loc_2E79
		ld	a, (II)
		add	a, 0Ah
		ld	(II), a
loc_2E79:
		ld	ix, (word_02A4)
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (II)
		call	IntToStr
		ret
loc_2E87:
		call	sub_70A8
		call	FindKey		; Find place for a key
		ld	a, (Result)
		cp	0
		jp	z, loc_2E79
		call	sub_6CE3
		ld	a, (Result)
		or	a
		jp	z, loc_2EB3
		ld	a, 1
		ld	(II), a
		ld	hl, (Ptr)
		ld	c, (hl)
		ld	b, 0
		add	hl, bc
		ld	(Ptr), hl
		ld	a, 0
		ld	(Result), a
loc_2EB3:
		call	sub_71EA
		ld	a, (Result)
		cp	0
		jp	z, loc_2E79
		ld	a, (byte_04CC)
		ld	(I5), a
		ld	hl, (word_A640)
		ex	de, hl
		ld	hl, (Ptr)
		call	sub_96C0
		ld	(I5), a
		ld	(word_027E), hl
		jp	loc_2E6A
; End of function bfData
; =============== S U B	R O U T	I N E =======================================
; Body of VIEW command
bcView:
		call	SSChk		; Check	for room on the	syntax stack
		call	StrToChar	; Converts a string on ToS to char (0-255)
		ld	(I1), a
		ld	a, (Result)
		cp	0
		jp	z, Error20	; Illegal expression
		ld	a, (I1)
		or	a
		jp	nz, bcView1
		xor	a
		ld	(ViewParam), a
		call	ShowVars	; View a list of local vars
		jp	cbViewE
bcView1:
		ld	a, (I1)
		cp	1
		jp	nz, bcView2
		ld	a, 1
		ld	(ViewParam), a
		call	ShowVars	; View a list of local vars
		jp	cbViewE
bcView2:
		ld	a, (I1)
		cp	2
		jp	nz, bcView3
		call	ShowGlb		; View a list os globals
		jp	cbViewE
bcView3:
		ld	a, (I1)
		cp	3
		jp	nz, bcView4
		ld	hl, mmpFCB	; FCB for listing *.MMP	(view 3)
		ld	(Ptr1),	hl
		call	ShowFiles
		jp	cbViewE
bcView4:
		ld	a, (I1)
		cp	4
		jp	nz, Error30	; Unimplemented	operation
		ld	hl, fileFCB	; FCB for listing *.* (view 4)
		ld	(Ptr1),	hl
		call	ShowFiles
cbViewE:
		ret
; End of function bcView
; =============== S U B	R O U T	I N E =======================================
; Body of $EXTRACT function
bfExtract:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Case)
		cp	1
		jp	nz, bfExtract1
		ld	de, ibcdTemp0
		ld	hl, ibcdV1
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		ld	a, 0
		ld	(Result), a
		jp	bfExtract2
bfExtract1:
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
bfExtract2:
		ld	de, ibcdTemp1
		ld	hl, ibcdTemp0
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		ld	a, (Result)
		cp	0
		jp	z, bfExtract3
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
bfExtract3:
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ld	(Ptr), ix
		ld	hl, ibcdUnk02
		ld	a, (StrLen)
		call	sub_9535
		ld	hl, ibcdTemp0
		ld	a, (hl)
		and	11110000b
		jp	nz, bfExtract4
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, bfExtract4
		ld	hl, ibcdTemp1
		ld	a, (hl)
		and	11110000b
		jp	nz, bfExtract7
		jp	bfExtract5
bfExtract4:
		ld	a, (Result)
		or	a
		jp	z, bfExtract7
		ld	de, ibcdTemp0
		ld	hl, ibcdV1
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
bfExtract5:
		ld	hl, ibcdUnk02
		ld	de, ibcdTemp1
		call	SCmp0		; Compares two strings (sets BC=INTLN*257 first)
		jp	c, bfExtract6
		ld	de, ibcdTemp1
		ld	hl, ibcdUnk02
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
bfExtract6:
		ld	hl, ibcdTemp0
		ld	de, ibcdTemp1
		call	SCmp0		; Compares two strings (sets BC=INTLN*257 first)
		jp	c, bfExtract7
		call	IntToChar	; Integer to char (0-255)
		ld	(I1), a
		ld	hl, ibcdTemp1
		call	IntToChar	; Integer to char (0-255)
		ld	(I2), a
		ld	hl, I1
		dec	(hl)
		ld	a, (I2)
		sub	(hl)
		ld	(I2), a
		ld	hl, (Ptr)
		ld	a, (I1)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(Ptr), hl
		ld	(TPP), ix
		ld	hl, (TPP)
		ex	de, hl
		ld	hl, (Ptr)
		ld	a, (I2)
		call	ShiftDn		; Shifts the stack towards its base
bfExtractEnd:
		ld	a, (I2)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ret
bfExtract7:
		xor	a
		ld	(I2), a
		jp	bfExtractEnd
; End of function bfExtract
; =============== S U B	R O U T	I N E =======================================
; Body of $FIND	function
bfFind:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Result)
		cp	1
		jp	z, bfFind2
bfFind1:
		ld	de, ibcdTemp0
		ld	hl, ibcdV1
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		jp	bfFind3
bfFind2:
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
		ld	a, (hl)
		and	11110000b
		jp	nz, bfFind1
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, bfFind1
bfFind3:
		ld	hl, ibcdTemp0
		call	IntToChar	; Integer to char (0-255)
		ld	(N), a
		ld	a, (Result)
		cp	0
		jp	z, bfFind4
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I2), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ld	(Ptr2),	ix
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I1), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ld	(Ptr1),	ix
		ld	a, (I2)
		or	a
		jp	z, bfFindEnd
		ld	a, (I1)
		ld	hl, N
		cp	(hl)
		jp	c, bfFind5
		ld	hl, N
		dec	(hl)
		ld	hl, (Ptr1)
		ld	a, (N)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(Ptr1),	hl
		ld	a, (I1)
		ld	hl, N
		sub	(hl)
		ld	(I1), a
		ld	hl, (Ptr2)
		ex	de, hl
		ld	hl, (Ptr1)
		ld	b, a
		ld	a, (I2)
		call	sub_95A6
		ld	(Ptr1),	hl
		ld	(I3), a
		ld	a, (Result)
		cp	0
		jp	z, bfFind5
		ld	hl, ibcdTemp1
		ld	a, (I3)
		call	sub_9535
		ld	hl, ibcdTemp0
		ld	de, ibcdTemp1
		ld	c, 5
		call	AbcdDEHL	; Adds two C bytes long	BCDs pointed by	(DE) and (HL)
					; result goes in the BCD pointed by (HL)
		jp	bfFindEnd
bfFind4:
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I2), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I2), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
bfFind5:
		ld	de, ibcdTemp0
		ld	hl, ibcdV0
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
bfFindEnd:
		ld	hl, ibcdTemp0
		call	CharToStr	; Convert char (0-255) to string
		ret
; End of function bfFind
; =============== S U B	R O U T	I N E =======================================
; Body of $LENGTH function
bfLength:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Result)
		cp	1
		jp	z, bfLength2
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
bfLength1:
		ld	a, (StrLen)
		call	IntToStr
		ret
bfLength2:
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I2), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ld	(Ptr2),	ix
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I1), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ld	(Ptr1),	ix
		xor	a
		ld	(StrLen), a
		ld	a, (I2)
		or	a
		jp	z, bfLength1
bfLength3:
		ld	hl, (Ptr2)
		ex	de, hl
		ld	hl, (Ptr1)
		ld	a, (I1)
		ld	b, a
		ld	a, (I2)
		call	sub_95A6
		ld	(Ptr1),	hl
		ld	(I3), a
		ld	hl, StrLen
		inc	(hl)
		ld	a, (Result)
		cp	0
		jp	z, bfLength1
		ld	a, (I1)
		ld	hl, I3
		sub	(hl)
		ld	(I1), a
		jp	bfLength3
; End of function bfLength
; =============== S U B	R O U T	I N E =======================================
sub_31CA:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, bmFlag1	; b2:Routine not saved
		ld	a, 11111101b
		and	(hl)
		ld	(hl), a
		call	sub_50FE
		ld	hl, (Ptr)
		ld	a, (hl)
		ld	(I6), a
		ld	(Ptr2),	hl
		cp	32h		; '2'
		jp	c, loc_31F5
		ld	hl, bmFlag1	; b2:Routine not saved
		ld	a, (hl)
		or	00000010b
		ld	(hl), a
		ld	a, (I6)
		sub	32h		; '2'
		ld	(I6), a
loc_31F5:
		ld	a, 0Eh
		ld	hl, I6
		cp	(hl)
		jp	c, loc_3204
		call	ExprToNum	; Convert expression to	numeric	value
		jp	loc_3207
loc_3204:
		call	Null1
loc_3207:
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I2), a
		ld	hl, (Ptr2)
		ld	(Ptr1),	hl
		inc	hl
		ld	(Ptr2),	hl
		ld	hl, (Ptr1)
		dec	hl
		dec	hl
		ld	a, (hl)
		ld	(I1), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(Ptr1),	hl
		ld	a, 0Eh
		ld	hl, I6
		cp	(hl)
		jp	c, loc_3273
		ld	ix, (Ptr1)
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_8B6A
		ret
loc_3241:				; b2:Routine not saved
		ld	a, (bmFlag1)
		and	00000010b
		jp	nz, loc_3259
loc_3249:				; '1'
		ld	a, 31h
		ld	(tmpChar), a
		jp	loc_325E
loc_3251:				; b2:Routine not saved
		ld	a, (bmFlag1)
		and	00000010b
		jp	nz, loc_3249
loc_3259:				; '0'
		ld	a, 30h
		ld	(tmpChar), a
loc_325E:
		ld	a, (tmpChar)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	1
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ret
loc_3273:
		ld	a, (I6)
		cp	12h
		jp	z, loc_32ED
		ld	ix, (Ptr1)
		call	SSChk		; Check	for room on the	syntax stack
		cp	0Fh
		jp	nz, loc_32A9
		ld	hl, (Ptr2)
		ex	de, hl
		ld	hl, (Ptr1)
		ld	a, (I1)
		ld	b, a
		ld	a, (I2)
		call	sub_95A6
		ld	(Ptr1),	hl
		ld	(I3), a
		ld	a, (Result)
		cp	0
		jp	nz, loc_3241
		jp	loc_3251
loc_32A9:
		ld	a, (I6)
		cp	10h
		jp	nz, loc_32C9
		ld	hl, (Ptr2)
		ex	de, hl
		ld	hl, (Ptr1)
		ld	a, (I2)
		ld	c, a
		ld	a, (I1)
		ld	b, a
		call	SCmp		; Compares two strings
		jp	c, loc_3241
		jp	loc_3251
loc_32C9:
		ld	a, (I1)
		ld	hl, I2
		cp	(hl)
		jp	nz, loc_3251
		ld	hl, (Ptr1)
		ex	de, hl
		ld	hl, (Ptr2)
		ld	c, a
		call	JSE		; Compare C bytes long strings pointed by (DE) and (HL)
		jr	nz, loc_32EA
		ld	(Ptr2),	hl
		ex	de, hl
		ld	(Ptr1),	hl
		jp	loc_3241
loc_32EA:
		jp	loc_3251
loc_32ED:
		ld	hl, ibcdTemp0
		ld	a, (I1)
		call	sub_9535
		ld	hl, ibcdTemp1
		ld	a, (I2)
		call	sub_9535
		ld	hl, ibcdTemp0
		ld	de, ibcdTemp1
		ld	c, 5
		call	AbcdDEHL	; Adds two C bytes long	BCDs pointed by	(DE) and (HL)
					; result goes in the BCD pointed by (HL)
		call	IntToChar	; Integer to char (0-255)
		ld	(N), a
		ld	a, (Result)
		cp	0
		jp	z, Error11	; String too long
		ld	hl, (Ptr2)
		ld	bc, 0FFFDh
		add	hl, bc
		ld	(Ptr1),	hl
		ex	de, hl
		ld	hl, (Ptr2)
		ld	a, (I2)
		call	ShiftDn		; Shifts the stack towards its base
		ld	a, (N)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ret
; End of function sub_31CA
; =============== S U B	R O U T	I N E =======================================
sub_333B:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (RoutinesDR)
		add	a, 41h		; 'A'
		ld	(RDrLetter), a
		ld	hl, sRoutinesOn
		call	sub_97D5
		call	Write
		call	PrintCRLF
		ld	a, (GlobalsDR)
		add	a, 41h		; 'A'
		ld	(GDrLetter), a
		ld	hl, sGlobalsOn
		call	sub_97D5
		call	Write
		call	PrintCRLF
		ret
; End of function sub_333B
; =============== S U B	R O U T	I N E =======================================
sub_3367:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_52E3
		ld	a, (Result)
		cp	1
		jp	z, loc_3379
		xor	a
		ld	(byte_0546), a
loc_3379:
		ld	ix, (word_050E)
		call	SSChk		; Check	for room on the	syntax stack
		ld	de, (word_050E)
		ld	hl, (word_050C)
		ld	a, (byte_0546)
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		ld	a, (byte_0546)
		ld	c, a
		ld	b, 0
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ret
; End of function sub_3367
; =============== S U B	R O U T	I N E =======================================
; Body of $CHAR	function
bfChar:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
		dec	ix
		ld	a, (ix+0)
		ld	(Count), a
		ld	a, (hl)
		and	11110000b
		jp	nz, bfCharEnd
		call	IntToChar	; Integer to char (0-255)
		ld	(N), a
		ld	hl, Count
		inc	(hl)
		ld	a, (N)
		ld	(ix+0),	a
		inc	ix
bfCharEnd:
		ld	a, (Count)
		ld	(ix+0),	a
		inc	ix
		ret
; End of function bfChar
; =============== S U B	R O U T	I N E =======================================
sub_33D6:
		call	SSChk		; Check	for room on the	syntax stack
		xor	a
		ld	(STCnt), a
		ld	a, (SetFL)
		cp	1
		jp	z, loc_3412
		ld	a, (byte_0548)
		or	a
		jp	nz, Error18	; Illegal character
		ld	a, 1
		ld	(STCnt), a
		ld	hl, (Ptr)
		ld	bc, 0FFFEh
		add	hl, bc
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(pIndex), hl
		ld	de, (pIndex)
		ld	hl, (Ptr)
		or	a
		sbc	hl, de
		ld	(Ptr), hl
		ld	(SetBs), hl
loc_3412:
		ld	hl, (word_A049)
		ld	de, 0
		or	a
		sbc	hl, de
		jp	nz, loc_3657
		ld	hl, (SetBs)
		ld	a, (hl)
		cp	Dollar
		jp	z, loc_3689
		xor	a
		ld	(NR), a
		ld	(Ptr), ix
		ld	hl, (Ptr)
		dec	hl
		dec	hl
		ld	a, (hl)
		ld	(byte_A694), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(Ptr), hl
		ld	(word_02F4), hl
		dec	hl
		ld	(Ptr), hl
		ld	a, (byte_A6A4)
		cp	1
		jp	nz, loc_351A
		ld	a, 1
		ld	(byte_0549), a
		call	sub_5198
		ld	a, (Result)
		cp	0
		jp	z, loc_3510
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I2), a
		ld	hl, ibcdTemp1
		call	sub_9535
		ld	a, (byte_A694)
		ld	hl, byte_0546
		cp	(hl)
		jp	c, loc_34C7
		ld	hl, byte_0546
		sub	(hl)
		ld	(I3), a
		ld	hl, ibcdUnk02
		call	sub_9535
		ld	hl, ibcdTemp1
		ld	de, ibcdUnk02
		ld	c, 5
		call	AbcdDEHL	; Adds two C bytes long	BCDs pointed by	(DE) and (HL)
					; result goes in the BCD pointed by (HL)
		call	IntToChar	; Integer to char (0-255)
		ld	(I2), a
		ld	a, (Result)
		cp	0
		jp	z, Error11	; String too long
		ld	hl, (word_050A)
		ld	a, (I3)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(Ptr3),	hl
		ex	de, hl
		ld	hl, (word_050A)
		ld	a, (byte_0547)
		call	ShiftUp		; Shifts the stack towards the top
		ld	de, (word_050C)
		ld	hl, (word_02F4)
		ld	a, (byte_A694)
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		jp	loc_3502
loc_34C7:
		ld	de, (word_050C)
		ld	hl, (word_02F4)
		ld	a, (byte_A694)
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		ld	hl, (word_050C)
		ld	a, (byte_A694)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(word_050C), hl
		ld	a, (byte_0546)
		ld	hl, byte_A694
		sub	(hl)
		ld	(byte_0546), a
		ld	a, (I2)
		ld	hl, byte_0546
		sub	(hl)
		ld	(I2), a
		ld	hl, (word_050C)
		ex	de, hl
		ld	hl, (word_050A)
		ld	a, (byte_0547)
		call	ShiftDn		; Shifts the stack towards its base
loc_3502:
		ld	a, (I2)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
loc_3510:
		xor	a
		ld	(byte_0549), a
		ld	(byte_A6A4), a
		jp	loc_3412
loc_351A:
		ld	a, (STCnt)
		or	a
		jp	nz, loc_3528
		ld	hl, (Ptr)
		ld	a, (hl)
		ld	(STCnt), a
loc_3528:
		ld	hl, (SetBs)
		ld	(Ptr), hl
loc_352E:
		ld	hl, (Ptr)
		ld	a, (hl)
		ld	(byte_04CC), a
		inc	hl
		ld	(Ptr), hl
		ld	(word_02F2), hl
		ld	a, (hl)
		ld	(NameLen), a
		xor	a
		ld	(I1), a
		ld	a, (NameLen)
		and	10000000b
		jp	z, loc_355F
		ld	a, 1
		ld	(I1), a
		ld	hl, NameLen
		ld	a, 01111111b
		and	(hl)
		ld	(hl), a
		ld	hl, (Ptr)
		ld	a, (NameLen)
		ld	(hl), a
loc_355F:
		ld	hl, (Ptr)
		ld	c, (hl)
		ld	b, 0
		add	hl, bc
		inc	hl
		ld	(Ptr), hl
		ld	(word_A640), hl
		ld	a, (byte_04CC)
		ld	(IT), a
		ld	a, 3
		ld	(byte_A695), a
loc_3578:
		ld	a, (IT)
		or	a
		jp	z, loc_35A9
		ld	hl, (Ptr)
		ld	a, (hl)
		ld	(I4), a
		ld	a, (byte_A695)
		ld	hl, I4
		add	a, (hl)
		ld	(byte_A695), a
		ld	hl, byte_A695
		inc	(hl)
		ld	hl, (Ptr)
		ld	a, (I4)
		ld	c, a
		ld	b, 0
		add	hl, bc
		inc	hl
		ld	(Ptr), hl
		ld	hl, IT
		dec	(hl)
		jp	loc_3578
loc_35A9:
		ld	hl, (Ptr)
		ld	(word_029A), hl
		ld	a, (I1)
		cp	1
		jp	z, loc_3624
		ld	a, (byte_A695)
		ld	hl, NameLen
		add	a, (hl)
		ld	(byte_A695), a
		ld	hl, byte_A695
		inc	(hl)
		call	sub_6A99
		ld	hl, (word_02F2)
		dec	hl
		ld	(word_02F2), hl
		ld	a, (Result)
		cp	0
		jp	z, loc_35ED
		ld	hl, (VarPtr)	; Points to a var in the symbol	table
		ld	(Ptr1),	hl
		ld	a, (byte_A694)
		cp	(hl)
		jp	nz, loc_35EA
		call	sub_6C12
		jp	loc_35F0
loc_35EA:
		call	sub_6B28
loc_35ED:
		call	sub_6B6F
loc_35F0:
		ld	hl, STCnt
		dec	(hl)
		ld	hl, (word_029A)
		ld	(Ptr), hl
		ld	a, (STCnt)
		or	a
		jp	nz, loc_352E
		ld	ix, (SetBs)
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (SetFL)
		or	a
		jp	z, loc_3614
		xor	a
		ld	(SetFL), a
		ret
loc_3614:
		ld	a, (byte_04B3)
		cp	1
		jp	z, locret_3623
		ld	ix, (word_02C8)
		call	SSChk		; Check	for room on the	syntax stack
locret_3623:
		ret
loc_3624:
		call	sub_70A8
		call	FindKey		; Find place for a key
		ld	a, (Result)
		cp	1
		jp	z, loc_3635
		call	sub_784E
loc_3635:
		call	sub_6CE3
		ld	a, (Result)
		cp	0
		jp	z, loc_3643
		call	sub_6C8A
loc_3643:
		xor	a
		ld	(byte_A69A), a
		call	sub_7EF7
		ld	hl, (word_A648)
		ld	de, 0FFF9h	; 65529
		add	hl, de
		jp	nc, Error50	; Running out of global	space
		jp	loc_35F0
loc_3657:
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
		ld	a, 1Eh
		ld	hl, StrLen
		cp	(hl)
		jp	c, Error20	; Illegal expression
		ld	hl, (word_A049)
		ld	a, (StrLen)
		ld	(hl), a
		inc	hl
		ld	(word_A049), hl
		call	sub_9782
		ld	hl, 0
		ld	(word_A049), hl
		ld	a, (StrLen)
		ld	(byte_A6A3), a
loc_3684:
		xor	a
		ld	(SetFL), a
		ret
loc_3689:
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
		dec	ix
		ld	a, (ix+0)
		ld	(IT), a
		dec	ix
		ld	a, 1
		ld	hl, IODevice
		cp	(hl)
		jp	c, loc_3684
		ld	a, (IT)
		cp	59h		; 'Y'
		jp	z, loc_36B6
		ld	hl, (pDevX)
		ld	de, ibcdTemp0
		call	Copy5DEHL	; Copy 5 bytes from (DE) to (HL) ; SetI
		jp	loc_3684
loc_36B6:
		ld	hl, (pDevY)
		ld	de, ibcdTemp0
		call	Copy5DEHL	; Copy 5 bytes from (DE) to (HL) ; SetI
		jp	loc_3684
; End of function sub_33D6
; =============== S U B	R O U T	I N E =======================================
; Body of BREAK	command
bcBreak:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Case)
		cp	1
		jp	nz, bcBreak2
		ld	(Ptr), ix
		ld	hl, (Ptr)
		dec	hl
		dec	hl
		ld	(Ptr), hl
		ld	a, (hl)
		ld	(IT), a
		cp	1
		jp	nz, bcBreak2
		dec	hl
		ld	(Ptr), hl
		ld	a, (hl)
		ld	(IT), a
		cp	30h		; '0'
		jp	z, bcBreak1
		cp	31h		; '1'
		jp	nz, bcBreak2
bcBreak1:
		ld	a, (IT)
		sub	30h		; '0'
		ld	(bBreakVal), a	; Value	passed to BREAK	command
		ld	ix, (Ptr)
		call	SSChk		; Check	for room on the	syntax stack
		jp	bcBreakEnd
bcBreak2:
		ld	a, (Mode)
		cp	1
		jp	z, bcBreakEnd
		call	putCrLf		; Outputs a CrLf
		ld	hl, sBreak
		call	putStr		; Output 0x00 terminated string	pointed	by HL
		xor	a
		ld	(DeviceInUse), a
		call	sub_574A
		ld	a, (Case)
		cp	1
		jp	nz, bcBreak3
		call	Write
bcBreak3:				; Outputs a CrLf
		call	putCrLf
		ld	a, 1
		ld	(byte_A69C), a
bcBreakEnd:
		ret
; End of function bcBreak
; =============== S U B	R O U T	I N E =======================================
; Body of ZGO command
bczGo:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Mode)
		cp	1
		jp	nz, bczGoEnd
		ld	a, (byte_A69D)
		or	a
		jp	z, bczGoEnd
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(IT), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		ld	a, (ix+0)
		ld	(DeviceInUse), a
		dec	ix
		ld	a, (ix+0)
		ld	(Mode),	a
		dec	ix
		ld	a, (ix+0)
		ld	(DoSW),	a
		dec	ix
		ld	a, (ix+0)
		ld	(IndSW), a
		dec	ix
		ld	a, (ix+0)
		ld	(ForSW), a
		dec	ix
		ld	a, (ix+0)
		ld	(IndFL), a
		call	sub_5555
		call	sub_574A
		ld	a, (DeviceInUse)
		ld	(IODevice), a
		ld	hl, (pStkPos)
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	hl, byte_A69D
		dec	(hl)
		xor	a
		ld	(bmFlag), a
		ld	a, (Token)
		cp	tknCRLF		; Is it	CR or LF?
		jp	nz, bczGoEnd
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000010b
		ld	(hl), a
bczGoEnd:
		ret
; End of function bczGo
; =============== S U B	R O U T	I N E =======================================
; Body of $NEXT	and $ORDER functions
bfNxtOrd:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		ld	a, (ix+0)
		ld	(IT), a
		call	sub_50CC
		ld	a, (byte_04CC)
		or	a
		jp	z, Error46	; Subscript missing
		ld	(I1), a
		ld	hl, (word_02F2)
		ld	a, (NameLen)
		ld	c, a
		ld	b, 0
		add	hl, bc
		inc	hl
		ld	(Ptr), hl
loc_37DC:
		ld	a, (I1)
		cp	1
		jp	z, loc_37F6
		ld	hl, (Ptr)
		ld	c, (hl)
		ld	b, 0
		add	hl, bc
		inc	hl
		ld	(Ptr), hl
		ld	hl, I1
		dec	(hl)
		jp	loc_37DC
loc_37F6:
		ld	hl, (Ptr)
		inc	(hl)
		ld	(ix+0),	0
		inc	ix
		ld	a, (IT)
		cp	1
		jp	nz, loc_3873
		call	sub_6A99
		call	sub_6A25
		ld	a, (Result)
		cp	0
		jp	z, loc_3838
		ld	a, 1
		ld	hl, I5
		cp	(hl)
		jp	c, loc_3838
loc_381F:
		ld	ix, (word_02A4)
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_5861
loc_3829:
		ld	a, (IT)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ret
loc_3838:
		ld	ix, (word_02A4)
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (bFlagOrder)
		cp	1
		jp	z, loc_385B
		ld	(ix+0),	Minus
		inc	ix
		ld	(ix+0),	31h	; '1'
		inc	ix
		ld	a, 2
		ld	(IT), a
		jp	loc_3829
loc_385B:
		xor	a
		ld	(IT), a
		jp	loc_3829
; ----------
		ld	hl, (VarPtr)	; (todo) Check this
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	de, 9
		add	hl, de
		ld	(Ptr3),	hl
		jp	loc_37DC
loc_3873:
		call	sub_70A8
		call	FindKey		; Find place for a key
		ld	a, (Result)
		cp	0
		jp	z, loc_3838
		call	sub_6CE3
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, 0
		or	a
		sbc	hl, de
		jp	z, loc_38A5
		ld	a, 1
		ld	hl, I5
		cp	(hl)
		jp	c, loc_3838
		ld	hl, (word_027E)
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		jp	loc_381F
loc_38A5:
		call	sub_71EA
		ld	a, (Result)
		cp	0
		jp	z, loc_3838
		ld	hl, (word_A640)
		ex	de, hl
		ld	hl, (Ptr)
		ld	a, (byte_04CC)
		call	sub_96C0
		ld	(byte_04CC), a
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ld	a, 1
		ld	hl, byte_04CC
		cp	(hl)
		jp	c, loc_3838
		jp	loc_381F
; End of function bfNxtOrd
; =============== S U B	R O U T	I N E =======================================
sub_38CF:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (Vptr)
		ld	(Ptr), hl
		ld	de, 2
		add	hl, de
		ld	(word_02C8), hl
		call	sub_33D6
		ld	(ix+0),	0
		inc	ix
		ret
; End of function sub_38CF
; =============== S U B	R O U T	I N E =======================================
; Body of $RANDOM function
bfRandom:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
		ld	a, (hl)
		and	11110000b
		jp	nz, Error20	; Illegal expression
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, Error20	; Illegal expression
		call	sub_939D
		ret
; End of function bfRandom
; =============== S U B	R O U T	I N E =======================================
; Writes *n
WriteAst:
		call	SSChk		; Check	for room on the	syntax stack
		call	StrToChar	; Converts a string on ToS to char (0-255)
		ld	(IT), a
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	1
		inc	ix
		ld	(ix+0),	3
		inc	ix
		call	Write
		ret
; End of function WriteAst
; =============== S U B	R O U T	I N E =======================================
Write:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(Count), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ld	(Ptr), ix
		ld	a, (Count)
		ld	(IT), a
Write1:
		ld	a, (IT)
		or	a
		jp	z, Write2
		ld	hl, (Ptr)
		ld	a, (hl)
		ld	(tmpChar), a
		call	writeChar	; Outputs the character	on A to	the current IODevice
		ld	hl, IT
		dec	(hl)
		ld	hl, (Ptr)
		inc	hl
		ld	(Ptr), hl
		jp	Write1
Write2:
		ld	hl, ibcdTemp0
		ld	a, (Count)
		call	sub_9535
		ld	hl, (pDevX)
		ld	de, ibcdTemp0
		ld	c, 5
		call	AbcdDEHL	; Adds two C bytes long	BCDs pointed by	(DE) and (HL)
					; result goes in the BCD pointed by (HL)
		ret
; End of function Write
; =============== S U B	R O U T	I N E =======================================
sub_3977:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (bmFlag1)	; b2:Routine not saved
		and	00000100b
		jp	nz, Error42	; Remove or save routine
loc_3982:
		call	sub_7367
		ld	a, (DoSW)	; Are we inside	a DO command?
		or	a
		jp	nz, PrintErr18	; Yes.
		ld	a, (IndSW)	; Are we inside	an indirection?
		or	a
		jp	nz, PrintErr18	; Yes.
		jp	GameOver	; Terminate execution
; End of function sub_3977
; =============== S U B	R O U T	I N E =======================================
; Sets bit 1 of	bmActFlag
SetAFb1:
		ld	hl, bmActFlag
		ld	a, (hl)
		or	00000010b
		ld	(hl), a
		ret
; End of function SetAFb1
; =============== S U B	R O U T	I N E =======================================
; Move the contents of (case) to (ifsw)
CaseToIfSW:
		ld	a, (Case)
		ld	(IfSW),	a
		ret
; End of function CaseToIfSW
; =============== S U B	R O U T	I N E =======================================
; Body of IF command
bcIf:
		ld	a, (IfSW)
		or	a
		jp	nz, bcIf1
		ld	hl, bmActFlag
		ld	a, (hl)
		or	00000010b
		ld	(hl), a
bcIf1:
		ret
; End of function bcIf
; =============== S U B	R O U T	I N E =======================================
; Body of ELSE command
bcElse:
		ld	a, (IfSW)
		cp	1
		jp	nz, bcElseE
		ld	hl, bmActFlag
		ld	a, (hl)
		or	00000010b
		ld	(hl), a
bcElseE:
		ret
; End of function bcElse
; =============== S U B	R O U T	I N E =======================================
; Body of HANG command
bcHang:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, HangTime
		call	StrToInt	; Converts string on ToS to integer
		ld	a, (hl)
		and	11110000b
		jp	nz, bcHangE
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, bcHangE
		ld	a, 0
		ld	(Time),	a
		ld	a, 1
		ld	(Wait),	a
		call	sub_9407
		xor	a
		ld	(Wait),	a
bcHangE:
		ret
; End of function bcHang
; =============== S U B	R O U T	I N E =======================================
sub_39ED:
		ld	hl, (pEnd)
		ld	bc, 0FFFEh	; 65534
		add	hl, bc
		ld	(pSymbolTbl), hl
		ld	de, 0
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, 0
		ld	(SymEnd), hl
		ret
; End of function sub_39ED
; =============== S U B	R O U T	I N E =======================================
sub_3A04:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_9789
		ld	(pIndex), hl
		ld	(word_02F2), ix
		ld	de, (pIndex)
		ld	hl, (word_02F2)
		or	a
		sbc	hl, de
		ld	(word_02F2), hl
		ld	a, (hl)
		ld	(byte_04CC), a
		or	a
		jp	z, loc_3A2C
		call	sub_3FBA
		jp	Error23		; Illegal variable name
loc_3A2C:
		ld	ix, (word_02F2)
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (word_02F2)
		inc	hl
		ld	(word_02F2), hl
		ld	a, (hl)
		ld	(NameLen), a
		call	sub_6A99
		ld	a, (Result)
		cp	0
		jp	z, loc_3A75
loc_3A49:
		ld	a, 1
		ld	(KillFL), a
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr1),	hl
		ld	a, (hl)
		or	10000000b
		ld	(hl), a
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, 5
		or	a
		sbc	hl, de
		jp	z, locret_3A87
loc_3A75:
		call	sub_6A25
		ld	a, (Result)
		cp	0
		jp	z, locret_3A87
		ld	a, (I5)
		or	a
		jp	z, loc_3A49
locret_3A87:
		ret
; End of function sub_3A04
; =============== S U B	R O U T	I N E =======================================
sub_3A88:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (KillFL)
		or	a
		jp	nz, loc_3A96
		call	sub_39ED
		ret
loc_3A96:
		ld	hl, (pSymbolTbl)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
loc_3AA0:
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, 5
		or	a
		sbc	hl, de
		jp	z, loc_3ADC
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr1),	hl
		ld	a, (hl)
		and	10000000b
		jp	nz, loc_3AC5
		call	sub_6B28
		jp	loc_3AA0
loc_3AC5:
		ld	hl, (Ptr1)
		ld	a, 01111111b
		and	(hl)
		ld	(hl), a
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
		jp	loc_3AA0
loc_3ADC:
		call	sub_6A53
		ld	hl, (pIndex)
		ex	de, hl
		ld	hl, (pSymbolTbl)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ret
; End of function sub_3A88
; =============== S U B	R O U T	I N E =======================================
sub_3AEA:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		ld	a, (ix+0)
		ld	(IOTemp1), a
		call	sub_50CC
		ld	a, (IOTemp1)
		cp	1
		jp	nz, loc_3B72
		call	sub_6A99
		ld	hl, (Ptr)
		ld	(Ptr1),	hl
		ld	a, (Result)
		cp	0
		jp	z, loc_3B25
loc_3B11:
		ld	hl, (SymEnd)
		dec	hl
		ld	(SymEnd), hl
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
loc_3B25:
		call	sub_6A25
		ld	a, (Result)
		cp	0
		jp	z, loc_3B37
		ld	a, (I5)
		or	a
		jp	z, loc_3B11
loc_3B37:
		ld	hl, (Ptr)
		dec	hl
		ld	(Ptr), hl
		ld	hl, (Ptr1)
		dec	hl
		ld	(Ptr1),	hl
		ld	bc, (pSymbolTbl)
		ld	hl, (Ptr)
		ex	de, hl
		ld	hl, (Ptr1)
		call	sub_972F
		ld	(Ptr1),	hl
		ex	de, hl
		ld	(Ptr), hl
		ld	(pSymbolTbl), hl
		call	sub_6A53
		ld	hl, (pIndex)
		ex	de, hl
		ld	hl, (pSymbolTbl)
		ld	(hl), e
		inc	hl
		ld	(hl), d
loc_3B6A:
		ld	ix, (word_02A4)
		call	SSChk		; Check	for room on the	syntax stack
		ret
loc_3B72:
		call	sub_7974
		ld	hl, glbptrUnk
		ld	de, Nil
		call	JDEN
		jp	z, loc_3B6A
		call	sub_70A8
		ld	(word_02B2), ix
		call	FindKey		; Find place for a key
		ld	a, (Result)
		cp	0
		jp	z, loc_3B6A
		ld	a, (byte_04CC)
		or	a
		jp	nz, loc_3BA3
		call	sub_7A61
		call	sub_776C
		jp	loc_3B6A
loc_3BA3:
		call	sub_6CE3
		call	sub_73C4
		jp	loc_3B6A
; End of function sub_3AEA
; =============== S U B	R O U T	I N E =======================================
sub_3BAC:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_570D
		ld	hl, (word_02D4)
		ld	a, (hl)
		or	a
		jp	nz, loc_3BC6
		ld	a, (IODevice)
		ld	(DeviceInUse), a
		call	sub_574A
		jp	Error49		; Device not open
loc_3BC6:
		ld	a, (byte_A699)
		or	a
		jp	z, loc_3C20
		ld	a, (DeviceInUse)
		cp	1
		jp	z, loc_3C20
		cp	5
		jp	z, loc_3C20
		or	a
		jp	nz, loc_3BE4
		call	sub_5663
		jp	loc_3C20
loc_3BE4:
		ld	a, (byte_A699)
		add	a, 2
		ld	(byte_A699), a
		ld	de, ibcdTemp0
		ld	hl, ibcdVmin1
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		ld	de, ibcdTemp1
		ld	hl, ibcdVmin1
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
loc_3BFE:
		ld	(Ptr), ix
		ld	hl, (Ptr)
		dec	hl
		dec	hl
		ld	(Ptr), hl
		ld	a, (hl)
		ld	(IT), a
		call	sub_569A
		ld	hl, byte_A699
		dec	(hl)
		ld	a, (byte_A699)
		cp	2
		jp	nz, loc_3BFE
		call	sub_57BC
loc_3C20:
		ld	a, (DeviceInUse)
		ld	(IODevice), a
		ld	ix, (word_0276)
		call	SSChk		; Check	for room on the	syntax stack
		ret
; End of function sub_3BAC
; =============== S U B	R O U T	I N E =======================================
sub_3C2E:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Result)
		ld	(byte_04FD), a
		or	a
		jp	z, loc_3C59
		ld	a, (IfSW)
		or	a
		jp	nz, loc_3C4F
loc_3C42:
		ld	(word_0274), ix
		ld	hl, ibcdVmin1
		call	CharToStr	; Convert char (0-255) to string
		jp	loc_3CB9
loc_3C4F:
		ld	a, 0
		ld	(Time),	a
		ld	a, 1
		ld	(Wait),	a
loc_3C59:
		ld	hl, (word_02D6)
		ld	a, (hl)
		cp	1
		jp	z, loc_3CB9
		ld	a, (IODevice)
		or	a
		jp	nz, loc_3C7E
		call	sub_990E
loc_3C6C:
		ld	a, (Result)
		or	a
		jp	z, loc_3CA7
		ld	a, (IfSW)
		cp	0
		jp	z, loc_3C42
		jp	loc_3CA7
loc_3C7E:
		ld	a, (IODevice)
		cp	5
		jp	nz, loc_3C8C
		call	sub_9446
		jp	loc_3C6C
loc_3C8C:
		ld	hl, (word_02D4)
		ld	a, (hl)
		and	00001000b
		jp	nz, loc_3C9D
		ld	hl, (word_02DE)
		ld	a, (hl)
		ld	hl, (word_02E4)
		ld	(hl), a
loc_3C9D:
		call	sub_5112
		ld	hl, (word_02D4)
		ld	a, (hl)
		or	00001000b
		ld	(hl), a
loc_3CA7:
		ld	(word_0274), ix
		ld	a, (tmpChar)
		call	IntToStr
		ld	hl, (pDevX)
		ld	c, 5
		call	IbcdHL		; Increments by	1 the C	bytes long BCD pointed by (HL)
loc_3CB9:
		ld	hl, (word_0274)
		ld	(Ptr), hl
		ld	a, 1
		ld	(byte_04B3), a
		call	sub_33D6
		xor	a
		ld	(byte_04B3), a
		ret
; End of function sub_3C2E
; =============== S U B	R O U T	I N E =======================================
sub_3CCC:
		call	SSChk		; Check	for room on the	syntax stack
		call	Write
		ret
; End of function sub_3CCC
; =============== S U B	R O U T	I N E =======================================
sub_3CD3:
		call	SSChk		; Check	for room on the	syntax stack
		ld	(word_0274), ix
		ld	hl, (word_02D6)
		ld	a, (hl)
		cp	1
		jp	z, Error51	; Reading from write only device
		xor	a
		ld	(StrLen), a
		ld	a, (IODevice)
		or	a
		jp	z, loc_3CF3
		cp	5
		jp	nz, loc_3D10
loc_3CF3:
		ld	a, (Result)
		or	a
		jp	z, loc_3D19
		ld	a, (IfSW)
		or	a
		jp	z, loc_3D71
		xor	a
		ld	(Time),	a
		ld	a, 1
		ld	(Wait),	a
		ld	(byte_04FD), a
		jp	loc_3D19
loc_3D10:
		ld	hl, (word_02D4)
		ld	a, (hl)
		and	00001000b
		jp	nz, loc_3D21
loc_3D19:
		ld	hl, (word_02DE)
		ld	a, (hl)
		ld	hl, (word_02E4)
		ld	(hl), a
loc_3D21:
		call	sub_5112
		ld	a, (tmpChar)
		cp	0Dh
		jp	z, loc_3D71
		ld	a, (StrLen)
		cp	255
		jp	z, Error11	; String too long
		ld	hl, StrLen
		inc	(hl)
		ld	a, (tmpChar)
		ld	(ix+0),	a
		inc	ix
		ld	a, (StrLen)
		ld	hl, byte_0545
		cp	(hl)
		jp	z, loc_3D71
		ld	a, (tmpChar)
		cp	1Ah
		jp	nz, loc_3D21
		ld	a, (IODevice)
		cp	5
		jp	nz, loc_3D5D
		jp	loc_3D21
loc_3D5D:
		ld	a, (StrLen)
		cp	1
		jp	z, loc_3D71
		ld	hl, StrLen
		dec	(hl)
		dec	ix
		ld	a, (ix+0)
		ld	(tmpChar), a
loc_3D71:
		ld	a, (StrLen)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ld	a, (IODevice)
		or	a
		jp	z, loc_3D99
		ld	a, (tmpChar)
		cp	1Ah
		jp	z, loc_3D99
loc_3D8E:
		call	sub_5112
		ld	a, (tmpChar)
		cp	0Ah
		jp	nz, loc_3D8E
loc_3D99:
		ld	hl, (word_02D4)
		ld	a, (hl)
		or	00001000b
		ld	(hl), a
		ld	hl, ibcdTemp0
		ld	a, (StrLen)
		call	sub_9535
		ld	hl, (pDevX)
		ld	de, ibcdTemp0
		ld	c, 5
		call	AbcdDEHL	; Adds two C bytes long	BCDs pointed by	(DE) and (HL)
					; result goes in the BCD pointed by (HL)
		ld	hl, (word_0274)
		ld	(Ptr), hl
		ld	a, 1
		ld	(byte_04B3), a
		call	sub_33D6
		xor	a
		ld	(byte_04B3), a
		ld	a, 255
		ld	(byte_0545), a
		ret
; End of function sub_3CD3
; =============== S U B	R O U T	I N E =======================================
; Clear	off transpt info (AC69)
ClrTRInfo:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		ld	a, (ix+0)
		ld	(IT), a
		or	a
		jp	z, ClrTRInfo1
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
ClrTRInfo1:				; Done
		ld	a, (IT)
		cp	1
		jp	z, ClrTRInfoEnd
		dec	ix
		ld	a, (ix+0)
		or	a
		jp	z, ClrTRInfo2
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
ClrTRInfo2:
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(IT), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
ClrTRInfoEnd:
		ret
; End of function ClrTRInfo
; =============== S U B	R O U T	I N E =======================================
; Push a -1 in the stack
PushMinusOne:
		ld	(ix+0),	255
		inc	ix
		ret
; End of function PushMinusOne
; =============== S U B	R O U T	I N E =======================================
; Push CASE in the stack (AC71)
PushCase:
		ld	a, (Case)
		ld	(ix+0),	a
		inc	ix
		ret
; End of function PushCase
; =============== S U B	R O U T	I N E =======================================
sub_3E37:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_5D1F
		ld	hl, (pStkStart)
		ld	(pLineBefore), hl
loc_3E43:
		ld	a, (IndFL)
		or	a
		jp	z, loc_3E50
		call	IndRet		; Return from indirection
		jp	loc_3E43
loc_3E50:
		ld	a, (ForSW)
		or	a
		jp	z, loc_3E78
		pop	hl
		ld	(Ptr1),	hl
		pop	hl
		ld	(Ptr2),	hl
		call	sub_47DD
		call	sub_4839
		pop	hl
		ld	(Ptr), hl
		pop	hl
		ld	(Ptr), hl
		ld	hl, (Ptr2)
		push	hl
		ld	hl, (Ptr1)
		push	hl
		jp	loc_3E50
loc_3E78:
		ld	hl, (pLineBefore)
		ld	(pStkStart), hl
		ld	a, 1Dh
		ld	(Token), a
		xor	a
		ld	(Mode),	a
		ld	a, 0
		ld	(GotoFL), a
		ld	a, (IndSW)
		or	a
		jp	z, loc_3E98
		ld	a, 1
		ld	(GotoFL), a
loc_3E98:
		ld	a, 1
		ld	(byte_A691), a
		ret
; End of function sub_3E37
; =============== S U B	R O U T	I N E =======================================
; Body of DO command
bcDo:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, byte_A65F	; (todo) Check this
		ld	(Ptr), hl
		ex	de, hl
		ld	hl, (pRtnName)
		call	CopyHLDE	; Copy (HL) bytes from (HL) to (DE)
		ld	hl, (pStkStart)
		ld	(pLineBefore), hl
		ld	hl, (pStartOfRtn)
		ld	(word_A62C), hl
		ld	hl, byte_A671
		ld	(Ptr), hl
		ex	de, hl
		ld	hl, byte_A668
		call	CopyHLDE	; Copy (HL) bytes from (HL) to (DE)
		ld	de, ibcdTemp1
		ld	hl, ibcdUnk07
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		call	sub_5D1F
		ld	a, (Mode)
		cp	0
		jp	nz, bcDo1
		ld	de, (pLineBefore)
		ld	hl, (pStkPos)
		or	a
		sbc	hl, de
		ld	(pStkPos), hl
		ld	de, (word_A62C)
		ld	hl, (pLineBefore)
		or	a
		sbc	hl, de
		ld	(pLineBefore), hl
bcDo1:
		ld	hl, (pLineBefore)
		call	sub_97BE
		ld	hl, (pStkPos)
		call	sub_97BE
		ld	hl, byte_A671
		call	sub_97D5
		ld	hl, ibcdTemp1
		call	CharToStr	; Convert char (0-255) to string
		ld	hl, byte_A65F
		call	sub_97D5
		ld	a, (ForSW)
		ld	(ix+0),	a
		inc	ix
		ld	a, (IndSW)
		ld	(ix+0),	a
		inc	ix
		ld	a, (IndFL)
		ld	(ix+0),	a
		inc	ix
		ld	a, (Mode)
		ld	(ix+0),	a
		inc	ix
		ld	hl, DoSW
		inc	(hl)
		xor	a
		ld	(ForSW), a
		ld	(IndSW), a
		ld	(IndFL), a
		ld	a, 0
		ld	(Mode),	a
		ld	a, 1
		ld	(byte_A691), a
		call	Input		; Get line to execute
		jp	MainLoop5	; Execute command
; End of function bcDo
; =============== S U B	R O U T	I N E =======================================
; Body of $TEXT	function with LineRef
bfTextL:
		call	SSChk		; Check	for room on the	syntax stack
		call	MV2LN		; Move Ptr1 to Lineref
		dec	ix
		call	Ln2Stk		; Line to Stack
		ret
; End of function bfTextL
; =============== S U B	R O U T	I N E =======================================
; Body of QUIT command
bcQuit:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (ForSW)
		or	a
		jp	z, bcQuit1
		call	sub_47DD
		call	sub_4839
		ld	a, (ForSW)
		or	a
		jp	nz, bcQuit3
		ld	hl, bmFlag
		ld	a, (hl)
		or	00000010b
		ld	(hl), a
		jp	bcQuit3
bcQuit1:
		ld	a, (IndSW)
		or	a
		jp	z, bcQuit2
		call	sub_69DD
		jp	bcQuit4
bcQuit2:
		ld	a, (DoSW)
		or	a
		jp	z, bcQuit5
		call	sub_6612
		jp	bcQuit4
bcQuit3:
		pop	hl
		ld	(Ptr), hl
bcQuit4:
		pop	hl
		ld	(Ptr), hl
		pop	hl
		ld	(Ptr), hl
		jp	bcQuitEnd
bcQuit5:
		ld	a, (AutoexecFlag)
		cp	3
		jp	z, loc_3982
		ld	a, 1
		ld	(Mode),	a
		ld	a, 2
		ld	(bmFlag), a
bcQuitEnd:
		ret
; End of function bcQuit
; =============== S U B	R O U T	I N E =======================================
sub_3FBA:
		ld	a, (KillFL)
		or	a
		jp	z, locret_3FFC
		xor	a
		ld	(KillFL), a
		ld	hl, (pSymbolTbl)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
loc_3FCF:
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, 5
		or	a
		sbc	hl, de
		jp	z, locret_3FFC
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(pIndex), hl
		ld	a, 01111111b
		and	(hl)
		ld	(hl), a
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
		jp	loc_3FCF
locret_3FFC:
		ret
; End of function sub_3FBA
; =============== S U B	R O U T	I N E =======================================
; Body of CLOSE	command
bcClose:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		ld	a, (ix+0)
		ld	(NumOfParams), a
		or	a
		jp	z, bcClose1
		cp	1
		jp	nz, Error48	; Invalid parameter
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
bcClose1:
		dec	ix
		ld	a, (ix+0)
		ld	(DeviceInUse), a
		ld	(IT), a
		call	sub_574A
		ld	a, (DeviceInUse)
		cp	2
		jp	c, bcClose5
		ld	a, 4
		ld	hl, DeviceInUse
		cp	(hl)
		jp	c, bcClose5
		ld	hl, (pDevice)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	a, (hl)
		ld	(Drive), a
		inc	hl
		ld	(pIndex), hl
		ld	(pFCBAddr), hl
		ld	hl, (word_02D4)
		ld	a, (hl)
		and	00000010b
		jp	z, bcClose3
		ld	a, (hl)
		and	00000100b
		jp	nz, bcClose2
		ld	hl, (word_02E2)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(Ptr), hl
		ld	(hl), 1Ah
bcClose2:
		ld	hl, (word_02E0)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(pFRWBuffer), hl
		call	FSeqWrite	; Sequential write file
bcClose3:
		ld	a, (NumOfParams)
		or	a
		jp	z, bcClose5
		ld	hl, ibcdTemp0
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, bcClose4
		call	FDelete		; Delete file
		jp	bcClose5
bcClose4:				; Close	file
		call	FClose
bcClose5:
		ld	hl, (word_02D4)
		ld	(hl), 0
		ld	a, (DeviceInUse)
		ld	hl, IODevice
		cp	(hl)
		jp	nz, bcCloseEnd
		xor	a
		ld	(IODevice), a
bcCloseEnd:
		ld	a, (IODevice)
		ld	(DeviceInUse), a
		call	sub_574A
		ret
; End of function bcClose
; =============== S U B	R O U T	I N E =======================================
bcOpen:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_570D
		ld	hl, (word_02D4)
		ld	(hl), 0
		ld	a, (DeviceInUse)
		cp	1
		jp	z, loc_41DE
		cp	5
		jp	z, loc_41DE
		or	a
		jp	nz, loc_40CA
		call	sub_5663
		jp	loc_41DE
loc_40CA:
		ld	de, ibcdTemp0
		ld	hl, ibcdVmin1
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		ld	de, ibcdTemp1
		ld	hl, ibcdVmin1
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		ld	a, (byte_A699)
		or	a
		jp	nz, loc_40EC
		ld	a, (RoutinesDR)
		ld	(byte_04DA), a
		jp	loc_416B
loc_40EC:
		ld	(Ptr), ix
		ld	hl, (Ptr)
		dec	hl
		dec	hl
		ld	(Ptr), hl
		ld	a, (hl)
		ld	(IT), a
		ld	a, (byte_A699)
		cp	1
		jp	nz, loc_4137
		ld	a, (IT)
		cp	1
		jp	z, loc_4119
		or	a
		jp	nz, Error48	; Invalid parameter
		ld	a, (RoutinesDR)
		ld	(byte_04DA), a
		jp	loc_414E
loc_4119:
		dec	ix
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(byte_04DA), a
		ld	hl, byte_04DA
		ld	a, 11011111b
		and	(hl)
		ld	(hl), a
		ld	a, (byte_04DA)
		sub	41h		; 'A'
		ld	(byte_04DA), a
		jp	loc_4155
loc_4137:
		ld	a, (byte_A699)
		cp	2
		jp	nz, loc_4148
		ld	hl, byte_A67A
		call	sub_97A2
		jp	loc_4155
loc_4148:
		call	sub_569A
		jp	loc_4155
loc_414E:
		ld	ix, (Ptr)
		call	SSChk		; Check	for room on the	syntax stack
loc_4155:
		ld	hl, byte_A699
		dec	(hl)
		ld	a, (byte_A699)
		or	a
		jp	nz, loc_40EC
		ld	hl, byte_A67A
		ld	(Ptr), hl
		ld	a, (hl)
		or	a
		jp	nz, loc_419E
loc_416B:
		ld	hl, sDev
		ld	a, (hl)
		ld	(IT), a
		inc	hl
		ld	(Ptr), hl
		call	sub_97B3
		ld	(Ptr), hl
		ld	a, (DeviceInUse)
		add	a, 30h		; '0'
		ld	(I1), a
		ld	(ix+0),	a
		inc	ix
		ld	hl, IT
		inc	(hl)
		ld	a, (IT)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		jp	loc_41A4
loc_419E:
		ld	hl, byte_A67A
		call	sub_97D5
loc_41A4:
		ld	hl, (pDevice)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(pIndex), hl
		ld	a, (byte_04DA)
		ld	(hl), a
		ld	a, 2
		ld	(FCBType), a	; 0:Global, 1:Routine, 2:File
		ld	a, (byte_04DA)
		ld	(Drive), a
		call	FFirst		; Find first file
		ld	a, (Result)
		cp	1
		jp	nz, loc_41D3
		call	FOpen		; Open file
		ld	hl, (word_02D6)
		ld	(hl), 2
		jp	loc_41DB
loc_41D3:				; Create file
		call	FCreate
		ld	hl, (word_02D6)
		ld	(hl), 1
loc_41DB:
		call	sub_57BC
loc_41DE:
		ld	hl, (word_02D4)
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ld	a, (IODevice)
		ld	(DeviceInUse), a
		call	sub_574A
		ld	ix, (word_0276)
		call	SSChk		; Check	for room on the	syntax stack
		ret
; End of function bcOpen
; =============== S U B	R O U T	I N E =======================================
sub_41F6:
		call	SSChk		; Check	for room on the	syntax stack
		call	ExprToNum	; Convert expression to	numeric	value
		ld	hl, FReal
		call	sub_98DD
		ret
; End of function sub_41F6
; =============== S U B	R O U T	I N E =======================================
ShowFiles:
		call	SSChk		; Show a list of files
		xor	a
		ld	(IT), a
		ld	(byte_04EA), a
		ld	(byte_A6A5), a
		ld	a, 8
		ld	hl, I1
		sub	(hl)
		ld	(I3), a
loc_4219:
		call	sub_9C00
		ld	a, (Result)
		cp	0
		jp	z, loc_42B5
		ld	hl, (Ptr)
		ld	(word_027C), hl
		ld	a, (byte_04EA)
		or	a
		jp	z, loc_4242
		ld	a, (I1)
		cp	3
		jp	z, loc_4242
		ld	hl, sColon
		call	sub_97D5
		call	Write
loc_4242:
		ld	a, 8
		ld	(Count), a
		ld	hl, (word_027C)
		call	sub_97B3
		ld	(word_027C), hl
		ld	a, 1
		ld	(ITX), a
		ld	a, (I1)
		cp	4
		jp	z, loc_4262
		ld	a, 4
		ld	(ITX), a
loc_4262:
		ld	(ix+0),	Space
		inc	ix
		ld	hl, ITX
		dec	(hl)
		ld	a, (ITX)
		or	a
		jp	nz, loc_4262
		ld	a, (I1)
		cp	3
		jp	z, loc_4289
		ld	a, 3
		ld	(Count), a
		ld	hl, (word_027C)
		call	sub_97B3
		ld	(word_027C), hl
loc_4289:
		ld	(ix+0),	0Ch
		inc	ix
		ld	(ix+0),	3
		inc	ix
		call	Write
		ld	a, 1
		ld	(IT), a
		ld	hl, byte_04EA
		inc	(hl)
		ld	a, (byte_04EA)
		ld	hl, I3
		cp	(hl)
		jp	nz, loc_4219
		call	PrintCRLF
		xor	a
		ld	(byte_04EA), a
		jp	loc_4219
loc_42B5:
		ld	a, (byte_04EA)
		or	a
		jp	z, locret_42BF
		call	PrintCRLF
locret_42BF:
		ret
; End of function ShowFiles
; =============== S U B	R O U T	I N E =======================================
sub_42C0:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_50CC
		call	sub_6A99
		ld	a, (Result)
		cp	1
		jp	z, loc_42E1
		ld	a, (byte_0549)
		or	a
		jp	z, Error03	; Undefined local variable
		ld	hl, byte_A69E
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		jp	loc_42FA
loc_42E1:
		ld	a, (ForFL)
		cp	1
		jp	z, loc_42FA
		ld	hl, (word_02F2)
		dec	hl
		ld	(word_02F2), hl
		ld	ix, (word_02F2)
		call	SSChk		; Check	for room on the	syntax stack
		jp	loc_4301
loc_42FA:
		ld	ix, (word_0502)
		call	SSChk		; Check	for room on the	syntax stack
loc_4301:				; Points to a var in the symbol	table
		ld	hl, (VarPtr)
		call	sub_97D5
		xor	a
		ld	(ForFL), a
		ret
; End of function sub_42C0
; =============== S U B	R O U T	I N E =======================================
sub_430C:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Mode)
		cp	0
		jp	nz, loc_4324
		ld	de, (pStkStart)
		ld	hl, (pStkPos)
		or	a
		sbc	hl, de
		ld	(pStkPos), hl
loc_4324:
		ld	hl, (pStkPos)
		call	sub_97BE
		ld	(Ptr), ix
		ld	hl, (Ptr)
		ld	bc, 0FFFDh
		add	hl, bc
		ld	(Ptr), hl
		ld	a, (hl)
		ld	(IT), a
loc_433C:
		ld	a, (IT)
		or	a
		jp	z, loc_4358
		ld	hl, (Ptr)
		dec	hl
		dec	hl
		ld	e, (hl)
		ld	d, 0
		or	a
		sbc	hl, de
		ld	(Ptr), hl
		ld	hl, IT
		dec	(hl)
		jp	loc_433C
loc_4358:
		ld	hl, (Ptr)
		ld	bc, 0FFFEh
		add	hl, bc
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		dec	hl
		ld	(pStkPos), hl
		ld	a, (Mode)
		cp	0
		jp	nz, loc_437A
		ld	de, (pStkStart)
		add	hl, de
		ld	(pStkPos), hl
loc_437A:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		jp	MainLoop5	; Execute command
; End of function sub_430C
; =============== S U B	R O U T	I N E =======================================
sub_4380:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_9789
		ld	(pStkPos), hl
		ld	a, (Mode)
		cp	0
		jp	nz, loc_4399
		ld	de, (pStkStart)
		add	hl, de
		ld	(pStkPos), hl
loc_4399:
		ld	(Ptr1),	ix
		ld	hl, (Ptr1)
		dec	hl
		dec	hl
		dec	hl
		ld	a, (hl)
		ld	(byte_04E8), a
		cpl
		ld	c, a
		ld	b, 11111111b
		inc	bc
		add	hl, bc
		ld	(Ptr1),	hl
		ld	(word_0502), ix
		ld	hl, (word_0502)
		ld	(Ptr2),	hl
		ld	ix, (Ptr1)
		call	SSChk		; Check	for room on the	syntax stack
		ld	bc, 0FFFEh
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ld	(Vptr),	ix
		ld	a, 1
		ld	(ForFL), a
		call	sub_42C0
		call	ExprToNum	; Convert expression to	numeric	value
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I2), a
		ld	a, (byte_04E8)
		ld	(I1), a
		ld	a, 5
		ld	(I6), a
		call	sub_8B6A
		ld	hl, (Vptr)
		ld	(Ptr), hl
		ld	hl, (word_0502)
		ld	(word_02C8), hl
		call	sub_33D6
		ld	a, 2
		ld	(Case),	a
		ret
; End of function sub_4380
; =============== S U B	R O U T	I N E =======================================
; Body of $TEXT	function with Offset
bfTextO:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	nz, bfTextO1
		ld	hl, (pRtnName)
		call	sub_97D5
		ret
bfTextO1:
		ld	a, 1
		ld	(DT), a
		ld	hl, (pStartOfRtn)
		ld	(Ptr1),	hl
		ld	hl, ibcdTemp0
		ld	c, 5		; (todo) INTLN
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		call	CharToStr	; Convert char (0-255) to string
		call	MV2LN		; Move Ptr1 to Lineref
		call	Ln2Stk		; Line to Stack
		xor	a
		ld	(DT), a
		ret
; End of function bfTextO
; =============== S U B	R O U T	I N E =======================================
sub_443E:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_50CC
		ld	hl, (word_02F2)
		dec	hl
		ld	(word_0278), hl
		call	sub_70A8
		xor	a
		ld	(NR), a
		call	FindKey		; Find place for a key
		ld	a, (Result)
		cp	1
		jp	z, loc_4474
loc_445D:
		ld	a, (byte_0549)
		or	a
		jp	z, Error07	; Undefined global name
		ld	hl, byte_A69E
		ld	(word_027E), hl
		ld	ix, (word_0502)
		call	SSChk		; Check	for room on the	syntax stack
		jp	loc_449B
loc_4474:
		call	sub_6CE3
		ld	a, (Result)
		cp	1
		jp	z, loc_4482
		jp	loc_445D
loc_4482:
		ld	a, (ForFL)
		cp	1
		jp	z, loc_4494
		ld	ix, (word_0278)
		call	SSChk		; Check	for room on the	syntax stack
		jp	loc_449B
loc_4494:
		ld	ix, (word_0502)
		call	SSChk		; Check	for room on the	syntax stack
loc_449B:
		ld	hl, (word_027E)
		call	sub_97D5
		xor	a
		ld	(ForFL), a
		ret
; End of function sub_443E
; =============== S U B	R O U T	I N E =======================================
sub_44A6:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (pStkPos)
		ld	(pIndex), hl
		ld	a, 1
		ld	(byte_A69F), a
		ld	(TPP), ix
		ld	hl, (word_02FA)
		ld	(Ptr), hl
		dec	hl
		dec	hl
		ld	(pStkPos), hl
		ld	(Ptr2),	hl
		ld	e, (hl)
		ld	d, 0
		or	a
		sbc	hl, de
		ld	(pStkPos), hl
		ld	(Ptr3),	hl
		xor	a
		ld	(Count), a
		ld	de, ibcd1
		ld	hl, ibcdV0
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
loc_44DF:
		ld	hl, (pStkPos)
		ex	de, hl
		ld	hl, (Ptr2)
		or	a
		sbc	hl, de
		jp	nz, loc_44F9
		ld	hl, (Ptr)
		ex	de, hl
		ld	hl, (TPP)
		or	a
		sbc	hl, de
		jp	z, loc_45F3
loc_44F9:
		ld	hl, (Ptr)
		ex	de, hl
		ld	hl, (TPP)
		or	a
		sbc	hl, de
		jp	z, loc_4539
		ld	hl, ibcd1
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	nz, loc_4539
		ld	hl, (Ptr)
		ld	(Ptr1),	hl
		inc	hl
		ld	c, (hl)
		ld	b, 0
		add	hl, bc
		inc	hl
		ld	(Ptr), hl
		ld	de, ibcd1
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		ld	hl, (Ptr)
		ld	de, 5
		add	hl, de
		ld	(Ptr), hl
		ld	de, ibcdUnk05
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		jp	loc_4584
loc_4539:
		ld	a, (Count)
		or	a
		jp	z, loc_4606
		ld	hl, Count
		dec	(hl)
		call	sub_9789
		ld	(pStkPos), hl
		call	sub_9789
		ld	(Ptr), hl
		ld	(Ptr1),	hl
		inc	hl
		ld	c, (hl)
		ld	b, 0
		add	hl, bc
		inc	hl
		ld	de, 5
		add	hl, de
		ld	(Ptr), hl
		ld	(word_0274), ix
		ld	hl, (word_0274)
		ld	bc, 0FFFBh
		add	hl, bc
		ld	(word_0274), hl
		ld	de, ibcdUnk05
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		ld	ix, (word_0274)
		call	SSChk		; Check	for room on the	syntax stack
		ld	de, ibcd1
		ld	hl, ibcdV1
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
loc_4584:
		ld	hl, (Ptr)
		ld	de, 5
		add	hl, de
		ld	(Ptr), hl
		ld	hl, (Ptr1)
		ld	a, (hl)
		cp	0
		jp	z, loc_459D
		call	sub_68D5
		jp	loc_45A0
loc_459D:
		call	sub_6866
loc_45A0:
		ld	hl, ibcd1
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	nz, loc_44DF
		ld	hl, ibcdUnk05
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, loc_44DF
		ld	hl, (Ptr1)
		ld	a, (hl)
		or	a
		jp	z, loc_44DF
		ld	(word_0274), ix
		ld	hl, (word_0274)
		ld	de, ibcdUnk05
		call	Copy5DEHL	; Copy 5 bytes from (DE) to (HL) ; SetI
		ld	hl, (word_0274)
		ld	de, 5
		add	hl, de
		ld	(word_0274), hl
		ld	ix, (word_0274)
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (Ptr1)
		dec	hl
		ld	(Ptr1),	hl
		call	sub_97BE
		ld	hl, (pStkPos)
		call	sub_97BE
		ld	hl, Count
		inc	(hl)
		jp	loc_44DF
loc_45F3:
		ld	hl, ibcd1
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	nz, loc_4606
		ld	a, 1
		ld	(Result), a
		jp	loc_460B
loc_4606:
		ld	a, 0
		ld	(Result), a
loc_460B:
		ld	ix, (Ptr3)
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (bmFlag1)	; b2:Routine not saved
		and	00000010b
		jp	z, loc_4629
		ld	hl, bmFlag1	; b2:Routine not saved
		ld	a, 11111101b
		and	(hl)
		ld	(hl), a
		ld	a, (Result)
		xor	00000001b
		ld	(Result), a
loc_4629:
		ld	a, (Result)
		call	IntToStr
		ld	hl, (pIndex)
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		xor	a
		ld	(byte_A69F), a
		ret
; End of function sub_44A6
; =============== S U B	R O U T	I N E =======================================
sub_463E:
		call	SSChk		; Check	for room on the	syntax stack
		ld	(word_0502), ix
		ld	ix, (Vptr)
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 1
		ld	(ForFL), a
		call	sub_42C0
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(byte_04EB), a
		ld	a, 6
		ld	(I6), a
		ld	(Ptr), ix
		ld	hl, (word_02FE)
		ld	a, (hl)
		cp	Minus
		jp	z, loc_46C1
		ld	hl, (word_0502)
		ld	(Ptr1),	hl
		ld	hl, (word_02F8)
		ld	(Ptr2),	hl
		ld	a, (byte_04EB)
		ld	(I1), a
		ld	a, (byte_04EC)
		ld	(I2), a
loc_4688:
		call	sub_8B6A
		ld	ix, (word_0502)
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (Ptr)
		ld	a, (hl)
		cp	Minus
		jp	z, loc_46DC
		ld	a, (hl)
		cp	30h		; '0'
		jp	z, loc_46DC
		xor	a
		ld	(Case),	a
		ld	a, (Mode)
		cp	0
		jp	nz, loc_46BA
		ld	de, (pStkStart)
		ld	hl, (pStkPos)
		or	a
		sbc	hl, de
		ld	(pStkPos), hl
loc_46BA:
		ld	hl, (pStkPos)
		call	sub_97BE
		ret
loc_46C1:
		ld	hl, (word_02F8)
		ld	(Ptr1),	hl
		ld	hl, (word_0502)
		ld	(Ptr2),	hl
		ld	a, (byte_04EC)
		ld	(I1), a
		ld	a, (byte_04EB)
		ld	(I2), a
		jp	loc_4688
loc_46DC:
		ld	a, 1
		ld	(Case),	a
		ret
; End of function sub_463E
; =============== S U B	R O U T	I N E =======================================
sub_46E2:
		call	SSChk		; Check	for room on the	syntax stack
		xor	a
		ld	(Case),	a
		call	sub_664B
		ld	ix, (Vptr)
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 1
		ld	(ForFL), a
		call	sub_42C0
		call	ExprToNum	; Convert expression to	numeric	value
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(byte_04EB), a
		ld	(Ptr), ix
		ld	hl, (word_02F8)
		ld	(Ptr1),	hl
		ld	a, (byte_04EC)
		ld	(I1), a
		ld	hl, (word_02FE)
		ld	(Ptr2),	hl
		ld	a, (byte_04ED)
		ld	(I2), a
		ld	a, 6
		ld	(I6), a
		call	sub_8B6A
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I3), a
		ld	(word_0274), ix
		ld	hl, (word_02FE)
		ld	a, (hl)
		cp	Minus
		jp	z, loc_476A
		ld	hl, (Ptr)
		ld	(Ptr1),	hl
		ld	a, (I3)
		ld	(I1), a
		ld	hl, (word_0502)
		ld	(Ptr2),	hl
		ld	a, (byte_04EB)
		ld	(I2), a
loc_475B:
		call	sub_8B6A
		ld	hl, (word_0274)
		ld	a, (hl)
		cp	Minus
		jp	z, loc_47BA
		jp	loc_4785
loc_476A:
		ld	hl, (word_0502)
		ld	(Ptr1),	hl
		ld	a, (byte_04EB)
		ld	(I1), a
		ld	hl, (Ptr)
		ld	(Ptr2),	hl
		ld	a, (I3)
		ld	(I2), a
		jp	loc_475B
loc_4785:
		ld	hl, (word_02FE)
		ld	(Ptr1),	hl
		ld	a, (byte_04ED)
		ld	(I1), a
		ld	hl, (word_0502)
		ld	(Ptr2),	hl
		ld	a, (byte_04EB)
		ld	(I2), a
		ld	a, 5
		ld	(I6), a
		call	sub_8B6A
		ld	hl, (Vptr)
		ld	(Ptr), hl
		ld	hl, (word_0502)
		ld	(word_02C8), hl
		call	sub_33D6
		ld	a, 1
		ld	(Case),	a
		ret
loc_47BA:
		ld	ix, (word_0502)
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Mode)
		cp	0
		jp	nz, loc_47D6
		ld	de, (pStkStart)
		ld	hl, (pStkPos)
		or	a
		sbc	hl, de
		ld	(pStkPos), hl
loc_47D6:
		ld	hl, (pStkPos)
		call	sub_97BE
		ret
; End of function sub_46E2
; =============== S U B	R O U T	I N E =======================================
sub_47DD:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_9789
		ld	(pStkPos), hl
		ld	a, (Mode)
		cp	0
		jp	nz, loc_47F6
		ld	de, (pStkStart)
		add	hl, de
		ld	(pStkPos), hl
loc_47F6:
		dec	ix
		ld	a, (ix+0)
		ld	(IOTemp1), a
loc_47FE:
		ld	a, (IOTemp1)
		or	a
		jp	z, loc_4820
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I1), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, IOTemp1
		dec	(hl)
		jp	loc_47FE
loc_4820:
		ld	hl, (pStkPos)
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	(word_0276), ix
		ld	hl, (word_0276)
		ld	bc, 0FFFEh
		add	hl, bc
		ld	(Vptr),	hl
		ret
; End of function sub_47DD
; =============== S U B	R O U T	I N E =======================================
sub_4839:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, ForSW
		dec	(hl)
		ld	bc, 0FFFEh	; 65534
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_9789
		ld	(Ptr), hl
		ld	(TPP), ix
		ld	de, (Ptr)
		ld	hl, (TPP)
		or	a
		sbc	hl, de
		ld	(TPP), hl
		ld	ix, (TPP)
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, bmActFlag
		ld	a, (hl)
		or	00000010b
		ld	(hl), a
		ret
; End of function sub_4839
; =============== S U B	R O U T	I N E =======================================
sub_486E:
		call	SSChk		; Check	for room on the	syntax stack
		call	ExprToInt	; Convert expression to	integer
		ld	hl, HangTime
		call	StrToInt	; Converts string on ToS to integer
		xor	a
		ld	(StrLen), a
		ld	a, (Locks)
		cp	1
		jp	z, loc_489C
		ld	a, (hl)
		and	11110000b
		jp	nz, loc_4897
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, loc_4897
		jp	loc_489C
loc_4897:
		xor	a
		ld	(IfSW),	a
		ret
loc_489C:
		ld	a, 1
		ld	(IfSW),	a
		ret
; End of function sub_486E
; =============== S U B	R O U T	I N E =======================================
sub_48A2:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (pRtnName)
		ld	(Ptr), hl
		call	sub_5AA4
		ld	hl, (word_9F96)
		ld	(hl), 0
		ld	hl, 0
		ld	(word_A624), hl
		ld	hl, (pStartOfRtn)
		ld	(pEndOfRtn), hl
		ld	(pCurRtnLine), hl
		ld	(word_9F9A), hl
		ld	hl, (pEndOfRtn)
		ld	(hl), 1Ah
		ld	hl, bmFlag1	; b2:Routine not saved
		ld	a, 11111011b
		and	(hl)
		ld	(hl), a
		ret
; End of function sub_48A2
; =============== S U B	R O U T	I N E =======================================
sub_48D2:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (pRtnName)
		ld	(Ptr), hl
		call	sub_5AA4
		call	sub_5EB8
		call	sub_5D7A
		ret
; End of function sub_48D2
; =============== S U B	R O U T	I N E =======================================
sub_48E5:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_5FDE
		ld	hl, (pEndOfRtn)
		ld	(pCurRtnLine), hl
		ld	hl, bmFlag1	; b2:Routine not saved
		ld	a, 11111011b
		and	(hl)
		ld	(hl), a
		ret
; End of function sub_48E5
; =============== S U B	R O U T	I N E =======================================
sub_48F9:
		ld	hl, (pStartOfRtn)
		ld	(pCurRtnLine), hl
		ret
; End of function sub_48F9
; =============== S U B	R O U T	I N E =======================================
sub_4900:
		call	SSChk		; Check	for room on the	syntax stack
		call	MV2LN		; Move Ptr1 to Lineref
		ld	a, (Result)
		or	a
		jp	z, Error34	; Invalid line reference
		ld	hl, (Ptr1)
		ld	(pCurRtnLine), hl
		ret
; End of function sub_4900
; =============== S U B	R O U T	I N E =======================================
sub_4914:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (pStartOfRtn)
		ld	(Ptr), hl
loc_491D:
		ld	hl, (Ptr)
		ld	a, (hl)
		cp	1Ah
		jp	z, locret_492C
		call	sub_5F1D
		jp	loc_491D
locret_492C:
		ret
; End of function sub_4914
; =============== S U B	R O U T	I N E =======================================
sub_492D:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_5EB8
		ld	hl, (Ptr1)
		ld	(Ptr), hl
loc_4939:
		call	sub_5F1D
		ld	hl, (Ptr)
		ex	de, hl
		ld	hl, (Ptr3)
		or	a
		sbc	hl, de
		jp	nz, loc_4939
		ret
; End of function sub_492D
; =============== S U B	R O U T	I N E =======================================
sub_494A:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, ForSW
		inc	(hl)
		ld	hl, (pStkPos)
		ld	(Ptr), hl
		ld	a, (Token)
		ld	(IT), a
		xor	a
		ld	(I1), a
loc_4961:
		ld	hl, (Ptr)
		ld	a, (hl)
		cp	Space
		jp	z, loc_4988
		ld	a, (hl)
		cp	0Dh
		jp	z, loc_4997
		ld	a, (hl)
		cp	Quotes
		jp	nz, loc_497E
		ld	a, (I1)
		xor	00000001b
		ld	(I1), a
loc_497E:
		ld	hl, (Ptr)
		inc	hl
		ld	(Ptr), hl
		jp	loc_4961
loc_4988:
		ld	a, (I1)
		cp	1
		jp	z, loc_497E
		ld	hl, (Ptr)
		inc	hl
		ld	(Ptr), hl
loc_4997:
		ld	a, (Mode)
		cp	0
		jp	nz, loc_49AC
		ld	de, (pStkStart)
		ld	hl, (Ptr)
		or	a
		sbc	hl, de
		ld	(Ptr), hl
loc_49AC:
		ld	hl, (Ptr)
		call	sub_97BE
		ld	a, (IT)
		ld	(Token), a
		ret
; End of function sub_494A
; =============== S U B	R O U T	I N E =======================================
; Push global on stack
PushGlobal:
		ld	a, (IndFL)
		ld	(ix+0),	a
		inc	ix
		ld	a, (NR)
		ld	(ix+0),	a
		inc	ix
		ld	a, (SetSW)
		ld	(ix+0),	a
		inc	ix
		ld	a, (GLB)
		ld	(ix+0),	a
		inc	ix
		xor	a
		ld	(IndFL), a
		ld	a, 0
		ld	(SetSW), a
		ret
; End of function PushGlobal
; =============== S U B	R O U T	I N E =======================================
sub_49E3:
		call	SSChk		; Check	for room on the	syntax stack
		ld	ix, (SetBs)
		call	SSChk		; Check	for room on the	syntax stack
		xor	a
		ld	(SetFL), a
		ret
; End of function sub_49E3
; =============== S U B	R O U T	I N E =======================================
sub_49F2:
		call	SSChk		; Check	for room on the	syntax stack
		ret
; End of function sub_49F2
; =============== S U B	R O U T	I N E =======================================
; Body of XECUTE command
bcXecute:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
		ld	(Ptr), ix
		ld	hl, (Ptr)
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(Ptr), hl
		ld	hl, IndSW
		inc	(hl)
		ld	a, (StrLen)
		cp	255
		jp	z, Error11	; String too long
		ld	hl, StrLen
		inc	(hl)
		ld	(ix+0),	0Dh	; Adds a CR to the end of the command
		inc	ix
		ld	a, (StrLen)
		ld	(ix+0),	a
		inc	ix
		call	sub_55A0
		ld	hl, byte_A668	; (todo) Check this
		call	sub_97D5
		ld	hl, ibcdUnk07
		call	CharToStr	; Convert char (0-255) to string
		ld	hl, (pRtnName)
		call	sub_97D5
		ld	a, (ForSW)
		ld	(ix+0),	a
		inc	ix
		ld	a, (IndFL)
		ld	(ix+0),	a
		inc	ix
		ld	a, (Mode)
		ld	(ix+0),	a
		inc	ix
		ld	a, 2
		ld	(Mode),	a
		xor	a
		ld	(ForSW), a
		ld	(IndFL), a
		ld	hl, (Ptr)
		ld	(pStkStart), hl
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		jp	MainLoop5	; Execute command
; End of function bcXecute
; =============== S U B	R O U T	I N E =======================================
; Make stack ToS to string for $CHAR
AC104:
		ld	(ix+0),	3
		inc	ix
		ret
; End of function AC104
; =============== S U B	R O U T	I N E =======================================
sub_4A81:
		ld	a, 1
		ld	(IOTemp2), a
		ld	hl, bmActFlag
		ld	a, (hl)
		or	00000010b
		ld	(hl), a
		ret
; End of function sub_4A81
; =============== S U B	R O U T	I N E =======================================
sub_4A8E:
		call	SSChk		; Check	for room on the	syntax stack
		call	Null1
		call	sub_50FE
		ld	(pIndex), ix
		ld	de, (Ptr)
		ld	hl, (pIndex)
		or	a
		sbc	hl, de
		ld	(pIndex), hl
		ld	hl, (Ptr)
		ld	a, (hl)
		ld	(Count), a
		ld	(Ptr2),	hl
		inc	hl
		ld	(Ptr1),	hl
		ld	bc, (pIndex)
		ld	hl, (Ptr)
		ex	de, hl
		ld	hl, (Ptr1)
		call	sub_971B
		ld	(Ptr1),	hl
		ex	de, hl
		ld	(Ptr), hl
		dec	ix
		ld	hl, Count
		inc	(hl)
		ld	a, (Count)
		ld	(ix+0),	a
		inc	ix
		ret
; End of function sub_4A8E
; =============== S U B	R O U T	I N E =======================================
sub_4ADA:
		dec	ix
		ld	a, (ix+0)
		ld	(Count), a
		ld	(ix+0),	0
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ld	hl, Count
		inc	(hl)
		ld	a, (Count)
		ld	(ix+0),	a
		inc	ix
		ret
; End of function sub_4ADA
; =============== S U B	R O U T	I N E =======================================
; Check	for end	on name	level indirection
CkEndNLI:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Token)
		cp	tknCRLF		; Is it	CR or LF?
		jp	nz, Error24	; Illegal use of indirection
CkEndNLI1:				; Return from indirection
		call	IndRet
		ld	a, (IndFL)
		cp	2
		jp	nz, CkEndNLIEnd
		ld	a, (Token)
		cp	tknCRLF		; Is it	CR or LF?
		jp	z, CkEndNLI1
CkEndNLIEnd:
		ret
; End of function CkEndNLI
; =============== S U B	R O U T	I N E =======================================
; Put indirect string on stack
AC109:
		call	SSChk		; (todo)
		ld	a, 4
		ld	(Case),	a
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
		ld	(Ptr), ix
		ld	hl, (Ptr)
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(Ptr), hl
		ld	a, (StrLen)
		cp	255
		jp	z, Error11	; String too long
		ld	hl, StrLen
		inc	(hl)
		ld	(ix+0),	0Dh
		inc	ix
		ld	a, (StrLen)
		ld	(ix+0),	a
		inc	ix
		ld	hl, (pStkStart)
		ld	(pLineBefore), hl
		ld	a, (Mode)
		cp	0
		jp	nz, loc_4B7E
		ld	de, (pLineBefore)
		ld	hl, (pStkPos)
		or	a
		sbc	hl, de
		ld	(pStkPos), hl
		ld	de, (pStartOfRtn)
		ld	hl, (pLineBefore)
		or	a
		sbc	hl, de
		ld	(pLineBefore), hl
loc_4B7E:
		ld	hl, (pLineBefore)
		call	sub_97BE
		ld	hl, (pStkPos)
		call	sub_97BE
		ld	a, (IndFL)
		ld	(ix+0),	a
		inc	ix
		ld	a, (Mode)
		ld	(ix+0),	a
		inc	ix
		ld	a, 3
		ld	(Mode),	a
		ld	hl, (Ptr)
		ld	(pStkPos), hl
		ld	(pStkStart), hl
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, 1
		ld	(IndFL), a
		ld	(Case),	a
		ret
; End of function AC109
; =============== S U B	R O U T	I N E =======================================
; Check	for end	of all levels of name indir
AC110:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (IndFL)
		cp	1
		jp	nz, AC1102
AC1101:
		ld	a, (Token)
		cp	tknCRLF		; Is it	CR or LF?
		jp	nz, Error24	; Illegal use of indirection
		call	IndRet		; Return from indirection
		ld	a, (IndFL)
		cp	1
		jp	z, AC1101
AC1102:
		ret
; End of function AC110
; =============== S U B	R O U T	I N E =======================================
; Body of ZDELETE command
bczDelete:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (RoutinesDR)
		ld	(Drive), a
		ld	a, 1
		ld	(FCBType), a	; 0:Global, 1:Routine, 2:File
		call	FFirst		; Find first file
		call	FDelete		; Delete file
		ret
; End of function bczDelete
; =============== S U B	R O U T	I N E =======================================
sub_4BEC:
		ld	hl, (pEndOfRtn)
		ld	(pCurRtnLine), hl
		ret
; End of function sub_4BEC
; =============== S U B	R O U T	I N E =======================================
sub_4BF3:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (pCurRtnLine)
		ex	de, hl
		ld	hl, (pEndOfRtn)
		or	a
		sbc	hl, de
		jp	z, locret_4C0C
		ld	hl, (pCurRtnLine)
		ld	(Ptr), hl
		call	sub_5F1D
locret_4C0C:
		ret
; End of function sub_4BF3
; =============== S U B	R O U T	I N E =======================================
sub_4C0D:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_5A7B
		ld	hl, (pEndOfRtn)
		ex	de, hl
		ld	hl, (pCurRtnLine)
		or	a
		sbc	hl, de
		jp	z, locret_4C3D
		ld	hl, (pCurRtnLine)
		ld	(Ptr1),	hl
		ld	(Ptr3),	hl
loc_4C29:
		ld	hl, (Ptr3)
		inc	hl
		ld	(Ptr3),	hl
		ld	a, (hl)
		cp	0Ah
		jp	nz, loc_4C29
		inc	hl
		ld	(Ptr3),	hl
		call	sub_5D7A
locret_4C3D:
		ret
; End of function sub_4C0D
; =============== S U B	R O U T	I N E =======================================
sub_4C3E:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, ibcdVmin1
		call	CharToStr	; Convert char (0-255) to string
		ret
; End of function sub_4C3E
; =============== S U B	R O U T	I N E =======================================
; Body of $ZEXISTS function
bfzExists:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 2
		ld	(FCBType), a	; 0:Global, 1:Routine, 2:File
		ld	a, (RoutinesDR)
		ld	(Drive), a
		ld	hl, (pDevice)
		ld	(pIndex), hl
		ld	hl, Backslash
		ld	(Ptr), hl
		ld	hl, Ptr
		ld	(pDevice), hl
		call	FFirst		; Find first file
		ld	a, (Result)
		call	IntToStr
		ld	hl, (pIndex)
		ld	(pDevice), hl
		ret
; End of function bfzExists
; =============== S U B	R O U T	I N E =======================================
; Converts device # to short
DevNtoShort:
		call	SSChk		; Check	for room on the	syntax stack
		call	StrToChar	; Converts a string on ToS to char (0-255)
		ld	(DeviceInUse), a
		ld	a, (Result)
		cp	0
		jp	z, Error52	; Invalid device number
		ld	a, 5
		ld	hl, DeviceInUse
		cp	(hl)
		jp	c, Error52	; Invalid device number
		ld	a, (DeviceInUse)
		ld	(ix+0),	a
		inc	ix
		call	ZeroToS		; Zero Top of Stack
		ret
; End of function DevNtoShort
; =============== S U B	R O U T	I N E =======================================
sub_4C9E:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(CmdLineSz), a
		ld	(word_02B0), ix
		ld	hl, (word_02B0)
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(word_02B0), hl
		ld	(word_0274), hl
		call	sub_5DB5
		ld	ix, (word_0274)
		call	SSChk		; Check	for room on the	syntax stack
		ret
; End of function sub_4C9E
; =============== S U B	R O U T	I N E =======================================
sub_4CC9:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		ld	a, (ix+0)
		ld	(Count), a
loc_4CD4:
		ld	a, (Count)
		or	a
		jp	z, loc_4D29
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
		or	a
		jp	z, loc_4D22
		cp	1
		jp	nz, Error20	; Illegal expression
		dec	ix
		ld	a, (ix+0)
		ld	(tmpChar), a
		ld	hl, tmpChar
		ld	a, 11011111b
		and	(hl)
		ld	(hl), a
		ld	a, (tmpChar)
		sub	41h		; 'A'
		ld	(tmpChar), a
		ld	a, (Count)
		cp	1
		jp	nz, loc_4D19
		ld	a, (tmpChar)
		ld	(RoutinesDR), a
		call	Null2
		jp	loc_4D22
loc_4D19:
		call	sub_7367
		ld	a, (tmpChar)
		ld	(GlobalsDR), a
loc_4D22:
		ld	hl, Count
		dec	(hl)
		jp	loc_4CD4
loc_4D29:
		call	sub_7367
		call	DiskReset	; Reset	disk system
		ret
; End of function sub_4CC9
; =============== S U B	R O U T	I N E =======================================
sub_4D30:
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I1), a
		cp	1
		jp	nz, Error30	; Unimplemented	operation
		dec	ix
		ld	a, (ix+0)
		ld	(IT), a
		ld	a, (Mode)
		cp	1
		jp	nz, locret_4D6D
		ld	a, (IT)
		cp	31h		; '1'
		jp	z, loc_4D66
		cp	32h		; '2'
		jp	nz, Error30	; Unimplemented	operation
		ld	hl, byte_A69C
		ld	a, (hl)
		or	00000010b
		ld	(hl), a
		jp	locret_4D6D
loc_4D66:
		ld	hl, byte_A69C
		ld	a, (hl)
		or	00000100b
		ld	(hl), a
locret_4D6D:
		ret
; End of function sub_4D30
; =============== S U B	R O U T	I N E =======================================
sub_4D6E:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(IT), a
		ld	(Ptr), ix
		ld	hl, (Ptr)
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(Ptr), hl
		inc	hl
		inc	hl
		ld	(Ptr1),	hl
		ex	de, hl
		ld	hl, (Ptr)
		ld	a, (IT)
		call	ShiftUp		; Shifts the stack towards the top
		ld	(hl), 0
		inc	hl
		ld	(Ptr), hl
		ld	(hl), a
		ld	hl, IT
		inc	(hl)
		inc	(hl)
		ld	a, (IT)
		ld	l, a
		ld	h, 0
		ld	(Ptr1),	hl
		call	sub_97BE
		ret
; End of function sub_4D6E
; =============== S U B	R O U T	I N E =======================================
sub_4DB3:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (Vptr)
		ld	(Ptr), hl
		ld	(word_02C8), ix
		ld	hl, FReal
		call	NumToStr	; Converts a number to a string	ToS
		call	sub_33D6
		ld	(Ptr), ix
		ld	a, (byte_04F3)
		ld	(I1), a
loc_4DD3:
		ld	hl, (Ptr)
		dec	hl
		dec	hl
		ld	(Ptr), hl
		ld	a, (I1)
		cp	1
		jp	z, loc_4DF7
		ld	a, (hl)
		ld	(byte_04EC), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(Ptr), hl
		ld	hl, I1
		dec	(hl)
		jp	loc_4DD3
loc_4DF7:
		ld	hl, (Ptr)
		ld	a, (hl)
		ld	(byte_04ED), a
		ld	a, (byte_04F3)
		ld	(ix+0),	a
		inc	ix
		ret
; End of function sub_4DB3
; =============== S U B	R O U T	I N E =======================================
sub_4E07:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, Error55	; Invalid read count
		ld	a, (hl)
		and	11110000b
		jp	nz, Error55	; Invalid read count
		call	IntToChar	; Integer to char (0-255)
		ld	(byte_0545), a
		ld	a, (Result)
		cp	1
		jp	z, locret_4E31
		ld	a, 255
		ld	(byte_0545), a
locret_4E31:
		ret
; End of function sub_4E07
; =============== S U B	R O U T	I N E =======================================
; Body of $ZCHECK function
bfcCheck:
		call	SSChk		; Check	for room on the	syntax stack
		xor	a
		ld	(IT), a
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
		ld	(Ptr), ix
bfcCheck1:
		ld	a, (StrLen)
		or	a
		jp	z, bfcCheck2
		ld	hl, (Ptr)
		dec	hl
		ld	(Ptr), hl
		ld	a, (hl)
		ld	(tmpChar), a
		ld	hl, IT
		xor	(hl)
		ld	(hl), a
		ld	hl, StrLen
		dec	(hl)
		jp	bfcCheck1
bfcCheck2:
		ld	ix, (Ptr)
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (IT)
		call	IntToStr
		ret
; End of function bfcCheck
; =============== S U B	R O U T	I N E =======================================
sub_4E73:
		ld	(ix+0),	30h	; '0'
		inc	ix
		ld	(ix+0),	1
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ret
; End of function sub_4E73
; =============== S U B	R O U T	I N E =======================================
sub_4E86:
		ld	a, 1
		ld	(byte_A6A4), a
		ld	a, (Result)
		ld	(ix+0),	a
		inc	ix
		ld	a, (Case)
		ld	(ix+0),	a
		inc	ix
		ret
; End of function sub_4E86
; =============== S U B	R O U T	I N E =======================================
sub_4E9C:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
		call	CharToStr	; Convert char (0-255) to string
		call	CharToStr	; Convert char (0-255) to string
		ret
; End of function sub_4E9C
; =============== S U B	R O U T	I N E =======================================
sub_4EAC:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_50CC
		ld	a, (byte_04CC)
		or	a
		jp	z, Error46	; Subscript missing
		call	sub_7974
		ld	hl, glbptrUnk
		ld	de, Nil
		call	JDEN
		jp	z, loc_4F60
		call	sub_70A8
		call	FindKey		; Find place for a key
		ld	a, (Result)
		cp	0
		jp	z, loc_4F60
		call	sub_6CE3
		call	sub_71EA
		ld	a, (Result)
		cp	0
		jp	z, loc_4F60
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	a, (hl)
		ld	(byte_04CC), a
		inc	hl
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ld	ix, (word_02A4)
		call	SSChk		; Check	for room on the	syntax stack
		ld	(ix+0),	Carat
		inc	ix
		ld	hl, (word_02F2)
		inc	hl
		ld	(word_02F2), hl
		ld	a, (NameLen)
		call	sub_97B3
		ld	(word_02F2), hl
		ld	(ix+0),	LeftP
		inc	ix
		ld	hl, NameLen
		inc	(hl)
		inc	(hl)
		inc	(hl)
		ld	a, 1
		ld	(byte_A60F), a
loc_4F21:
		call	sub_5861
		ld	a, (NameLen)
		ld	hl, IT
		add	a, (hl)
		ld	(NameLen), a
		ld	a, (byte_04CC)
		cp	1
		jp	z, loc_4F47
		ld	(ix+0),	Comma
		inc	ix
		ld	hl, NameLen
		inc	(hl)
		ld	hl, byte_04CC
		dec	(hl)
		jp	loc_4F21
loc_4F47:
		ld	(ix+0),	RightP
		inc	ix
		xor	a
		ld	(byte_A60F), a
loc_4F51:
		ld	a, (NameLen)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ret
loc_4F60:
		ld	ix, (word_02A4)
		call	SSChk		; Check	for room on the	syntax stack
		xor	a
		ld	(NameLen), a
		jp	loc_4F51
; End of function sub_4EAC
; =============== S U B	R O U T	I N E =======================================
sub_4F6E:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (pStkPos)
		ld	(pIndex), hl
		ld	a, 1
		ld	(byte_A69F), a
		ld	hl, (Ptr3)
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, (StrLen)
		ld	(I1), a
		ld	a, 0Fh
		ld	(IT), a
		ld	a, 0
		ld	(ITX), a
		ld	(Result), a
		ld	a, (I1)
		cp	1
		jp	nz, loc_4FA9
		ld	hl, (pStkPos)
		ld	a, (hl)
		cp	30h		; '0'
		jp	z, loc_5064
loc_4FA9:
		ld	a, (Token)
		cp	6		; Is it	'-'?
		jp	nz, loc_4FCF
		ld	a, 1
		ld	(ITX), a
		ld	hl, (Ptr3)
		inc	hl
		ld	(Ptr3),	hl
		ld	hl, I1
		dec	(hl)
		ld	hl, StrLen
		dec	(hl)
		ld	a, (I1)
		or	a
		jp	z, loc_5084
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
loc_4FCF:
		ld	hl, IT
		inc	(hl)
		ld	a, (Token)
		cp	1Ch		; Is it	'.'?
		jp	z, loc_5025
		cp	3		; Is it	'0' to '9'?
		jp	nz, loc_5084
		ld	hl, (pStkPos)
		ld	a, (hl)
		cp	30h		; '0'
		jp	z, loc_5084
loc_4FE9:
		ld	a, (ITX)
		cp	0
		jp	z, loc_4FFB
		ld	a, 69h		; 'i'
		ld	hl, (pStkPos)
		sub	(hl)
		ld	(I2), a
		ld	(hl), a
loc_4FFB:
		ld	hl, I1
		dec	(hl)
		ld	hl, IT
		inc	(hl)
		ld	a, (IT)
		cp	1Dh
		jp	z, loc_5084
		ld	a, (I1)
		or	a
		jp	z, loc_5064
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, (Token)
		cp	1Ch		; Is it	'.'?
		jp	z, loc_5025
		cp	3		; Is it	'0' to '9'?
		jp	nz, loc_5084
		jp	loc_4FE9
loc_5025:
		ld	hl, I1
		dec	(hl)
		ld	a, (I1)
		or	a
		jp	z, loc_5084
loc_5030:				; Loads	to (Token) the token code of char (++pStkPos)
		call	GToken
		ld	a, (Token)
		cp	3		; Is it	'0' to '9'?
		jp	nz, loc_5084
		ld	hl, (pStkPos)
		ld	a, (hl)
		ld	(Count), a
		ld	a, (ITX)
		cp	0
		jp	z, loc_5051
		ld	a, 69h		; 'i'
		sub	(hl)
		ld	(I2), a
		ld	(hl), a
loc_5051:
		ld	hl, I1
		dec	(hl)
		ld	a, (I1)
		or	a
		jp	nz, loc_5030
		ld	a, (Count)
		cp	30h		; '0'
		jp	z, loc_5084
loc_5064:
		ld	a, (ITX)
		cp	0
		jp	z, loc_507C
		ld	a, 1Eh
		ld	hl, IT
		sub	(hl)
		ld	(I2), a
		ld	(IT), a
		ld	hl, (pStkPos)
		inc	(hl)
loc_507C:
		ld	a, 1
		ld	(Result), a
		jp	loc_50BD
loc_5084:
		ld	a, (ITX)
		cp	0
		jp	z, loc_50BD
		ld	hl, (Ptr3)
		inc	hl
		ld	(pStkPos), hl
		ld	a, (StrLen)
		ld	hl, I1
		sub	(hl)
		ld	(I2), a
loc_509D:				; 'i'
		ld	a, 69h
		ld	hl, (pStkPos)
		sub	(hl)
		ld	(I1), a
		ld	(hl), a
		ld	hl, I2
		dec	(hl)
		ld	a, (I2)
		or	a
		jp	nz, loc_509D
		ld	hl, StrLen
		inc	(hl)
		ld	hl, (Ptr3)
		dec	hl
		ld	(Ptr3),	hl
loc_50BD:
		ld	hl, (pIndex)
		xor	a
		ld	(byte_A69F), a
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ret
; End of function sub_4F6E
; =============== S U B	R O U T	I N E =======================================
sub_50CC:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_9789
		ld	(word_02C0), hl
		ld	(word_02F2), ix
		ld	de, (word_02C0)
		ld	hl, (word_02F2)
		or	a
		sbc	hl, de
		ld	(word_02F2), hl
		ld	(word_02A4), hl
		ld	a, (hl)
		ld	(byte_04CC), a
		inc	hl
		ld	(word_02F2), hl
		ld	a, (hl)
		ld	(NameLen), a
		ld	c, a
		ld	b, 0
		add	hl, bc
		inc	hl
		ld	(word_A640), hl
		ret
; End of function sub_50CC
; =============== S U B	R O U T	I N E =======================================
sub_50FE:
		ld	(Ptr), ix
		ld	hl, (Ptr)
		dec	hl
		dec	hl
		ld	e, (hl)
		ld	d, 0
		or	a
		sbc	hl, de
		dec	hl
		ld	(Ptr), hl
		ret
; End of function sub_50FE
; =============== S U B	R O U T	I N E =======================================
sub_5112:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (word_02E4)
		ex	de, hl
		ld	hl, (word_02DE)
		ld	a, (de)
		cp	(hl)
		jp	nz, loc_5175
		ld	a, (IODevice)
		or	a
		jp	nz, loc_512E
		call	sub_9998
		jp	loc_5164
loc_512E:
		ld	a, (IODevice)
		cp	5
		jp	nz, loc_513C
		call	sub_94A7
		jp	loc_5164
loc_513C:
		ld	hl, (pDevice)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	a, (hl)
		ld	(Drive), a
		inc	hl
		ld	(pFCBAddr), hl
		ld	hl, (word_02E0)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(pFRWBuffer), hl
		ld	hl, (word_02D4)
		ld	a, (hl)
		and	00000010b
		jp	z, loc_5161
		call	FSeqWrite	; Sequential write file
loc_5161:
		call	sub_9D7F
loc_5164:
		ld	hl, (word_02E4)
		ld	(hl), 0
		ld	hl, (word_02E0)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (word_02E2)
		ld	(hl), e
		inc	hl
		ld	(hl), d
loc_5175:
		ld	hl, (word_02E2)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(Ptr), hl
		ld	a, (hl)
		ld	(tmpChar), a
		cp	1Ah
ifdef BINMODE
		; Binary file mode
		nop
		nop
		nop
		;
else
		; Regular file mode
		jp	z, locret_5197
endif
		inc	hl
		ld	(Ptr), hl
		ex	de, hl
		ld	hl, (word_02E2)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (word_02E4)
		inc	(hl)
locret_5197:
		ret
; End of function sub_5112
; =============== S U B	R O U T	I N E =======================================
sub_5198:
		call	SSChk		; Check	for room on the	syntax stack
		ld	(ix+0),	1
		inc	ix
		ld	(word_0502), ix
		ld	hl, (word_0502)
		dec	hl
		dec	hl
		dec	hl
		ld	e, (hl)
		ld	d, 0
		or	a
		sbc	hl, de
		ld	(Ptr), hl
		ld	(word_0510), hl
		dec	hl
		ld	a, (hl)
		ld	(I1), a
		dec	hl
		ld	(Ptr), hl
		cp	1
		jp	z, loc_51D3
		ld	a, (hl)
		ld	(I2), a
		ld	a, (I1)
		ld	hl, I2
		add	a, (hl)
		ld	(I1), a
loc_51D3:
		ld	hl, (Ptr)
		dec	hl
		dec	hl
		ld	e, (hl)
		ld	d, 0
		or	a
		sbc	hl, de
		ld	(Ptr), hl
		ld	hl, I1
		dec	(hl)
		ld	a, (I1)
		or	a
		jp	nz, loc_51D3
		ld	ix, (Ptr)
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		ld	a, (ix+0)
		ld	(IOTemp1), a
		ld	a, 1
		ld	(ForFL), a
		ld	a, (IOTemp1)
		cp	1
		jp	z, loc_5215
		call	sub_443E
		ld	hl, (word_02F2)
		ld	a, (hl)
		or	10000000b
		ld	(hl), a
		jp	loc_5218
loc_5215:
		call	sub_42C0
loc_5218:
		ld	(Ptr1),	ix
		ld	hl, (Ptr1)
		ld	(word_0502), hl
		dec	hl
		dec	hl
		ld	a, (hl)
		ld	(I1), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(Ptr1),	hl
		ld	ix, (word_0510)
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		ld	a, (ix+0)
		ld	(Case),	a
		dec	ix
		ld	a, (ix+0)
		ld	(Result), a
		call	sub_52E3
		ld	ix, (word_0502)
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (I3)
		or	a
		jp	z, locret_52E2
		ld	a, (Result)
		cp	0
		jp	z, Error11	; String too long
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I1), a
		ld	a, (I3)
		ld	(IT), a
		ld	a, (I1)
		ld	l, a
		ld	h, 0
		ld	(pIndex), hl
loc_527A:
		ld	hl, (pIndex)
		ld	a, (I2)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(pIndex), hl
		ld	hl, IT
		dec	(hl)
		ld	a, (IT)
		or	a
		jp	nz, loc_527A
		call	sub_9321
		call	StrToChar	; Converts a string on ToS to char (0-255)
		ld	(I1), a
		ld	a, (Result)
		cp	0
		jp	z, Error11	; String too long
loc_52A3:
		ld	hl, (Ptr2)
		ld	a, (I2)
		call	sub_97B3
		ld	a, (I2)
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(Ptr2),	hl
		ld	hl, I3
		dec	(hl)
		ld	a, (I3)
		or	a
		jp	nz, loc_52A3
		ld	(word_050C), ix
		ld	a, (I1)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		xor	a
		ld	(byte_0547), a
		ld	(byte_0546), a
		ld	hl, (word_050C)
		ld	(word_050A), hl
locret_52E2:
		ret
; End of function sub_5198
; =============== S U B	R O U T	I N E =======================================
sub_52E3:
		call	SSChk		; Check	for room on the	syntax stack
		xor	a
		ld	(I3), a
		ld	a, (Case)
		cp	1
		jp	nz, loc_52FE
		ld	de, ibcdTemp0
		ld	hl, ibcdV1
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		jp	loc_531A
loc_52FE:
		ld	a, (Result)
		cp	0
		jp	z, loc_530C
		ld	hl, ibcdTemp1
		call	StrToInt	; Converts string on ToS to integer
loc_530C:
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
		ld	a, (Result)
		cp	1
		jp	z, loc_5323
loc_531A:
		ld	de, ibcdTemp1
		ld	hl, ibcdTemp0
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
loc_5323:
		ld	(word_050E), ix
		ld	hl, (word_050E)
		ld	bc, 0FFFEh
		add	hl, bc
		ld	a, (hl)
		ld	(I2), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(word_050E), hl
		ld	(Ptr2),	hl
		ld	a, (byte_0549)
		or	a
		jp	nz, loc_5359
		ld	bc, 0FFFEh	; 65534
		add	hl, bc
		ld	a, (hl)
		ld	(I1), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(word_050E), hl
		ld	(Ptr1),	hl
loc_5359:
		ld	hl, ibcdTemp1
		ld	a, (hl)
		and	11110000b
		jp	nz, loc_5493
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, loc_5493
		ld	hl, ibcdTemp0
		ld	a, (hl)
		and	11110000b
		jp	nz, loc_5376
		jp	loc_537F
loc_5376:
		ld	de, ibcdTemp0
		ld	hl, ibcdV0
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
loc_537F:
		ld	hl, ibcdTemp0
		ld	de, ibcdTemp1
		call	SCmp0		; Compares two strings (sets BC=INTLN*257 first)
		jp	c, loc_5493
		ld	a, (I2)
		or	a
		jp	z, loc_545C
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, loc_53B0
		ld	c, 5
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		call	IntToChar	; Integer to char (0-255)
		ld	(I3), a
		ld	a, (Result)
		cp	0
		jp	z, loc_549F
		jp	loc_53B4
loc_53B0:
		xor	a
		ld	(I3), a
loc_53B4:
		ld	a, (I3)
		or	a
		jp	z, loc_53F3
		ld	hl, (Ptr2)
		ex	de, hl
		ld	hl, (Ptr1)
		ld	a, (I1)
		ld	b, a
		ld	a, (I2)
		call	sub_95A6
		ld	(Ptr1),	hl
		ld	(IT), a
		ld	a, (Result)
		cp	0
		jp	z, loc_543B
		ld	a, (I1)
		ld	hl, IT
		sub	(hl)
		ld	(I1), a
		ld	hl, I3
		dec	(hl)
		ld	hl, ibcdTemp1
		ld	c, 5
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		jp	loc_53B4
loc_53F3:
		ld	hl, (Ptr1)
		ld	(Ptr), hl
		ld	a, (I1)
		ld	(IT), a
loc_53FF:
		ld	hl, (Ptr2)
		ex	de, hl
		ld	hl, (Ptr1)
		ld	a, (I1)
		ld	b, a
		ld	a, (I2)
		call	sub_95A6
		ld	(Ptr1),	hl
		ld	(N), a
		ld	a, (Result)
		cp	0
		jp	z, loc_5470
		ld	a, (I1)
		ld	hl, N
		sub	(hl)
		ld	(I1), a
		ld	hl, ibcdTemp1
		ld	c, 5
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, loc_5444
		jp	loc_53FF
loc_543B:
		ld	hl, (Ptr1)
		ld	(Ptr), hl
		jp	loc_5474
loc_5444:
		ld	a, (IT)
		ld	hl, I1
		sub	(hl)
		ld	hl, I2
		sub	(hl)
		ld	(IT), a
		ld	a, (I1)
		add	a, (hl)
		ld	(I1), a
		jp	loc_5474
loc_545C:
		ld	hl, (Ptr1)
		ld	a, (I1)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(Ptr), hl
		xor	a
		ld	(IT), a
		ld	(I3), a
loc_5470:
		xor	a
		ld	(I1), a
loc_5474:
		ld	a, (I1)
		ld	(byte_0547), a
		ld	a, (IT)
		ld	(byte_0546), a
		ld	hl, (Ptr)
		ld	(word_050C), hl
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(word_050A), hl
		ld	a, 1
		ld	(Result), a
locret_5492:
		ret
loc_5493:
		xor	a
		ld	(byte_0546), a
		ld	a, 0
		ld	(Result), a
		jp	locret_5492
loc_549F:
		ld	a, 255
		ld	(I3), a
		jp	locret_5492
; End of function sub_52E3
; =============== S U B	R O U T	I N E =======================================
; Outputs the character	on A to	the current IODevice
writeChar:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (IODevice)
		or	a
		jp	nz, writeChar1
		ld	a, (tmpChar)
		call	putChar		; Outputs the character	on A to	the console
		ret
writeChar1:
		ld	a, (IODevice)
		cp	1
		jp	nz, writeChar2
		ld	a, (tmpChar)
		call	PrtOut		; Write	a character to the printer device
		ret
writeChar2:
		ld	a, (IODevice)
		cp	5
		jp	nz, writeChar3
		call	AuxOut		; Writes a character to	the AUX	device
		ret
writeChar3:
		ld	hl, (word_02D4)
		ld	a, (hl)
		and	00001000b
		jp	nz, writeChar4
		ld	hl, (word_02E0)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (word_02E2)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (word_02E4)
		ld	(hl), 0
writeChar4:
		ld	hl, (word_02D4)
		ld	a, (hl)
		or	00000010b
		ld	(hl), a
		ld	hl, (word_02E2)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(pIndex), hl
		ld	a, (tmpChar)
		ld	(hl), a
		ld	hl, (word_02E4)
		inc	(hl)
		ld	hl, (pIndex)
		inc	hl
		ld	(pIndex), hl
		ex	de, hl
		ld	hl, (word_02E2)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (word_02E4)
		ex	de, hl
		ld	hl, (word_02DE)
		ld	a, (de)
		cp	(hl)
		jp	nz, writeChar5
		ld	hl, (pDevice)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	a, (hl)
		ld	(Drive), a
		inc	hl
		ld	(pFCBAddr), hl
		ld	hl, (word_02E0)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(pFRWBuffer), hl
		call	FSeqWrite	; Sequential write file
		ld	hl, (word_02E4)
		ld	(hl), 0
		ld	hl, (word_02E0)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (word_02E2)
		ld	(hl), e
		inc	hl
		ld	(hl), d
writeChar5:
		ld	hl, (word_02D4)
		ld	a, (hl)
		or	00001000b
		ld	(hl), a
		ret
; End of function writeChar
; =============== S U B	R O U T	I N E =======================================
sub_5555:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 1
		ld	(byte_A610), a
		call	sub_5FDE
		ld	a, 0
		ld	(byte_A610), a
		ld	hl, ibcdUnk07
		call	StrToInt	; Converts string on ToS to integer
		ld	hl, byte_A668	; (todo) Check this
		call	sub_97A2
		call	sub_5575
		ret
; End of function sub_5555
; =============== S U B	R O U T	I N E =======================================
sub_5575:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_9789
		ld	(pStkPos), hl
		call	sub_9789
		ld	(pStkStart), hl
		ld	a, (Mode)
		cp	0
		jp	nz, locret_559F
		ld	de, (pStartOfRtn)
		add	hl, de
		ld	(pStkStart), hl
		ld	de, (pStkStart)
		ld	hl, (pStkPos)
		add	hl, de
		ld	(pStkPos), hl
locret_559F:
		ret
; End of function sub_5575
; =============== S U B	R O U T	I N E =======================================
sub_55A0:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Mode)
		cp	0
		jp	nz, loc_55C5
		ld	de, (pStkStart)
		ld	hl, (pStkPos)
		or	a
		sbc	hl, de
		ld	(pStkPos), hl
		ld	de, (pStartOfRtn)
		ld	hl, (pStkStart)
		or	a
		sbc	hl, de
		ld	(pStkStart), hl
loc_55C5:
		ld	hl, (pStkStart)
		call	sub_97BE
		ld	hl, (pStkPos)
		call	sub_97BE
		ret
; End of function sub_55A0
; =============== S U B	R O U T	I N E =======================================
sub_55D2:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Mode)
		cp	1
		jp	z, loc_565E
		ld	hl, (pStkStart)
		ld	(pLineBefore), hl
		ld	hl, (pStkPos)
		ld	(pIndex), hl
		call	sub_55A0
		ld	hl, byte_A668
		call	sub_97D5
		ld	hl, ibcdUnk07
		call	CharToStr	; Convert char (0-255) to string
		ld	hl, (pRtnName)
		call	sub_97D5
		ld	a, (IndFL)
		ld	(ix+0),	a
		inc	ix
		ld	a, (ForSW)
		ld	(ix+0),	a
		inc	ix
		ld	a, (IndSW)
		ld	(ix+0),	a
		inc	ix
		ld	a, (DoSW)
		ld	(ix+0),	a
		inc	ix
		ld	a, (Mode)
		ld	(ix+0),	a
		inc	ix
		ld	a, (IODevice)
		ld	(ix+0),	a
		inc	ix
		xor	a
		ld	(IndFL), a
		ld	(IndSW), a
		ld	(ForSW), a
		ld	(DoSW),	a
		ld	(IODevice), a
		ld	hl, byte_A69D
		inc	(hl)
		ld	a, 1
		ld	(Mode),	a
		ld	hl, (pLineBefore)
		ld	(pStkStart), hl
		ld	hl, (pIndex)
		ld	(pStkPos), hl
		ld	a, 7
		ld	(bmFlag), a
		call	putAsterisk	; Places an asterisk under the error position
		call	sub_929E
loc_565E:
		xor	a
		ld	(byte_A69C), a
		ret
; End of function sub_55D2
; =============== S U B	R O U T	I N E =======================================
sub_5663:
		ld	a, (byte_A699)
		or	a
		jp	z, locret_5699
		cp	1
		jp	nz, Error48	; Invalid parameter
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(IT), a
		cp	1
		jp	nz, Error48	; Invalid parameter
		dec	ix
		ld	a, (ix+0)
		cp	30h		; '0'
		jp	z, loc_5694
		cp	31h		; '1'
		jp	nz, Error48	; Invalid parameter
		xor	a
		ld	(byte_A6A2), a
		jp	locret_5699
loc_5694:
		ld	a, 255
		ld	(byte_A6A2), a
locret_5699:
		ret
; End of function sub_5663
; =============== S U B	R O U T	I N E =======================================
sub_569A:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (byte_A699)
		cp	3
		jp	nz, loc_56F4
		ld	a, (IT)
		cp	3
		jp	nz, loc_56E1
		ld	hl, (Ptr)
		dec	hl
		ld	(Ptr), hl
		ld	a, (hl)
		cp	44h		; 'D'
		jp	nz, loc_56E1
		dec	hl
		ld	(Ptr), hl
		ld	a, (hl)
		cp	4Eh		; 'N'
		jp	nz, loc_56E1
		dec	hl
		ld	(Ptr), hl
		ld	a, (hl)
		cp	45h		; 'E'
		jp	nz, loc_56E1
		ld	de, ibcdTemp0
		ld	hl, ibcdVmax
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		ld	ix, (Ptr)
		call	SSChk		; Check	for room on the	syntax stack
		jp	locret_570C
loc_56E1:
		ld	a, (IT)
		or	a
		jp	z, locret_570C
		call	ExprToInt	; Convert expression to	integer
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
		jp	locret_570C
loc_56F4:
		ld	a, (byte_A699)
		cp	4
		jp	nz, Error48	; Invalid parameter
		ld	a, (IT)
		or	a
		jp	z, locret_570C
		call	ExprToInt	; Convert expression to	integer
		ld	hl, ibcdTemp1
		call	StrToInt	; Converts string on ToS to integer
locret_570C:
		ret
; End of function sub_569A
; =============== S U B	R O U T	I N E =======================================
sub_570D:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		ld	a, (ix+0)
		ld	(byte_A699), a
		ld	(IT), a
		ld	(word_0276), ix
loc_571F:
		ld	a, (IT)
		or	a
		jp	z, loc_573B
		ld	hl, (word_0276)
		dec	hl
		dec	hl
		ld	e, (hl)
		ld	d, 0
		or	a
		sbc	hl, de
		ld	(word_0276), hl
		ld	hl, IT
		dec	(hl)
		jp	loc_571F
loc_573B:
		ld	hl, (word_0276)
		dec	hl
		ld	(word_0276), hl
		ld	a, (hl)
		ld	(DeviceInUse), a
		call	sub_574A
		ret
; End of function sub_570D
; =============== S U B	R O U T	I N E =======================================
sub_574A:
		ld	hl, DevTable
		ld	(Ptr), hl
		ld	a, (DeviceInUse)
		ld	(IT), a
loc_5756:
		ld	a, (IT)
		or	a
		jp	z, loc_576E
		ld	hl, (Ptr)
		ld	de, 14h
		add	hl, de
		ld	(Ptr), hl
		ld	hl, IT
		dec	(hl)
		jp	loc_5756
loc_576E:
		ld	hl, (Ptr)
		ld	(word_02D4), hl
		inc	hl
		ld	(Ptr), hl
		ld	(word_02D6), hl
		inc	hl
		ld	(Ptr), hl
		ld	(pDevX), hl
		ld	de, 5
		add	hl, de
		ld	(Ptr), hl
		ld	(pDevY), hl
		ld	de, 5
		add	hl, de
		ld	(Ptr), hl
		ld	(word_02DE), hl
		inc	hl
		ld	(Ptr), hl
		ld	(pDevice), hl
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	(word_02E0), hl
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	(word_02E2), hl
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	(word_02E4), hl
		ret
; End of function sub_574A
; =============== S U B	R O U T	I N E =======================================
sub_57BC:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, ibcdTemp0
		ld	a, (hl)
		and	11110000b
		jp	nz, locret_5860
		ld	hl, (word_02E0)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(pFRWBuffer), hl
		ld	hl, (word_02E0)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (word_02E2)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (word_02E4)
		ld	(hl), 0
		ld	hl, (word_02D4)
		ld	a, (hl)
		and	00000010b
		jp	z, loc_57EF
		call	FSeqWrite	; Sequential write file
loc_57EF:
		ld	hl, ibcdTemp0
		ld	de, ibcdVmax
		call	SCmp0		; Compares two strings (sets BC=INTLN*257 first)
		jp	z, loc_5826
		call	FRndRead	; Read random file record in DE
		ld	hl, ibcdTemp1
		ld	a, (hl)
		and	11110000b
		jp	nz, loc_5859
		call	IntToChar	; Integer to char (0-255)
		ld	(IT), a
		ld	a, (Result)
		cp	0
		jp	z, loc_5859
loc_5815:
		ld	a, (IT)
		or	a
		jp	z, loc_5842
		call	sub_5112
		ld	hl, IT
		dec	(hl)
		jp	loc_5815
loc_5826:				; Compute file size
		call	FSize
		ld	hl, ibcdTemp0
		ld	c, 5
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		call	FRndRead	; Read random file record in DE
loc_5834:
		call	sub_5112
		ld	a, (tmpChar)
		cp	1Ah
		jp	z, loc_5842
		jp	loc_5834
loc_5842:
		ld	a, (tmpChar)
		cp	1Ah
		jp	nz, loc_5852
		ld	hl, (word_02D6)
		ld	(hl), 1
		jp	loc_5859
loc_5852:
		ld	hl, (word_02D4)
		ld	a, (hl)
		or	00000100b
		ld	(hl), a
loc_5859:
		ld	hl, (word_02D4)
		ld	a, (hl)
		or	00011000b
		ld	(hl), a
locret_5860:
		ret
; End of function sub_57BC
; =============== S U B	R O U T	I N E =======================================
sub_5861:
		ld	hl, (VarPtr)	; Points to a var in the symbol	table
		ld	a, (hl)
		ld	(IT), a
		ld	(I5), a
		ld	(I6), a
		inc	hl
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ld	a, 0
		ld	(ITX), a
		xor	a
		ld	(I3), a
		ld	a, (hl)
		cp	0Fh
		jp	c, loc_58A1
		ld	a, (hl)
		cp	Space
		jp	c, loc_58B0
		ld	a, (byte_A60F)
		or	a
		jp	z, loc_58C3
		ld	a, 1
		ld	(I3), a
		ld	(ix+0),	Quotes
		inc	ix
		ld	hl, IT
		inc	(hl)
		inc	(hl)
		jp	loc_58C3
loc_58A1:
		ld	a, 1
		ld	(ITX), a
		ld	(ix+0),	Minus
		inc	ix
		ld	hl, IT
		inc	(hl)
loc_58B0:				; Points to a var in the symbol	table
		ld	hl, (VarPtr)
		inc	hl
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ld	hl, IT
		dec	(hl)
		ld	hl, I5
		dec	(hl)
		ld	hl, I6
		dec	(hl)
loc_58C3:				; Points to a var in the symbol	table
		ld	hl, (VarPtr)
		ld	a, (hl)
		ld	(I2), a
		ld	a, (byte_A60F)
		or	a
		jp	z, loc_58E3
		ld	a, (I2)
		cp	Quotes
		jp	nz, loc_58E3
		ld	(ix+0),	Quotes
		inc	ix
		ld	hl, IT
		inc	(hl)
loc_58E3:
		ld	a, (ITX)
		cp	0
		jp	z, loc_590E
		ld	a, (I2)
		cp	Point
		jp	z, loc_58FF
		ld	a, 69h		; 'i'
		ld	hl, I2
		sub	(hl)
		ld	(I1), a
		ld	(I2), a
loc_58FF:
		ld	hl, I5
		dec	(hl)
		ld	a, (I5)
		or	a
		jp	nz, loc_590E
		ld	hl, I2
		inc	(hl)
loc_590E:
		ld	a, (I2)
		ld	(ix+0),	a
		inc	ix
		ld	hl, (VarPtr)	; Points to a var in the symbol	table
		inc	hl
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ld	hl, I6
		dec	(hl)
		ld	a, (I6)
		or	a
		jp	nz, loc_58C3
		ld	a, (I3)
		or	a
		jp	z, locret_5935
		ld	(ix+0),	Quotes
		inc	ix
locret_5935:
		ret
; End of function sub_5861
; =============== S U B	R O U T	I N E =======================================
; Make number into a string
MkStr:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
		ld	(word_02B0), ix
		ld	hl, (word_02B0)
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(word_02B0), hl
		xor	a
		ld	(I4), a
		ld	hl, (pStkPos)
		ld	(pIndex), hl
		ld	a, 1
		ld	(byte_A69F), a
		ld	hl, (word_02B0)
		dec	hl
		ld	(pStkPos), hl
loc_5969:
		ld	a, (StrLen)
		or	a
		jp	z, loc_5A01
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, (Token)
		cp	3		; Is it	'0' to '9'?
		jp	z, loc_5999
		cp	1Ch		; Is it	'.'?
		jp	z, loc_5999
		cp	5		; Is it	'+'?
		jp	z, loc_5992
		cp	6		; Is it	'-'?
		jp	nz, loc_5A01
		ld	a, (I4)
		xor	00000001b
		ld	(I4), a
loc_5992:
		ld	hl, StrLen
		dec	(hl)
		jp	loc_5969
loc_5999:				; b2:Routine not saved
		ld	hl, bmFlag1
		ld	a, (hl)
		or	00000001b
		ld	(hl), a
		ld	(Ptr), ix
		ld	a, (IT)
		or	a
		jp	z, loc_59B1
		call	NumLit		; Check	for numeric literal
		jp	loc_59BA
loc_59B1:
		ld	a, (StrLen)
		ld	(I1), a
		call	IntLit		; Check	for integer literal
loc_59BA:				; b2:Routine not saved
		ld	hl, bmFlag1
		ld	a, 11111110b
		and	(hl)
		ld	(hl), a
		ld	a, (Result)
		cp	1
		jp	nz, loc_5A01
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I1), a
		ld	a, (I4)
		or	a
		jp	z, loc_59F1
		ld	hl, (Ptr)
		inc	hl
		ld	(word_0278), hl
		ex	de, hl
		ld	hl, (Ptr)
		ld	a, (I1)
		call	ShiftUp		; Shifts the stack towards the top
		ld	(hl), Minus
		ld	hl, I1
		inc	(hl)
loc_59F1:
		ld	hl, (word_02B0)
		ex	de, hl
		ld	hl, (Ptr)
		ld	a, (I1)
		call	ShiftDn		; Shifts the stack towards its base
		jp	loc_5A13
loc_5A01:
		ld	ix, (word_02B0)
		call	SSChk		; Check	for room on the	syntax stack
		ld	(ix+0),	30h	; '0'
		inc	ix
		ld	a, 1
		ld	(I1), a
loc_5A13:
		ld	a, (I1)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		xor	a
		ld	(byte_A69F), a
		ld	hl, (pIndex)
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ret
; End of function MkStr
; =============== S U B	R O U T	I N E =======================================
sub_5A30:
		ld	a, 1
		ld	(Result), a
		ld	a, (CmdLineSz)
		ld	(IT), a
		xor	a
		ld	(NameLen), a
		ld	hl, (word_02B0)
		ld	(pIndex), hl
loc_5A45:
		ld	hl, (pIndex)
		ld	a, (hl)
		cp	9
		jp	z, locret_5A66
		inc	hl
		ld	(pIndex), hl
		ld	hl, NameLen
		inc	(hl)
		ld	hl, IT
		dec	(hl)
		ld	a, (IT)
		or	a
		jp	nz, loc_5A45
		ld	a, 0
		ld	(Result), a
locret_5A66:
		ret
; End of function sub_5A30
; =============== S U B	R O U T	I N E =======================================
sub_5A67:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (word_A62E)
		ld	bc, 0FFFBh
		add	hl, bc
		ld	(pIndex), hl
		ld	bc, 0
		call	sub_9A68
		ret
; End of function sub_5A67
; =============== S U B	R O U T	I N E =======================================
sub_5A7B:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (Ptr)
		ld	(word_A654), hl
		ld	hl, (pRtnName)
		ld	(Ptr), hl
		call	sub_55A0
		ld	a, 1
		ld	(byte_A6A1), a
		call	sub_5AA4
		ld	a, 0
		ld	(byte_A6A1), a
		call	sub_5575
		ld	hl, (word_A654)
		ld	(Ptr), hl
		ret
; End of function sub_5A7B
; =============== S U B	R O U T	I N E =======================================
sub_5AA4:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (Ptr)
		ex	de, hl
		ld	hl, (word_9F96)
		or	a
		sbc	hl, de
		jp	z, loc_5B2F
		ld	a, (bmFlag1)	; b2:Routine not saved
		and	00000100b
		jp	nz, Error42	; Remove or save routine
		ld	hl, (Ptr)
		ld	(word_A62E), hl
		call	sub_5A67
		ld	a, (byte_A6A1)
		cp	1
		jp	z, loc_5AD0
		call	sub_63EE
loc_5AD0:
		ld	de, (word_9F96)
		ld	hl, (Ptr)
		ld	a, 0Bh
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		ld	hl, (Ptr)
		ld	(word_A62E), hl
		ld	de, 9
		add	hl, de
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_A624), hl
		ld	hl, (Ptr)
		ld	de, 6
		add	hl, de
		ld	(Ptr), hl
		ld	hl, (word_9F98)
		ld	(word_9F9A), hl
		ld	de, (word_A624)
		add	hl, de
		ld	(word_A638), hl
		ld	de, (pSymbolTbl)
		or	a
		sbc	hl, de
		jp	c, loc_5B15
		jp	loc_6088
loc_5B15:
		ld	bc, (word_A624)
		ld	hl, (word_9F9A)
		ex	de, hl
		ld	hl, (Ptr)
		call	sub_971B
		ld	(Ptr), hl
		ex	de, hl
		ld	(word_9F9A), hl
		ld	(hl), 1Ah
		call	sub_629D
loc_5B2F:
		ld	hl, (word_9F96)
		ld	(pRtnName), hl
		ld	bc, 0FFFBh
		add	hl, bc
		ld	(word_A636), hl
		ld	hl, (word_9F98)
		ld	(pStartOfRtn), hl
		ld	hl, (word_9F9A)
		ld	(pEndOfRtn), hl
		ret
; End of function sub_5AA4
; =============== S U B	R O U T	I N E =======================================
; Search routine for label
FNDLB:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 0
		ld	(Result), a
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(I1), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (INF)
		cp	1
		jp	z, FNDLBE
		ld	(Ptr), ix
		ld	hl, (pStartOfRtn)
		ld	(Ptr1),	hl
FNDLB1:
		ld	hl, (Ptr1)
		ld	a, (hl)
		cp	1Ah		; EOR
		jp	z, FNDLBE
		ld	(Ptr2),	hl
		ld	(word_0276), hl
		xor	a
		ld	(IT), a
FNDLB2:
		ld	hl, (word_0276)
		ld	a, (hl)
		cp	Space
		jp	z, FNDLB3
		ld	a, (hl)
		cp	9
		jp	z, FNDLB3
		ld	hl, IT
		inc	(hl)
		ld	hl, (word_0276)
		inc	hl
		ld	(word_0276), hl
		jp	FNDLB2
FNDLB3:
		ld	a, (IT)
		or	a
		jp	z, FNDLB5
		cp	8		; (todo) NAMLN
		jp	c, FNDLB4
		ld	a, 8
		ld	(IT), a
FNDLB4:
		ld	a, (IT)
		ld	hl, I1
		cp	(hl)
		jp	nz, FNDLB5
		ld	hl, (Ptr1)
		ex	de, hl
		ld	hl, (Ptr)
		ld	a, (I1)
		ld	c, a
		call	JSE		; Compare C bytes long strings pointed by (DE) and (HL)
		jr	nz, FNDLB5
		ld	(Ptr), hl
		ex	de, hl
		ld	(Ptr1),	hl
		jp	FNDLB6
FNDLB5:
		ld	hl, (Ptr1)
		inc	hl
		ld	(Ptr1),	hl
		ld	a, (hl)
		cp	0Ah
		jp	nz, FNDLB5
		inc	hl
		ld	(Ptr1),	hl
		jp	FNDLB1
FNDLB6:
		ld	hl, (Ptr2)
		ld	(Ptr1),	hl
		ld	a, 1
		ld	(Result), a
FNDLBE:
		ret
; End of function FNDLB
; =============== S U B	R O U T	I N E =======================================
sub_5BFC:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (word_A622)
		ld	de, 9
		add	hl, de
		ld	(word_A622), hl
loc_5C09:
		ld	hl, (word_A62A)
		ld	(word_A62E), hl
		xor	a
		ld	(byte_A692), a
loc_5C13:
		ld	hl, (word_A62E)
		ex	de, hl
		ld	hl, (word_A62A)
		or	a
		sbc	hl, de
		jp	nz, loc_5C3D
		ld	a, (byte_A692)
		or	a
		jp	nz, loc_5C2F
		ld	a, 1
		ld	(byte_A692), a
		jp	loc_5C3D
loc_5C2F:
		call	sub_6101
		ld	a, (Result)
		cp	1
		jp	z, loc_5C09
		jp	locret_5D1E
loc_5C3D:
		ld	hl, (word_A62E)
		inc	hl
		ld	(word_A638), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_A630), hl
		ld	de, (word_A622)
		or	a
		sbc	hl, de
		jp	c, loc_5C58
		jp	loc_5C6C
loc_5C58:
		ld	hl, (word_A62E)
		ld	de, 3
		add	hl, de
		ld	(word_A62E), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_A62E), hl
		jp	loc_5C13
loc_5C6C:
		ld	hl, (word_A638)
		ld	de, 2
		add	hl, de
		ld	(word_A638), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_A62A), hl
		ld	de, (word_A622)
		ld	hl, (word_A630)
		or	a
		sbc	hl, de
		ld	(word_A630), hl
		ld	de, 0FFCEh
		add	hl, de
		jp	nc, loc_5CD1
		ld	hl, (word_A62E)
		inc	hl
		ld	(word_A62E), hl
		ld	hl, (word_A630)
		ex	de, hl
		ld	hl, (word_A62E)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (word_A62E)
		add	hl, de
		ld	(word_A62E), hl
		ld	hl, (word_A622)
		ex	de, hl
		ld	hl, (word_A62E)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (word_A62E)
		dec	hl
		ld	(word_A62E), hl
		dec	hl
		ld	(hl), Minus
		ld	bc, 0FFFEh	; 65534
		add	hl, bc
		ld	(word_A638), hl
		ld	hl, (word_A630)
		ex	de, hl
		ld	hl, (word_A638)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		jp	loc_5CDA
loc_5CD1:
		ld	hl, (word_A62E)
		ld	bc, 3
		call	sub_9A68
loc_5CDA:
		ld	hl, (word_A62E)
		ld	(hl), Plus
		inc	hl
		ld	(word_A638), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (word_A638)
		add	hl, de
		ld	bc, 0FFFEh	; 65534
		add	hl, bc
		ld	(word_A638), hl
		ld	(hl), Plus
		ld	hl, (word_A62E)
		ld	de, 3
		add	hl, de
		ld	(word_A62E), hl
		ld	hl, (word_A632)
		ex	de, hl
		ld	hl, (word_A62E)
		ld	bc, 0
		call	sub_968F
		ld	hl, (word_A62E)
		ld	de, 4
		add	hl, de
		ld	a, (byte_A693)
		ld	(hl), a
		inc	hl
		ld	(word_A62E), hl
		ld	a, 1
		ld	(Result), a
locret_5D1E:
		ret
; End of function sub_5BFC
; =============== S U B	R O U T	I N E =======================================
sub_5D1F:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 1
		ld	(byte_A610), a
		ld	hl, byte_A668
		ld	(Ptr), hl
		ld	(hl), 0
		ld	de, ibcdUnk07
		ld	hl, ibcdV0
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		dec	ix
		ld	a, (ix+0)
		ld	(IOTemp1), a
		or	a
		jp	z, loc_5D4D
		call	sub_5FDE
		ld	hl, (pStartOfRtn)
		ld	(Ptr1),	hl
loc_5D4D:
		ld	a, (Result)
		ld	(I3), a
		ld	a, (IOTemp1)
		cp	1
		jp	z, loc_5D65
		call	MV2LN		; Move Ptr1 to Lineref
		ld	a, (Result)
		or	a
		jp	z, Error34	; Invalid line reference
loc_5D65:
		ld	a, (I3)
		ld	(Result), a
		ld	hl, (Ptr1)
		ld	(pStkStart), hl
		ld	(pCurRtnLine), hl
		ld	a, 0
		ld	(byte_A610), a
		ret
; End of function sub_5D1F
; =============== S U B	R O U T	I N E =======================================
sub_5D7A:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (byte_A69D)
		or	a
		jp	nz, Error44	; Illegal command during BREAK
		ld	hl, (Ptr1)
		ld	(pCurRtnLine), hl
		ld	bc, (Ptr1)
		ld	hl, (Ptr3)
		ex	de, hl
		ld	hl, (pEndOfRtn)
		call	sub_9721
		ld	(Ptr1),	hl
		ex	de, hl
		ld	(Ptr3),	hl
		ld	hl, (Ptr1)
		ld	(pEndOfRtn), hl
		ld	(hl), 1Ah
		ld	(word_9F9A), hl
		call	sub_650E
		ld	hl, bmFlag1	; b2:Routine not saved
		ld	a, (hl)
		or	00000100b
		ld	(hl), a
		ret
; End of function sub_5D7A
; =============== S U B	R O U T	I N E =======================================
sub_5DB5:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (byte_A69D)
		or	a
		jp	nz, Error44	; Illegal command during BREAK
		ld	a, (CmdLineSz)
		or	a
		jp	z, Error00	; Missing linestart character
		call	sub_5A7B
		ld	hl, (word_02B0)
		ld	(Ptr3),	hl
		ld	(pIndex), hl
		xor	a
		ld	(IT), a
loc_5DD6:
		ld	hl, (pIndex)
		ld	a, (hl)
		cp	Space
		jp	z, loc_5DF6
		ld	a, (hl)
		cp	9
		jp	z, loc_5DF6
		ld	a, (hl)
		cp	0Dh
		jp	z, Error00	; Missing linestart character
		inc	hl
		ld	(pIndex), hl
		ld	hl, IT
		inc	(hl)
		jp	loc_5DD6
loc_5DF6:
		ld	a, (IT)
		or	a
		jp	z, loc_5E41
		ld	a, 1
		ld	(byte_A69F), a
		ld	hl, (pStkPos)
		ld	(pIndex), hl
		ld	hl, (word_02B0)
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		call	NameLit		; Check	for a name literal
		ld	a, (Result)
		cp	1
		jp	z, loc_5E28
		call	NumLabel	; Check	for a numeric label
		ld	a, (Result)
		cp	0
		jp	z, Error28	; Illegal routine or label name
loc_5E28:				; Search routine for label
		call	FNDLB
		ld	a, (Result)
		cp	1
		jp	z, Error33	; Duplicated label
		xor	a
		ld	(byte_A69F), a
		ld	hl, (pIndex)
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
loc_5E41:
		ld	hl, (pEndOfRtn)
		ld	a, (CmdLineSz)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	de, 2
		add	hl, de
		ld	(pIndex), hl
		ld	de, (pSymbolTbl)
		or	a
		sbc	hl, de
		jp	c, loc_5E5F
		jp	Error10		; Program larger than partition
loc_5E5F:
		ld	hl, (pEndOfRtn)
		ld	(Ptr1),	hl
		ld	hl, (pIndex)
		ld	(pEndOfRtn), hl
		ld	hl, (pCurRtnLine)
		dec	hl
		ld	(word_02B0), hl
		ld	bc, (word_02B0)
		ld	hl, (pIndex)
		ex	de, hl
		ld	hl, (Ptr1)
		call	sub_972F
		ld	(Ptr1),	hl
		ex	de, hl
		ld	(pIndex), hl
		ld	de, (pCurRtnLine)
		ld	hl, (Ptr3)
		ld	a, (CmdLineSz)
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		ld	hl, (pCurRtnLine)
		ld	a, (CmdLineSz)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(hl), 0Dh
		inc	hl
		ld	(hl), 0Ah
		inc	hl
		ld	(pCurRtnLine), hl
		ld	hl, (pEndOfRtn)
		ld	(word_9F9A), hl
		call	sub_650E
		ld	hl, bmFlag1	; b2:Routine not saved
		ld	a, (hl)
		or	00000100b
		ld	(hl), a
		ret
; End of function sub_5DB5
; =============== S U B	R O U T	I N E =======================================
sub_5EB8:
		call	SSChk		; Check	for room on the	syntax stack
		call	MV2LN		; Move Ptr1 to Lineref
		ld	a, (Result)
		or	a
		jp	z, Error34	; Invalid line reference
		ld	hl, (Ptr1)
		ld	(Ptr3),	hl
		ld	a, (Case)
		cp	1
		jp	nz, loc_5EE5
loc_5ED3:
		ld	hl, (Ptr3)
		inc	hl
		ld	(Ptr3),	hl
		ld	a, (hl)
		cp	0Ah
		jp	nz, loc_5ED3
		inc	hl
		ld	(Ptr3),	hl
		ret
loc_5EE5:
		ld	a, (Case)
		cp	2
		jp	nz, loc_5F16
		call	MV2LN		; Move Ptr1 to Lineref
		ld	a, (Result)
		or	a
		jp	z, Error34	; Invalid line reference
		ld	de, (Ptr1)
		ld	hl, (Ptr3)
		or	a
		sbc	hl, de
		jp	c, Error34	; Invalid line reference
loc_5F04:
		ld	hl, (Ptr3)
		inc	hl
		ld	(Ptr3),	hl
		ld	a, (hl)
		cp	0Ah
		jp	nz, loc_5F04
		inc	hl
		ld	(Ptr3),	hl
		ret
loc_5F16:
		ld	hl, (pEndOfRtn)
		ld	(Ptr3),	hl
		ret
; End of function sub_5EB8
; =============== S U B	R O U T	I N E =======================================
sub_5F1D:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (Ptr)
		ld	(Ptr2),	hl
		xor	a
		ld	(IT), a
		ld	hl, (word_02D4)
		ld	a, (hl)
		and	00001000b
		jp	nz, loc_5F44
		ld	hl, (word_02E0)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (word_02E2)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (word_02E4)
		ld	(hl), 0
loc_5F44:
		ld	hl, (Ptr)
		ld	a, (hl)
		ld	(tmpChar), a
		cp	Space
		jp	z, loc_5F6E
		cp	9
		jp	z, loc_5F6E
		call	writeChar	; Outputs the character	on A to	the current IODevice
		ld	hl, IT
		inc	(hl)
		ld	hl, (Ptr)
		inc	hl
		ld	(Ptr), hl
		ld	a, (tmpChar)
		cp	0Ah
		jp	z, loc_5FC5
		jp	loc_5F44
loc_5F6E:
		ld	a, 0Ch
		ld	hl, IT
		cp	(hl)
		jp	c, loc_5F81
		ld	hl, IT
		sub	(hl)
		ld	(NameLen), a
		jp	loc_5F86
loc_5F81:
		ld	a, 5
		ld	(NameLen), a
loc_5F86:
		ld	a, Space
		ld	(tmpChar), a
		call	writeChar	; Outputs the character	on A to	the current IODevice
		ld	hl, NameLen
		dec	(hl)
		ld	a, (NameLen)
		or	a
		jp	nz, loc_5F86
loc_5F99:
		ld	hl, (Ptr)
		inc	hl
		ld	(Ptr), hl
		ld	a, (hl)
		cp	Space
		jp	z, loc_5F99
		ld	a, (hl)
		cp	9
		jp	z, loc_5F99
loc_5FAC:
		ld	hl, (Ptr)
		ld	a, (hl)
		ld	(tmpChar), a
		call	writeChar	; Outputs the character	on A to	the current IODevice
		ld	hl, (Ptr)
		inc	hl
		ld	(Ptr), hl
		ld	a, (tmpChar)
		cp	0Ah
		jp	nz, loc_5FAC
loc_5FC5:
		ld	hl, (word_02D4)
		ld	a, (hl)
		or	00001000b
		ld	(hl), a
		ld	hl, (pDevY)
		ld	c, 5
		call	IbcdHL		; Increments by	1 the C	bytes long BCD pointed by (HL)
		ld	hl, (pDevX)
		ld	de, ibcdV0
		call	Copy5DEHL	; Copy 5 bytes from (DE) to (HL) ; SetI
		ret
; End of function sub_5F1D
; =============== S U B	R O U T	I N E =======================================
sub_5FDE:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, byte_A668
		ld	(Ptr), hl
		ld	(hl), 0
		ld	de, ibcdUnk07
		ld	hl, ibcdV0
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		ld	hl, TRtnName	; Temp routine name storage
		call	sub_97A2
		ld	hl, TRtnName	; Temp routine name storage
		ld	(Ptr), hl
		ld	a, (hl)
		or	a
		jp	z, locret_6100
		call	sub_6238
		ld	a, (Result)
		cp	0
		jp	z, loc_6042
		ld	a, (byte_A610)
		cp	0
		jp	z, loc_603C
		ld	hl, (Ptr)
		ex	de, hl
		ld	hl, (word_9F96)
		or	a
		sbc	hl, de
		jp	z, loc_602C
		ld	hl, (Ptr)
		ld	(word_A62E), hl
		call	sub_6530
loc_602C:
		ld	hl, (Ptr)
		ld	(pRtnName), hl
		ld	de, 0Fh
		add	hl, de
		ld	(Ptr), hl
		jp	loc_60E5
loc_603C:
		call	sub_5AA4
		jp	locret_6100
loc_6042:
		call	sub_63EE
		ld	a, (RoutinesDR)
		ld	(Drive), a
		ld	a, 1
		ld	(FCBType), a	; 0:Global, 1:Routine, 2:File
		ld	hl, TRtnName	; Temp routine name storage
		call	sub_97D5
		call	GFOpen		; Open globals file
		ld	hl, (word_9F96)
		ld	(hl), 0
		ld	hl, (word_9F98)
		ld	(word_9F9A), hl
		ld	hl, SaveRtnBuf
		ld	(pFRWBuffer), hl
loc_606A:
		call	sub_9D7F
		ld	hl, SaveRtnBuf
		ld	(Ptr), hl
		ld	hl, (word_9F9A)
		ld	de, (word_A622)
		add	hl, de
		ld	(pIndex), hl
		ld	de, (pSymbolTbl)
		or	a
		sbc	hl, de
		jp	c, loc_60A8
loc_6088:
		ld	hl, (word_9F98)
		ld	(word_9F9A), hl
		ld	(hl), 1Ah
		ld	hl, (word_9F96)
		ld	(pRtnName), hl
		ld	hl, (word_9F98)
		ld	(pStartOfRtn), hl
		ld	(pEndOfRtn), hl
		ld	hl, (pStartOfRtn)
		ld	(pCurRtnLine), hl
		jp	Error10		; Program larger than partition
loc_60A8:
		ld	bc, (word_A622)
		ld	hl, (word_9F9A)
		ex	de, hl
		ld	hl, (Ptr)
		call	sub_971B
		ld	(Ptr), hl
		ex	de, hl
		ld	(word_9F9A), hl
		ld	hl, (word_A622)
		ld	de, 0FF80h	; 65408
		add	hl, de
		jp	nc, loc_60CA
		jp	loc_606A
loc_60CA:
		ld	hl, (word_9F98)
		ld	(Ptr), hl
		ld	hl, (word_9F9A)
		ld	(hl), 1Ah
		ld	hl, (word_9F96)
		ld	(pRtnName), hl
		ex	de, hl
		ld	hl, TRtnName	; Temp routine name storage
		call	CopyHLDE	; Copy (HL) bytes from (HL) to (DE)
		call	sub_650E
loc_60E5:
		ld	hl, (Ptr)
		ld	(pStartOfRtn), hl
		ld	de, (word_A624)
		add	hl, de
		ld	(Ptr), hl
		ld	(pEndOfRtn), hl
		ld	hl, (pRtnName)
		ld	bc, 0FFFBh	; 65531
		add	hl, bc
		ld	(word_A636), hl
locret_6100:
		ret
; End of function sub_5FDE
; =============== S U B	R O U T	I N E =======================================
sub_6101:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 0
		ld	(Result), a
		ld	hl, (word_A632)
		ld	de, 2
		add	hl, de
		ld	(word_A638), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_A62E), hl
		ex	de, hl
		ld	hl, (word_A632)
		or	a
		sbc	hl, de
		jp	z, locret_618A
		ld	hl, (word_A62E)
		ex	de, hl
		ld	hl, (word_A636)
		or	a
		sbc	hl, de
		jp	z, locret_618A
		ld	a, 1
		ld	(Result), a
		ld	hl, (word_A62E)
		ld	bc, 0
		call	sub_9A68
		ld	hl, (word_A62E)
		ld	de, 4
		add	hl, de
		ld	(word_A62E), hl
		ld	hl, (word_A62E)
		ld	a, (hl)
		cp	52h		; 'R'
		jp	z, loc_617A
		inc	hl
		ld	(word_A62E), hl
		ld	bc, 4
		call	sub_9A68
		ld	hl, (word_A62E)
		ld	de, 3
		add	hl, de
		ld	(word_A638), hl
		ld	a, (hl)
		or	a
		jp	z, loc_6187
		ld	de, byte_0512
		ld	hl, (word_A62E)
		call	sub_980F
		call	sub_9AE7
		jp	loc_6187
loc_617A:
		ld	hl, (word_A62E)
		inc	hl
		ld	(word_A62E), hl
		ld	bc, 0Bh
		call	sub_9A68
loc_6187:
		call	sub_62F9
locret_618A:
		ret
; End of function sub_6101
; =============== S U B	R O U T	I N E =======================================
; Move Ptr1 to Lineref
MV2LN:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		ld	a, (ix+0)
		ld	(IT), a
		or	a
		jp	nz, MV2LN1
		ld	de, ibcdTemp0
		ld	hl, ibcdV0
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		jp	MV2LN2
MV2LN1:
		ld	a, (IT)
		ld	(ix+0),	a
		inc	ix
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
MV2LN2:
		ld	a, (DT)
		cp	1
		jp	z, MV2LN4
		call	FNDLB		; (todo)
		ld	a, (Result)
		or	a
		jp	z, MV2LNE
		ld	a, (byte_A610)
		cp	0
		jp	z, MV2LN4
		ld	a, (IT)
		cp	8
		jp	c, MV2LN3
		ld	a, 8
		ld	(IT), a
MV2LN3:
		ld	hl, byte_A668
		ld	a, (IT)
		ld	(hl), a
		inc	hl
		ld	(Ptr), hl
		ld	de, (Ptr)
		ld	hl, (Ptr1)
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		ld	de, ibcdUnk07
		ld	hl, ibcdTemp0
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
MV2LN4:
		ld	a, 0
		ld	(Result), a
MV2LN5:
		ld	hl, (Ptr1)
		ex	de, hl
		ld	hl, (pEndOfRtn)
		or	a
		sbc	hl, de
		jp	z, MV2LNE
		ld	hl, ibcdTemp0
		ld	c, 5		; (todo) INTLN
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, MV2LN7
MV2LN6:
		ld	hl, (Ptr1)
		inc	hl
		ld	(Ptr1),	hl
		ld	a, (hl)
		cp	0Ah
		jp	nz, MV2LN6
		inc	hl
		ld	(Ptr1),	hl
		ld	hl, ibcdTemp0
		ld	c, 5		; (todo) INTLN
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		jp	MV2LN5
MV2LN7:
		ld	a, 1
		ld	(Result), a
MV2LNE:
		ret
; End of function MV2LN
; =============== S U B	R O U T	I N E =======================================
sub_6238:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 0
		ld	(Result), a
		ld	hl, (word_A626)
		ld	(Ptr), hl
loc_6246:
		ld	hl, (Ptr)
		ld	(pIndex), hl
		ld	hl, TRtnName	; Temp routine name storage
		ld	(Ptr2),	hl
		ex	de, hl
		ld	hl, (pIndex)
		call	sub_9558
		ld	(pIndex), hl
		ex	de, hl
		ld	(Ptr2),	hl
		ld	(Case),	a
		cp	2
		jp	z, loc_6286
		ld	hl, (Ptr)
		ld	de, 0Bh
		add	hl, de
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(Ptr), hl
		ex	de, hl
		ld	hl, (word_A626)
		or	a
		sbc	hl, de
		jp	z, locret_629C
		jp	loc_6246
loc_6286:
		ld	hl, (Ptr)
		ld	de, 9
		add	hl, de
		ld	(Ptr2),	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_A624), hl
		ld	a, 1
		ld	(Result), a
locret_629C:
		ret
; End of function sub_6238
; =============== S U B	R O U T	I N E =======================================
sub_629D:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (word_A62E)
		dec	hl
		ld	(word_A638), hl
		ld	hl, (word_A638)
		ld	a, (hl)
		cp	52h		; 'R'
		jp	z, loc_62D7
		ld	de, 4
		add	hl, de
		ld	(word_A638), hl
		ld	a, (hl)
		or	a
		jp	z, loc_62C8
		ld	de, byte_0512
		ld	hl, (word_A62E)
		call	sub_980F
		call	sub_9AE7
loc_62C8:
		ld	hl, (word_A62E)
		ld	bc, 4
		call	sub_9A68
		call	sub_62F9
		jp	locret_62F8
loc_62D7:
		ld	hl, (word_A62E)
		ld	bc, 0Bh
		call	sub_9A68
		call	sub_62F9
		ld	hl, (word_9F96)
		ld	(pRtnName), hl
		ld	hl, (word_9F98)
		ld	(pStartOfRtn), hl
		ld	(pCurRtnLine), hl
		ld	hl, (word_9F9A)
		ld	(pEndOfRtn), hl
locret_62F8:
		ret
; End of function sub_629D
; =============== S U B	R O U T	I N E =======================================
sub_62F9:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (word_A62E)
		ld	bc, 0FFF8h	; 65528
		add	hl, bc
		ld	(word_A62E), hl
		inc	hl
		ld	(word_A638), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_A630), hl
		ld	hl, (word_A638)
		ld	bc, 0FFFEh	; 65534
		add	hl, bc
		ld	(word_A638), hl
		ld	a, (hl)
		cp	Plus
		jp	z, loc_635E
		ld	bc, 0FFFEh	; 65534
		add	hl, bc
		ld	(word_A638), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_A63A), hl
		ld	hl, (word_A62E)
		ld	de, (word_A63A)
		or	a
		sbc	hl, de
		ld	(word_A63C), hl
		ld	bc, 3
		call	sub_9A68
		ld	hl, (word_A63C)
		ld	(word_A62E), hl
		inc	hl
		ld	(word_A63C), hl
		ld	de, (word_A63A)
		ld	hl, (word_A630)
		add	hl, de
		ld	(word_A630), hl
		ex	de, hl
		ld	hl, (word_A63C)
		ld	(hl), e
		inc	hl
		ld	(hl), d
loc_635E:
		ld	hl, (word_A62E)
		ld	de, (word_A630)
		add	hl, de
		ld	(word_A63C), hl
		ld	a, (hl)
		cp	Plus
		jp	z, loc_63BE
		ex	de, hl
		ld	hl, (word_A62A)
		or	a
		sbc	hl, de
		jp	nz, loc_637F
		ld	hl, (word_A62E)
		ld	(word_A62A), hl
loc_637F:
		ld	hl, (word_A63C)
		ld	bc, 3
		call	sub_9A68
		ld	hl, (word_A63C)
		inc	hl
		ld	(word_A63C), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_A63A), hl
		ld	de, (word_A63A)
		ld	hl, (word_A630)
		add	hl, de
		ld	(word_A630), hl
		ld	hl, (word_A62E)
		inc	hl
		ld	(word_A638), hl
		ld	hl, (word_A630)
		ex	de, hl
		ld	hl, (word_A638)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	de, (word_A63A)
		ld	hl, (word_A63C)
		add	hl, de
		dec	hl
		ld	(word_A63C), hl
loc_63BE:
		ld	hl, (word_A63C)
		dec	hl
		ld	(word_A63C), hl
		ld	(hl), Minus
		ld	hl, (word_A62E)
		ld	(hl), Minus
		ld	hl, (word_A63C)
		ld	bc, 0FFFEh	; 65534
		add	hl, bc
		ld	(word_A63C), hl
		ld	hl, (word_A630)
		ex	de, hl
		ld	hl, (word_A63C)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (word_A628)
		ex	de, hl
		ld	hl, (word_A62E)
		ld	bc, 3
		call	sub_968F
		ret
; End of function sub_62F9
; =============== S U B	R O U T	I N E =======================================
sub_63EE:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (bmFlag1)	; b2:Routine not saved
		and	00000100b
		jp	nz, Error42	; Remove or save routine
		ld	hl, (Ptr)
		ld	(word_0276), hl
		ld	hl, (word_9F96)
		ld	(Ptr), hl
		ld	a, (hl)
		or	a
		jp	z, loc_645F
		ld	de, 9
		add	hl, de
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	de, 10h
		add	hl, de
		ld	(word_A622), hl
		ld	a, 52h		; 'R'
		ld	(byte_A693), a
		call	sub_5BFC
		ld	a, (Result)
		cp	0
		jp	z, loc_645F
		ld	hl, (word_A626)
		ex	de, hl
		ld	hl, (word_A62E)
		ld	bc, 0Bh
		call	sub_968F
		ld	hl, (word_A62E)
		ld	(Ptr), hl
		ld	hl, (word_9F96)
		ld	(Ptr1),	hl
		call	sub_64D9
		ld	bc, (word_A624)
		ld	hl, (Ptr)
		ex	de, hl
		ld	hl, (Ptr1)
		call	sub_971B
		ld	(Ptr1),	hl
		ex	de, hl
		ld	(Ptr), hl
		ld	(hl), 1Ah
loc_645F:
		ld	hl, (word_0276)
		ld	(Ptr), hl
		ret
; End of function sub_63EE
; =============== S U B	R O U T	I N E =======================================
; Save routine
SaveRtn:
		call	SSChk		; Check	for room on the	syntax stack
		call	FCreate		; Create file
		ld	hl, (word_A624)
		inc	hl
		ld	(Ptr), hl
		ld	hl, (pStartOfRtn)
		ld	(Ptr1),	hl
		ld	hl, 80h
		ld	(Ptr3),	hl
		ld	hl, SaveRtnBuf
		ld	(pFRWBuffer), hl
SaveRtn1:
		ld	hl, SaveRtnBuf
		ld	(Ptr2),	hl
		ld	hl, (Ptr)
		ld	de, 0FF80h
		add	hl, de
		jp	nc, SaveRtn2
		ld	bc, (Ptr3)
		ld	hl, (Ptr2)
		ex	de, hl
		ld	hl, (Ptr1)
		call	sub_971B
		ld	(Ptr1),	hl
		ex	de, hl
		ld	(Ptr2),	hl
		ld	de, (Ptr3)
		ld	hl, (Ptr)
		or	a
		sbc	hl, de
		ld	(Ptr), hl
		call	FSeqWrite	; Sequential write file
		jp	SaveRtn1
SaveRtn2:
		ld	bc, (Ptr)
		ld	hl, (Ptr2)
		ex	de, hl
		ld	hl, (Ptr1)
		call	sub_971B
		ld	(Ptr1),	hl
		ex	de, hl
		ld	(Ptr2),	hl
		call	FSeqWrite	; Sequential write file
		call	FClose		; Close	file
		ret
; End of function SaveRtn
; =============== S U B	R O U T	I N E =======================================
sub_64D9:
		call	SSChk		; Check	for room on the	syntax stack
		ld	de, (Ptr)
		ld	hl, (Ptr1)
		ld	a, 0Bh
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		ld	hl, (Ptr1)
		ld	de, 9
		add	hl, de
		ld	(Ptr1),	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_A624), hl
		ld	hl, (Ptr1)
		ld	de, 6
		add	hl, de
		ld	(Ptr1),	hl
		ld	hl, (Ptr)
		ld	de, 0Fh
		add	hl, de
		ld	(Ptr), hl
		ret
; End of function sub_64D9
; =============== S U B	R O U T	I N E =======================================
sub_650E:
		ld	hl, (word_9F9A)
		ld	de, (word_9F98)
		or	a
		sbc	hl, de
		ld	(word_A624), hl
		ld	hl, (word_9F96)
		ld	de, 9
		add	hl, de
		ld	(Ptr1),	hl
		ld	hl, (word_A624)
		ex	de, hl
		ld	hl, (Ptr1)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ret
; End of function sub_650E
; =============== S U B	R O U T	I N E =======================================
sub_6530:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (word_A62E)
		dec	hl
		ld	(pIndex), hl
		ld	a, (hl)
		cp	52h		; 'R'
		jp	z, loc_6559
		ld	hl, (word_A62E)
		ld	bc, 4
		call	sub_9A68
		ld	hl, (word_A634)
		ex	de, hl
		ld	hl, (word_A62E)
		ld	bc, 4
		call	sub_968F
		jp	loc_656F
loc_6559:
		ld	hl, (word_A62E)
		ld	bc, 0Bh
		call	sub_9A68
		ld	hl, (word_A626)
		ex	de, hl
		ld	hl, (word_A62E)
		ld	bc, 0Bh
		call	sub_968F
loc_656F:
		ld	hl, (pIndex)
		ld	bc, 0FFFCh
		add	hl, bc
		ld	(pIndex), hl
		ld	bc, 0
		call	sub_9A68
		ld	hl, (word_A632)
		ex	de, hl
		ld	hl, (pIndex)
		ld	bc, 0
		call	sub_968F
		ret
; End of function sub_6530
; =============== S U B	R O U T	I N E =======================================
; Line to Stack
Ln2Stk:
		xor	a
		ld	(IT), a
		ld	a, (Result)
		or	a
		jp	z, Ln2Stk5
Ln2Stk1:
		ld	hl, (Ptr1)
		ld	a, (hl)
		cp	Space
		jp	z, Ln2Stk2
		ld	a, (hl)
		cp	9
		jp	z, Ln2Stk2
		ld	a, (hl)
		cp	0Dh
		jp	z, Error00	; Missing linestart character
		ld	a, (hl)
		ld	(ix+0),	a
		inc	ix
		inc	hl
		ld	(Ptr1),	hl
		ld	hl, IT
		inc	(hl)
		jp	Ln2Stk1
Ln2Stk2:
		ld	(ix+0),	Space
		inc	ix
		ld	hl, IT
		inc	(hl)
Ln2Stk3:
		ld	hl, (Ptr1)
		inc	hl
		ld	(Ptr1),	hl
		ld	a, (hl)
		cp	Space
		jp	z, Ln2Stk3
		ld	a, (hl)
		cp	9
		jp	z, Ln2Stk3
		ld	a, (hl)
		cp	0Dh
		jp	z, Ln2Stk5
Ln2Stk4:
		ld	hl, (Ptr1)
		ld	a, (hl)
		ld	(ix+0),	a
		inc	ix
		ld	a, (IT)
		cp	255
		jp	z, Error11	; String too long
		ld	hl, IT
		inc	(hl)
		ld	hl, (Ptr1)
		inc	hl
		ld	(Ptr1),	hl
		ld	a, (hl)
		cp	0Dh
		jp	nz, Ln2Stk4
Ln2Stk5:
		ld	a, (IT)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ret
; End of function Ln2Stk
; =============== S U B	R O U T	I N E =======================================
sub_6612:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		ld	a, (ix+0)
		ld	(Mode),	a
		dec	ix
		ld	a, (ix+0)
		ld	(IndFL), a
		dec	ix
		ld	a, (ix+0)
		ld	(IndSW), a
		dec	ix
		ld	a, (ix+0)
		ld	(ForSW), a
		call	sub_5555
		ld	hl, DoSW
		dec	(hl)
		ld	hl, (pStkPos)
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		xor	a
		ld	(bmFlag), a
		ret
; End of function sub_6612
; =============== S U B	R O U T	I N E =======================================
sub_664B:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_9789
		ld	(pStkPos), hl
		ld	a, (Mode)
		cp	0
		jp	nz, loc_6664
		ld	de, (pStkStart)
		add	hl, de
		ld	(pStkPos), hl
loc_6664:
		ld	(Ptr), ix
		ld	hl, (Ptr)
		ld	(word_0502), hl
		ld	bc, 0FFFDh
		add	hl, bc
		ld	a, (hl)
		ld	(byte_04EC), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(Ptr), hl
		ld	(word_02F8), hl
		ld	bc, 0FFFEh
		add	hl, bc
		ld	a, (hl)
		ld	(byte_04ED), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(Ptr), hl
		ld	(word_02FE), hl
		ld	bc, 0FFFEh
		add	hl, bc
		ld	(Ptr), hl
		ld	(Vptr),	hl
		ret
; End of function sub_664B
; =============== S U B	R O U T	I N E =======================================
; Return from indirection
IndRet:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (pStkPos)
		ld	(Ptr), hl
		ld	(Ptr2),	hl
		ld	(Ptr1),	hl
IndRet1:
		ld	hl, (Ptr1)
		ld	a, (hl)
		cp	0Dh		; End of indirection
		jp	z, IndRet2
		inc	hl
		ld	(Ptr1),	hl
		jp	IndRet1
IndRet2:
		ld	hl, (Ptr1)
		ld	de, 8		; (todo) SHTLN+SHTLN+PTRLN+SHTLN???
		add	hl, de
		ld	(Ptr1),	hl
		ld	(TPP), ix
		ld	hl, (TPP)
		ex	de, hl
		ld	hl, (Ptr1)
		or	a
		sbc	hl, de
		jp	z, IndRet4
		ld	hl, (Ptr)
		inc	hl
		ld	a, (hl)
		ld	(IT), a
		inc	hl
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(pIndex), hl
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(pStkPos), hl
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	a, (hl)
		ld	(IndFL), a
		inc	hl
		ld	a, (hl)
		ld	(Mode),	a
		inc	hl
		ld	(Ptr), hl
		cp	0
		jp	nz, IndRet3
		ld	hl, (pIndex)
		ld	de, (pStartOfRtn)
		add	hl, de
		ld	(pStkStart), hl
		ld	de, (pStkStart)
		ld	hl, (pStkPos)
		add	hl, de
		ld	(pStkPos), hl
IndRet3:
		ld	(Ptr1),	ix
		ld	de, (Ptr)
		ld	hl, (Ptr1)
		or	a
		sbc	hl, de
		ld	(Ptr1),	hl
		ld	hl, IT
		dec	(hl)
		ld	hl, (Ptr2)
		ld	a, (IT)
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(Ptr2),	hl
		ld	ix, (Ptr2)
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (Ptr)
		ld	bc, (Ptr1)
		call	sub_97AE
		ld	(Ptr), hl
		jp	IndRetEnd
IndRet4:
		dec	ix
		ld	a, (ix+0)
		ld	(Mode),	a
		dec	ix
		ld	a, (ix+0)
		ld	(IndFL), a
		call	sub_9789
		ld	(pStkPos), hl
		call	sub_9789
		ld	(pStkStart), hl
		ld	a, (Mode)
		cp	0
		jp	nz, IndRet5
		ld	de, (pStartOfRtn)
		add	hl, de
		ld	(pStkStart), hl
		ld	de, (pStkStart)
		ld	hl, (pStkPos)
		add	hl, de
		ld	(pStkPos), hl
IndRet5:
		dec	ix
		ld	a, (ix+0)
		ld	(StrLen), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
IndRetEnd:
		ld	hl, (pStkPos)
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ret
; End of function IndRet
; =============== S U B	R O U T	I N E =======================================
sub_67BD:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 4
		ld	(I1), a
loc_67C5:
		ld	(ix+0),	Space
		inc	ix
		ld	hl, I1
		dec	(hl)
		ld	a, (I1)
		or	a
		jp	nz, loc_67C5
		ld	(ix+0),	4
		inc	ix
		ld	(ix+0),	3
		inc	ix
		call	Write
		xor	a
		ld	(NameLen), a
		ld	a, 1
		ld	(byte_A60F), a
loc_67EE:
		call	sub_5861
		ld	a, (NameLen)
		ld	hl, IT
		add	a, (hl)
		ld	(NameLen), a
		ld	a, (byte_04CC)
		cp	1
		jp	z, loc_6814
		ld	(ix+0),	Comma
		inc	ix
		ld	hl, NameLen
		inc	(hl)
		ld	hl, byte_04CC
		dec	(hl)
		jp	loc_67EE
loc_6814:
		xor	a
		ld	(byte_A60F), a
		ld	a, (NameLen)
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		call	Write
		ld	(ix+0),	Space
		inc	ix
		ld	(ix+0),	Quotes
		inc	ix
		ld	(ix+0),	2
		inc	ix
		ld	(ix+0),	3
		inc	ix
		call	Write
		ld	hl, (VarPtr)	; Points to a var in the symbol	table
		call	sub_97D5
		call	Write
		ld	(ix+0),	Quotes
		inc	ix
		ld	(ix+0),	1
		inc	ix
		ld	(ix+0),	3
		inc	ix
		call	Write
		call	PrintCRLF
		ret
; End of function sub_67BD
; =============== S U B	R O U T	I N E =======================================
sub_6866:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (Ptr1)
		inc	hl
		ld	(Ptr1),	hl
loc_6870:
		ld	hl, ibcd1
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, locret_68D4
		ld	hl, (Ptr1)
		ld	a, (hl)
		ld	(byte_04B8), a
		inc	hl
		ld	(word_0274), hl
loc_6886:
		ld	a, (byte_04B8)
		or	a
		jp	z, loc_68BB
		ld	hl, (pStkPos)
		ex	de, hl
		ld	hl, (Ptr2)
		or	a
		sbc	hl, de
		jp	z, loc_68CE
		ld	hl, (pStkPos)
		ex	de, hl
		ld	hl, (word_0274)
		ld	a, (de)
		cp	(hl)
		jp	nz, loc_68CE
		ld	hl, (pStkPos)
		inc	hl
		ld	(pStkPos), hl
		ld	hl, (word_0274)
		inc	hl
		ld	(word_0274), hl
		ld	hl, byte_04B8
		dec	(hl)
		jp	loc_6886
loc_68BB:
		ld	hl, ibcd1
		ld	c, 5
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		ld	hl, ibcdUnk05
		ld	c, 5
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		jp	loc_6870
loc_68CE:
		ld	a, (ibcdVmin1)
		ld	(ibcd1), a
locret_68D4:
		ret
; End of function sub_6866
; =============== S U B	R O U T	I N E =======================================
sub_68D5:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (Ptr1)
		inc	hl
		ld	(Ptr1),	hl
loc_68DF:
		ld	hl, ibcd1
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, locret_69DC
		ld	hl, (Ptr1)
		ld	a, (hl)
		ld	(byte_04B8), a
		inc	hl
		ld	(word_0274), hl
		ld	hl, (pStkPos)
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
loc_68FF:
		ld	hl, (pStkPos)
		ex	de, hl
		ld	hl, (Ptr2)
		or	a
		sbc	hl, de
		jp	z, loc_69D3
		ld	a, (byte_04B8)
		or	a
		jp	z, loc_69D3
		ld	hl, (word_0274)
		ld	a, (hl)
		ld	(tmpChar), a
		inc	hl
		ld	(word_0274), hl
		ld	hl, byte_04B8
		dec	(hl)
		ld	a, (tmpChar)
		cp	41h		; 'A'
		jp	nz, loc_693A
		ld	a, (Token)
		cp	2		; Is it	'A' to 'Z'?
		jp	z, loc_69B9
		cp	1		; Is it	'a' to 'z'?
		jp	z, loc_69B9
		jp	loc_68FF
loc_693A:
		ld	a, (tmpChar)
		cp	4Eh		; 'N'
		jp	nz, loc_694D
		ld	a, (Token)
		cp	3		; Is it	'0' to '9'?
		jp	z, loc_69B9
		jp	loc_68FF
loc_694D:
		ld	a, (tmpChar)
		cp	55h		; 'U'
		jp	nz, loc_6960
		ld	a, (Token)
		cp	2		; Is it	'A' to 'Z'?
		jp	z, loc_69B9
		jp	loc_68FF
loc_6960:
		ld	a, (tmpChar)
		cp	4Ch		; 'L'
		jp	nz, loc_6973
		ld	a, (Token)
		cp	1		; Is it	'a' to 'z'?
		jp	z, loc_69B9
		jp	loc_68FF
loc_6973:
		ld	a, (tmpChar)
		cp	50h		; 'P'
		jp	nz, loc_698F
		ld	a, (Token)
		cp	4		; Is it	'''?
		jp	c, loc_68FF
		ld	a, Dollar
		ld	hl, Token
		cp	(hl)
		jp	c, loc_68FF
		jp	loc_69B9
loc_698F:
		ld	a, (tmpChar)
		cp	45h		; 'E'
		jp	nz, loc_69A1
		ld	a, (Token)
		or	a
		jp	nz, loc_69B9
		jp	loc_68FF
loc_69A1:
		ld	a, (tmpChar)
		cp	43h		; 'C'
		jp	nz, loc_69B4
		ld	a, (Token)
		cp	Percent		; It is	TAB?
		jp	c, loc_68FF
		jp	loc_69B9
loc_69B4:				; '5'
		ld	a, 35h
		call	PrintErr	; Outputs error	message
loc_69B9:
		ld	hl, (pStkPos)
		inc	hl
		ld	(pStkPos), hl
		ld	hl, ibcd1
		ld	c, 5
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		ld	hl, ibcdUnk05
		ld	c, 5
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		jp	loc_68DF
loc_69D3:
		ld	de, ibcd1
		ld	hl, ibcdVmin1
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
locret_69DC:
		ret
; End of function sub_68D5
; =============== S U B	R O U T	I N E =======================================
sub_69DD:
		call	SSChk		; Check	for room on the	syntax stack
		dec	ix
		ld	a, (ix+0)
		ld	(Mode),	a
		dec	ix
		ld	a, (ix+0)
		ld	(IndFL), a
		dec	ix
		ld	a, (ix+0)
		ld	(ForSW), a
		call	sub_5555
		dec	ix
		ld	a, (ix+0)
		ld	(N), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, IndSW
		dec	(hl)
		xor	a
		ld	(bmFlag), a
		ld	hl, (pStkPos)
		dec	hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, 0
		ld	(GotoFL), a
		ret
; End of function sub_69DD
; =============== S U B	R O U T	I N E =======================================
sub_6A25:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (byte_04CC)
		ld	(I5), a
		ld	hl, (word_02F2)
		ex	de, hl
		ld	hl, (Ptr)
		call	sub_96B9
		ld	(I5), a
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ld	a, 0
		ld	(Result), a
		ld	a, (byte_04CC)
		ld	hl, I5
		cp	(hl)
		jp	c, locret_6A52
		ld	a, 1
		ld	(Result), a
locret_6A52:
		ret
; End of function sub_6A25
; =============== S U B	R O U T	I N E =======================================
sub_6A53:
		ld	hl, (pSymbolTbl)
		ld	de, 2
		add	hl, de
		ld	(pIndex), hl
		ld	(PtrX),	hl
		ld	hl, 0
		ld	(Ptr), hl
loc_6A66:
		ld	hl, (Ptr)
		inc	hl
		inc	hl
		ld	(Ptr), hl
		ld	de, (Ptr)
		ld	hl, (SymEnd)
		or	a
		sbc	hl, de
		jp	c, loc_6A8B
		ld	hl, (pIndex)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (pIndex)
		add	hl, de
		ld	(pIndex), hl
		jp	loc_6A66
loc_6A8B:
		ld	de, (PtrX)
		ld	hl, (pIndex)
		or	a
		sbc	hl, de
		ld	(pIndex), hl
		ret
; End of function sub_6A53
; =============== S U B	R O U T	I N E =======================================
sub_6A99:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (pSymbolTbl)
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(pIndex), hl
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	(word_027A), hl
		ld	de, (pIndex)
		add	hl, de
		ld	(Ptr), hl
		ld	a, (byte_04CC)
		ld	(I5), a
		ld	hl, (word_02F2)
		ex	de, hl
		ld	hl, (Ptr)
		call	sub_96B9
		ld	(I5), a
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ld	a, (Case)
		cp	2
		jp	z, loc_6B22
		cp	3
		jp	z, loc_6B0A
		ld	hl, (word_027A)
		ld	(Ptr), hl
loc_6AE7:
		ld	a, (byte_04CC)
		ld	(I5), a
		ld	hl, (word_02F2)
		ex	de, hl
		ld	hl, (Ptr)
		call	sub_96B9
		ld	(I5), a
		ld	(VarPtr), hl	; Points to a var in the symbol	table
		ld	a, (Case)
		cp	2
		jp	z, loc_6B22
		cp	1
		jp	z, loc_6B1A
loc_6B0A:
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
		jp	loc_6AE7
loc_6B1A:
		ld	a, 0
		ld	(Result), a
		jp	locret_6B27
loc_6B22:
		ld	a, 1
		ld	(Result), a
locret_6B27:
		ret
; End of function sub_6A99
; =============== S U B	R O U T	I N E =======================================
sub_6B28:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (Ptr)
		ld	(Ptr1),	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
		ld	(word_0276), hl
		dec	hl
		ld	(Ptr), hl
		ld	hl, (Ptr1)
		dec	hl
		ld	(Ptr1),	hl
		ld	bc, (pSymbolTbl)
		ld	hl, (Ptr)
		ex	de, hl
		ld	hl, (Ptr1)
		call	sub_972F
		ld	(Ptr1),	hl
		ex	de, hl
		ld	(Ptr), hl
		ld	(pSymbolTbl), hl
		ld	hl, (word_0276)
		ld	(Ptr), hl
		ld	hl, (SymEnd)
		dec	hl
		ld	(SymEnd), hl
		ret
; End of function sub_6B28
; =============== S U B	R O U T	I N E =======================================
sub_6B6F:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (byte_A695)
		ld	l, a
		ld	h, 0
		ld	(word_0274), hl
		ld	bc, 0FFFEh
		add	hl, bc
		ld	(Ptr2),	hl
		ld	hl, (word_0274)
		ld	a, (byte_A694)
		ld	c, a
		ld	b, 0
		add	hl, bc
		inc	hl
		ld	(word_0274), hl
		ld	hl, (Ptr)
		ld	(Ptr1),	hl
		ld	hl, (pSymbolTbl)
		ld	(Ptr), hl
		ld	(pIndex), hl
		ld	de, (word_0274)
		or	a
		sbc	hl, de
		ld	(Ptr), hl
		ld	de, (Ptr)
		ld	hl, (word_9F9A)
		or	a
		sbc	hl, de
		jp	c, loc_6BB9
		jp	Error31		; Symbol table overflow
loc_6BB9:
		ld	hl, (SymEnd)
		inc	hl
		ld	(SymEnd), hl
		ld	hl, (Ptr)
		ld	(pSymbolTbl), hl
		ld	bc, (Ptr)
		ld	hl, (pIndex)
		ex	de, hl
		ld	hl, (Ptr1)
		call	sub_9721
		ld	(Ptr), hl
		ex	de, hl
		ld	(pIndex), hl
		ld	de, (word_0274)
		ld	hl, (Ptr1)
		or	a
		sbc	hl, de
		ld	(Ptr1),	hl
		ld	hl, (word_0274)
		ex	de, hl
		ld	hl, (Ptr1)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr1)
		ld	de, 2
		add	hl, de
		ld	(Ptr1),	hl
		ld	bc, (Ptr2)
		ex	de, hl
		ld	hl, (word_02F2)
		call	sub_971B
		ld	(word_02F2), hl
		ex	de, hl
		ld	(Ptr1),	hl
		ld	a, (byte_A694)
		ld	(hl), a
; End of function sub_6B6F
; =============== S U B	R O U T	I N E =======================================
sub_6C12:
		ld	hl, (Ptr1)
		inc	hl
		ld	(Ptr1),	hl
		ld	de, (Ptr1)
		ld	hl, (word_02F4)
		ld	a, (byte_A694)
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		call	sub_6A53
		ld	hl, (pIndex)
		ex	de, hl
		ld	hl, (pSymbolTbl)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ret
; End of function sub_6C12
; =============== S U B	R O U T	I N E =======================================
sub_6C34:
		call	SSChk		; Check	for room on the	syntax stack
		ld	de, byte_052D
		ld	hl, byte_0512
		call	sub_980F
		ld	de, 765
		ld	hl, (pGLBBuffer3)
		add	hl, de
		ld	(pGLBBuffer3), hl
		ld	de, byte_0530
		call	sub_980F
		ld	de, byte_0512
		ld	hl, byte_A61A
		call	sub_980F
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	z, loc_6C7D
		call	sub_7995
		ld	de, 765
		ld	hl, (pGLBBuffer3)
		add	hl, de
		ld	(pGLBBuffer3), hl
		ld	de, byte_0530
		call	sub_980E
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
loc_6C7D:
		ld	de, byte_0512
		ld	hl, byte_052D
		call	sub_980F
		call	sub_9B7C
		ret
; End of function sub_6C34
; =============== S U B	R O U T	I N E =======================================
sub_6C8A:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 1
		ld	(I1), a
		ld	hl, (Ptr)
		ld	(Ptr1),	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
		call	sub_8431
		ret
; End of function sub_6C8A
; =============== S U B	R O U T	I N E =======================================
sub_6CA6:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_7995
		ld	hl, (pGLBBuffer3)
		ld	de, 14h
		add	hl, de
		ld	(word_0278), hl
		xor	a
		ld	(N), a
loc_6CBA:
		ld	hl, N
		inc	(hl)
		ld	hl, (word_0278)
		ld	(word_0274), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (word_0278)
		add	hl, de
		ld	(word_0278), hl
		ld	bc, 0FFFDh
		add	hl, bc
		ld	(pIndex), hl
		ld	de, byte_0515
		call	JDEN
		jp	nz, loc_6CBA
		ld	hl, N
		dec	(hl)
		ret
; End of function sub_6CA6
; =============== S U B	R O U T	I N E =======================================
sub_6CE3:
		call	SSChk		; Check	for room on the	syntax stack
		ld	de, byte_0512
		ld	hl, byte_052A
		call	sub_980F
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	z, loc_6D42
loc_6CFB:
		call	sub_6D48
		ld	a, (byte_A696)
		cp	1
		jp	z, loc_6D35
		ld	a, (Case)
		cp	2
		jp	z, loc_6D15
		ld	a, (byte_A60B)
		or	a
		jp	nz, loc_6D22
loc_6D15:
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
loc_6D22:
		ld	hl, (Ptr)
		ld	bc, 0FFFDh
		add	hl, bc
		ld	(Ptr), hl
		ld	de, byte_0512
		call	sub_980F
		jp	loc_6CFB
loc_6D35:
		ld	a, 1
		ld	(Result), a
		ld	a, (Case)
		cp	2
		jp	z, locret_6D47
loc_6D42:
		ld	a, 0
		ld	(Result), a
locret_6D47:
		ret
; End of function sub_6CE3
; =============== S U B	R O U T	I N E =======================================
sub_6D48:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 0Ch
		add	hl, de
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(pIndex), hl
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	a, (hl)
		ld	(byte_A60B), a
		inc	hl
		ld	a, (hl)
		ld	(byte_A696), a
		ld	de, 5
		add	hl, de
		ld	(Ptr), hl
		ld	(word_027A), hl
		ld	de, (pIndex)
		add	hl, de
		ld	(Ptr), hl
		ld	a, (byte_04CC)
		ld	(I5), a
		ld	hl, (word_A640)
		ex	de, hl
		ld	hl, (Ptr)
		call	sub_96C0
		ld	(I5), a
		ld	(word_027E), hl
		ld	a, (Case)
		cp	1
		jp	nz, loc_6DCE
		ld	hl, (word_027A)
		ld	(Ptr), hl
		xor	a
		ld	(byte_A60B), a
loc_6DA9:
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, 0
		or	a
		sbc	hl, de
		jp	z, locret_6DEA
		ld	a, (byte_04CC)
		ld	(I5), a
		ld	hl, (word_A640)
		ex	de, hl
		ld	hl, (Ptr)
		call	sub_96C0
		ld	(I5), a
		ld	(word_027E), hl
loc_6DCE:
		ld	a, (Case)
		cp	3
		jp	nz, locret_6DEA
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
		ld	hl, byte_A60B
		inc	(hl)
		jp	loc_6DA9
locret_6DEA:
		ret
; End of function sub_6D48
; =============== S U B	R O U T	I N E =======================================
sub_6DEB:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, byte_0518
		call	sub_97EC
		ld	hl, byte_0524
		call	sub_97EC
		ld	hl, byte_0512
		call	sub_97EC
		ld	hl, (word_A640)
		call	sub_97BE
		ld	a, (byte_A695)
		ld	(ix+0),	a
		inc	ix
		ld	a, (byte_04C3)
		ld	(ix+0),	a
		inc	ix
		ld	a, (byte_04CC)
		ld	(ix+0),	a
		inc	ix
loc_6E1E:
		ld	de, byte_0518
		ld	hl, byte_0512
		call	sub_980F
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 0Fh
		add	hl, de
		ld	a, (hl)
		ld	(byte_A696), a
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0524
		call	sub_980F
		xor	a
		ld	(I1), a
		ld	hl, byte_0524
		ld	de, Nil
		call	JDEN
		jp	z, loc_6F6A
		ld	de, byte_0512
		ld	hl, byte_0524
		call	sub_980F
		ld	hl, (Ptr)
		ld	de, 3
		add	hl, de
		ld	(Ptr), hl
		ld	(word_A640), ix
		call	sub_7E48
		dec	ix
		ld	a, (ix+0)
		ld	(byte_04CC), a
		ld	a, (I1)
		ld	(byte_A695), a
		ld	de, byte_0515
		ld	hl, byte_0518
		call	sub_980F
		call	sub_6CA6
		ld	hl, (word_0274)
		ld	(Ptr), hl
		xor	a
		ld	(I1), a
		ld	a, (byte_04CC)
		ld	(I5), a
		ld	hl, (word_A640)
		ex	de, hl
		ld	hl, (Ptr)
		call	sub_96C0
		ld	(I5), a
		ld	(word_027E), hl
		ld	a, (N)
		ld	(byte_A60B), a
		ld	a, (Case)
		cp	2
		jp	z, loc_6F3B
		ld	(ix+0),	a
		inc	ix
		call	sub_6C8A
		ld	a, (byte_A695)
		add	a, 3
		ld	(byte_A695), a
		ld	de, byte_0521
		ld	hl, byte_0518
		call	sub_980F
		ld	hl, byte_052D
		call	sub_97EC
		ld	a, (byte_04DF)
		ld	(ix+0),	a
		inc	ix
		ld	a, (byte_A60B)
		ld	(ix+0),	a
		inc	ix
		ld	a, (byte_A699)
		ld	(ix+0),	a
		inc	ix
		ld	a, 1
		ld	(byte_A69A), a
		call	sub_7EF7
		xor	a
		ld	(byte_A69A), a
		ld	a, (byte_A699)
		ld	(I1), a
		or	a
		jp	z, loc_6F15
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(IT), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
loc_6F15:
		dec	ix
		ld	a, (ix+0)
		ld	(byte_A699), a
		dec	ix
		ld	a, (ix+0)
		ld	(byte_A60B), a
		dec	ix
		ld	a, (ix+0)
		ld	(byte_04DF), a
		ld	hl, byte_052D
		call	sub_9766
		dec	ix
		ld	a, (ix+0)
		ld	(Case),	a
loc_6F3B:
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(IT), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (byte_A60B)
		or	a
		jp	nz, loc_6F6A
		ld	a, (Case)
		cp	2
		jp	z, loc_6F6A
		ld	de, byte_0512
		ld	hl, byte_0524
		call	sub_980F
		jp	loc_6E1E
loc_6F6A:
		dec	ix
		ld	a, (ix+0)
		ld	(byte_04CC), a
		dec	ix
		ld	a, (ix+0)
		ld	(byte_04C3), a
		dec	ix
		ld	a, (ix+0)
		ld	(byte_A695), a
		call	sub_9789
		ld	(word_A640), hl
		ld	hl, byte_0512
		call	sub_9766
		ld	hl, byte_0524
		call	sub_9766
		ld	hl, byte_0518
		call	sub_9766
		ld	a, (I1)
		or	a
		jp	z, locret_702C
		ld	de, byte_0512
		ld	hl, byte_0524
		call	sub_980F
		call	sub_6D48
		ld	hl, (pGLBBuffer3)
		ld	de, 0Bh
		add	hl, de
		ld	(pIndex), hl
		ld	a, (byte_A60B)
		cp	(hl)
		jp	nz, locret_702C
		ld	(N), a
		ld	hl, (pGLBBuffer3)
		ld	de, 765
		add	hl, de
		ld	(pIndex), hl
		ld	de, byte_0512
		call	sub_980F
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	z, locret_702C
		call	sub_6D48
		ld	a, (byte_A60B)
		or	a
		jp	nz, loc_6FF9
		ld	de, byte_0512
		ld	hl, byte_0524
		call	sub_980F
		ld	a, (N)
		ld	(byte_A60B), a
		jp	locret_702C
loc_6FF9:
		ld	de, byte_0524
		ld	hl, byte_0512
		call	sub_980F
		ld	de, byte_0512
		ld	hl, byte_052D
		call	sub_980F
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 11h
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0524
		call	sub_980E
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
		ld	de, byte_0512
		ld	hl, byte_0524
		call	sub_980F
locret_702C:
		ret
; End of function sub_6DEB
; =============== S U B	R O U T	I N E =======================================
sub_702D:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	z, locret_70A7
		ld	a, (byte_A696)
		cp	1
		jp	z, locret_70A7
		ld	de, byte_0533
		ld	hl, byte_0512
		call	sub_980F
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 14h
		add	hl, de
		ld	(Ptr), hl
loc_705A:
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
		ld	bc, 0FFFDh
		add	hl, bc
		ld	(pIndex), hl
		ld	de, byte_0512
		call	sub_980F
		call	sub_7995
		ld	hl, (pGLBBuffer3)
		ld	de, 11h
		add	hl, de
		ld	(Ptr1),	hl
		ld	de, byte_0533
		call	sub_980E
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
		ld	de, byte_0512
		ld	hl, byte_0533
		call	sub_980F
		call	sub_7995
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, 0
		or	a
		sbc	hl, de
		jp	nz, loc_705A
locret_70A7:
		ret
; End of function sub_702D
; =============== S U B	R O U T	I N E =======================================
sub_70A8:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (NameLen)
		or	a
		jp	nz, loc_70FA
		ld	a, (byte_04D0)
		or	a
		jp	z, Error36	; Naked	global reference illegal
		ld	a, (byte_04CC)
		or	a
		jp	z, Error36	; Naked	global reference illegal
		ld	a, 1
		ld	(NR), a
		ld	hl, byte_04D0
		dec	(hl)
		ld	hl, (word_02CC)
		ld	(word_02D0), hl
		ld	a, (byte_A698)
		ld	(byte_A697), a
		call	sub_7D33
		ld	a, (byte_04D0)
		ld	(byte_04CC), a
		ld	(byte_04CE), a
		ld	a, (byte_A697)
		ld	(byte_A695), a
		ld	hl, byte_9FD3
		ld	(word_02F2), hl
		ld	a, (hl)
		ld	(NameLen), a
		ld	c, a
		ld	b, 0
		add	hl, bc
		inc	hl
		ld	(word_A640), hl
		ret
loc_70FA:
		ld	a, (byte_04CC)
		or	a
		jp	z, locret_7107
		call	sub_80D3
		call	sub_7D33
locret_7107:
		ret
; End of function sub_70A8
; =============== S U B	R O U T	I N E =======================================
sub_7108:
		call	SSChk		; Check	for room on the	syntax stack
		ld	de, byte_A617
		ld	hl, byte_0512
		call	sub_980F
loc_7114:
		ld	hl, 776
		ld	(word_A622), hl
		ld	a, 47h		; 'G'
		ld	(byte_A693), a
		call	sub_5BFC
		ld	a, (Result)
		cp	1
		jp	z, loc_7130
		call	sub_5A7B
		jp	loc_7114
loc_7130:
		ld	de, byte_0512
		ld	hl, byte_A617
		call	sub_980F
		ld	hl, (word_A62E)
		ld	(pGLBBuffer3), hl
		ld	de, byte_0512
		call	sub_980E
		ld	hl, (word_A62E)
		ld	de, 3
		add	hl, de
		ld	(word_A62E), hl
		ld	(hl), 0
		ld	hl, (word_A634)
		ex	de, hl
		ld	hl, (pGLBBuffer3)
		ld	bc, 4
		call	sub_968F
		call	sub_7EDF
		ret
; End of function sub_7108
; =============== S U B	R O U T	I N E =======================================
sub_7162:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 0
		ld	(Result), a
		ld	hl, (word_A634)
		ld	(pGLBBuffer3), hl
loc_7170:
		ld	hl, (pGLBBuffer3)
		ld	de, 4
		add	hl, de
		ld	(pGLBBuffer3), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(pGLBBuffer3), hl
		ex	de, hl
		ld	hl, (word_A634)
		or	a
		sbc	hl, de
		jp	z, locret_71AB
		ld	hl, (pGLBBuffer3)
		ld	de, byte_0512
		call	JDEN
		jp	z, loc_719A
		jp	loc_7170
loc_719A:
		ld	a, 1
		ld	(Result), a
		ld	hl, (pGLBBuffer3)
		ld	(word_A62E), hl
		call	sub_6530
		call	sub_7EDF
locret_71AB:
		ret
; End of function sub_7162
; =============== S U B	R O U T	I N E =======================================
sub_71AC:
		call	SSChk		; (todo) Check this
		ld	de, byte_0512
		ld	hl, byte_052A
		call	sub_980F
loc_71B8:
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 0Fh
		add	hl, de
		ld	(Ptr), hl
		ld	a, (hl)
		cp	1
		jp	z, locret_71E9
		ld	de, 5
		add	hl, de
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	bc, 0FFFDh
		add	hl, bc
		ld	(Ptr), hl
		ld	de, byte_0512
		call	sub_980F
		jp	loc_71B8
locret_71E9:
		ret
; End of function sub_71AC
; =============== S U B	R O U T	I N E =======================================
sub_71EA:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (Result)
		cp	0
		jp	z, loc_7202
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
loc_7202:
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, 0
		or	a
		sbc	hl, de
		jp	nz, loc_723A
		ld	hl, (pGLBBuffer3)
		ld	de, 765
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0512
		call	sub_980F
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	z, loc_7242
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 14h
		add	hl, de
		ld	(Ptr), hl
loc_723A:
		ld	a, 1
		ld	(Result), a
		jp	locret_7247
loc_7242:
		ld	a, 0
		ld	(Result), a
locret_7247:
		ret
; End of function sub_71EA
; =============== S U B	R O U T	I N E =======================================
sub_7248:
		call	SSChk		; Check	for room on the	syntax stack
		xor	a
		ld	(Count), a
loc_724F:
		ld	de, byte_0515
		ld	hl, byte_0512
		call	sub_980F
		call	sub_7995
		ld	hl, (pGLBBuffer3)
		ld	de, 11h
		add	hl, de
		ld	(pIndex), hl
		ld	de, byte_0512
		call	sub_980F
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	z, locret_7304
		call	sub_7995
		call	sub_6CA6
loc_727D:
		ld	a, (N)
		or	a
		jp	nz, loc_728B
		ld	hl, Count
		inc	(hl)
		jp	loc_724F
loc_728B:
		ld	hl, (word_0274)
		ld	bc, 0FFFDh
		add	hl, bc
		ld	(word_0274), hl
		ld	de, byte_0512
		call	sub_980F
		call	sub_7995
		ld	hl, (pGLBBuffer3)
		ld	(word_0274), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(pIndex), hl
		ld	de, 745
		or	a
		sbc	hl, de
		jp	nz, loc_72D7
		ld	hl, N
		dec	(hl)
		ld	hl, (word_0274)
		ld	de, 11h
		add	hl, de
		ld	(word_0274), hl
		ld	de, byte_0512
		call	sub_980F
		call	sub_7995
		call	sub_809F
		ld	hl, (Ptr)
		ld	(word_0274), hl
		jp	loc_727D
loc_72D7:
		ld	a, (Count)
		or	a
		jp	z, locret_7304
		ld	hl, (pGLBBuffer3)
		ld	de, 0Bh
		add	hl, de
		ld	(pGLBBuffer3), hl
		ld	a, (hl)
		ld	(N), a
		ld	de, 765
		ld	hl, (word_0274)
		add	hl, de
		ld	de, (pIndex)
		or	a
		sbc	hl, de
		ld	(word_0274), hl
		ld	hl, Count
		dec	(hl)
		jp	loc_728B
locret_7304:
		ret
; End of function sub_7248
; =============== S U B	R O U T	I N E =======================================
sub_7305:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_7995
		ld	a, (byte_A60B)
		ld	(N), a
		call	sub_809F
		ld	a, (byte_A695)
		ld	l, a
		ld	h, 0
		ld	(word_A64E), hl
		ld	a, (byte_A696)
		cp	0
		jp	z, loc_7336
		ld	hl, (word_A64E)
		ld	a, (byte_A694)
		ld	c, a
		ld	b, 0
		add	hl, bc
		inc	hl
		ld	(word_A64E), hl
		jp	loc_7340
loc_7336:
		ld	hl, (word_A64E)
		ld	de, 3
		add	hl, de
		ld	(word_A64E), hl
loc_7340:
		ld	hl, (pGLBBuffer3)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	bc, 0FFFEh
		add	hl, bc
		ld	(Ptr1),	hl
		ld	de, (word_A64E)
		or	a
		sbc	hl, de
		jp	c, loc_7363
		call	sub_7F4F
		ld	a, 0
		ld	(byte_04DF), a
		jp	locret_7366
loc_7363:
		call	sub_810A
locret_7366:
		ret
; End of function sub_7305
; =============== S U B	R O U T	I N E =======================================
sub_7367:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (bIsGlbOpen)
		cp	0
		jp	z, locret_73C3
		ld	de, byte_0512
		ld	hl, GZero
		call	sub_980F
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 5
		add	hl, de
		ld	(Ptr), hl
		ld	hl, (word_A648)
		ex	de, hl
		ld	hl, (Ptr)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
loc_7397:
		ld	hl, (word_A634)
		ld	de, 4
		add	hl, de
		ld	(word_A62E), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_A62E), hl
		ex	de, hl
		ld	hl, (word_A634)
		or	a
		sbc	hl, de
		jp	z, loc_73BB
		call	sub_5A67
		call	sub_629D
		jp	loc_7397
loc_73BB:				; Close	globals	file
		call	GFClose
		ld	a, 0
		ld	(bIsGlbOpen), a
locret_73C3:
		ret
; End of function sub_7367
; =============== S U B	R O U T	I N E =======================================
sub_73C4:
		call	SSChk		; Check	for room on the	syntax stack
		ld	de, byte_051B
		ld	hl, byte_0512
		call	sub_980F
		ld	de, byte_0518
		ld	hl, byte_0512
		call	sub_980F
		ld	a, (byte_A60B)
		ld	(N), a
		or	a
		jp	nz, loc_7409
		call	sub_7248
		ld	de, byte_0518
		ld	hl, byte_0512
		call	sub_980F
		xor	a
		ld	(N), a
		ld	de, byte_0512
		ld	hl, byte_051B
		call	sub_980F
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 14h
		add	hl, de
		ld	(Ptr), hl
loc_7409:
		xor	a
		ld	(I2), a
		ld	(I4), a
loc_7410:
		xor	a
		ld	(I1), a
		ld	hl, (Ptr)
		ld	(Ptr1),	hl
loc_741A:
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, 0
		or	a
		sbc	hl, de
		jp	z, loc_745F
		ld	a, (byte_04CC)
		ld	(I5), a
		ld	hl, (word_A640)
		ex	de, hl
		ld	hl, (Ptr)
		call	sub_96C0
		ld	(I5), a
		ld	(word_027E), hl
		ld	a, (I5)
		or	a
		jp	nz, loc_74AD
		ld	a, 1
		ld	(I4), a
		ld	hl, I1
		inc	(hl)
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
		jp	loc_741A
loc_745F:
		ld	a, (N)
		or	a
		jp	nz, loc_747A
		ld	a, (I2)
		or	a
		jp	nz, loc_747A
		ld	hl, I2
		inc	(hl)
		ld	de, byte_0533
		ld	hl, byte_0512
		call	sub_980F
loc_747A:
		call	sub_8431
		ld	hl, (pGLBBuffer3)
		ld	de, 765
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0512
		call	sub_980F
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	z, loc_74B0
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 14h
		add	hl, de
		ld	(Ptr), hl
		xor	a
		ld	(N), a
		jp	loc_7410
loc_74AD:
		call	sub_8431
loc_74B0:
		ld	a, (I4)
		or	a
		jp	z, locret_76CD
loc_74B7:
		ld	a, (I2)
		or	a
		jp	z, loc_75C7
		xor	a
		ld	(I2), a
		ld	de, byte_0512
		ld	hl, byte_0533
		call	sub_980F
		call	sub_7248
		ld	de, byte_A61A
		ld	hl, byte_0512
		call	sub_980F
		ld	de, byte_0512
		ld	hl, byte_0533
		call	sub_980F
		ld	de, byte_0515
		ld	hl, byte_0533
		call	sub_980F
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 11h
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0512
		call	sub_980F
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	z, loc_75C7
		call	sub_6CA6
		ld	a, (N)
		ld	(I3), a
		ld	hl, (word_0274)
		ld	(Ptr), hl
loc_7517:
		ld	de, byte_051B
		ld	hl, byte_0512
		call	sub_980F
loc_7520:
		ld	hl, (Ptr)
		ld	(pIndex), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (pIndex)
		add	hl, de
		ld	bc, 0FFFDh
		add	hl, bc
		ld	(pIndex), hl
		ld	de, byte_0512
		call	sub_980F
		call	sub_7995
		ld	hl, (pGLBBuffer3)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, 745
		or	a
		sbc	hl, de
		jp	z, loc_7552
		call	sub_6DEB
		jp	loc_74B7
loc_7552:
		call	sub_6C34
		ld	de, byte_0512
		ld	hl, byte_051B
		call	sub_980F
		call	sub_7995
		ld	a, (I3)
		ld	(N), a
		call	sub_809F
		call	sub_6C8A
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, 0
		or	a
		sbc	hl, de
		jp	nz, loc_7520
		ld	a, (I3)
		or	a
		jp	nz, loc_7597
		ld	a, (I2)
		or	a
		jp	nz, loc_7597
		ld	hl, I2
		inc	(hl)
		ld	de, byte_0533
		ld	hl, byte_0512
		call	sub_980F
loc_7597:
		ld	hl, (pGLBBuffer3)
		ld	de, 765
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0512
		call	sub_980F
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	z, loc_74B7
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 14h
		add	hl, de
		ld	(Ptr), hl
		xor	a
		ld	(I3), a
		jp	loc_7517
loc_75C7:
		ld	de, byte_0512
		ld	hl, byte_0518
		call	sub_980F
		ld	a, 1
		ld	(byte_A696), a
loc_75D5:
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	z, loc_764F
		call	sub_79AA
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_02B8), hl
		ld	de, 765
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0512
		call	sub_980F
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	nz, loc_7622
		ld	de, byte_0512
		ld	hl, byte_0518
		call	sub_980F
		call	sub_7248
		ld	de, byte_0518
		ld	hl, byte_0512
		call	sub_980F
		jp	loc_75D5
loc_7622:
		call	sub_79AA
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	de, (word_02B8)
		add	hl, de
		ld	(Ptr1),	hl
		ld	de, 64789
		add	hl, de
		jp	nc, loc_764F
		call	sub_7BA6
		ld	de, byte_0518
		ld	hl, byte_0512
		call	sub_980F
		ld	a, 0
		ld	(byte_A696), a
		jp	loc_75D5
loc_764F:
		ld	de, byte_0512
		ld	hl, byte_052A
		call	sub_980F
		call	sub_79AA
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, 745
		or	a
		sbc	hl, de
		jp	nz, loc_7673
		call	sub_9B7C
		call	sub_776C
		jp	locret_76CD
loc_7673:
		ld	hl, (Ptr)
		ld	de, 0Bh
		add	hl, de
		ld	(Ptr), hl
		ld	a, (hl)
		cp	1
		jp	nz, locret_76CD
		ld	de, 4
		add	hl, de
		ld	(Ptr), hl
		ld	a, (hl)
		cp	1
		jp	z, locret_76CD
		ld	de, 5
		add	hl, de
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	bc, 65533
		add	hl, bc
		ld	(Ptr), hl
		ld	de, byte_052A
		call	sub_980F
		call	sub_9B7C
		call	sub_84BC
		ld	de, byte_0512
		ld	hl, byte_052A
		call	sub_980F
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 11h
		add	hl, de
		ld	(Ptr), hl
		ld	de, Nil
		call	sub_980E
locret_76CD:
		ret
; End of function sub_73C4
; =============== S U B	R O U T	I N E =======================================
; Find place for a key
FindKey:
		call	SSChk		; (todo)
		call	sub_7974
		ld	de, byte_0512
		ld	hl, glbptrUnk
		call	sub_980F
loc_76DD:
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	z, loc_7766
		xor	a		; PASSU
		ld	(byte_054A), a
		call	sub_79AA
		ld	hl, (Ptr)
		inc	hl
		ld	(Ptr), hl
loc_76F7:
		ld	hl, (Ptr)
		ld	a, (hl)
		or	a
		jp	z, loc_7732
		ld	hl, (word_02F2)
		ld	(word_027A), hl
		ld	hl, (Ptr)
		ld	(Ptr1),	hl
		ex	de, hl
		ld	hl, (word_027A)
		call	sub_9558
		ld	(word_027A), hl
		ex	de, hl
		ld	(Ptr1),	hl
		ld	(Case),	a
		cp	2
		jp	z, loc_7745
		ld	hl, (Ptr)
		ld	de, 0Ch
		add	hl, de
		ld	(Ptr), hl
		ld	hl, byte_054A
		inc	(hl)
		jp	loc_76F7
loc_7732:
		ld	hl, (pGLBBuffer3)
		ld	de, 765
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0512
		call	sub_980F
		jp	loc_76DD
loc_7745:
		ld	a, 1
		ld	(Result), a
		ld	hl, (Ptr)
		ld	de, 9
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_052A
		call	sub_980F
		ld	de, byte_053F
		ld	hl, byte_0512
		call	sub_980F
		jp	locret_776B
loc_7766:
		ld	a, 0
		ld	(Result), a
locret_776B:
		ret
; End of function FindKey
; =============== S U B	R O U T	I N E =======================================
sub_776C:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (byte_054A)
		ld	(N), a
		ld	de, byte_0512
		ld	hl, byte_053F
		call	sub_980F
		call	sub_79AA
		ld	hl, (Ptr)
		inc	hl
		ld	(Ptr), hl
loc_7788:
		ld	a, (N)
		or	a
		jp	z, loc_77A0
		ld	hl, (Ptr)
		ld	de, 0Ch
		add	hl, de
		ld	(Ptr), hl
		ld	hl, N
		dec	(hl)
		jp	loc_7788
loc_77A0:
		ld	hl, (Ptr)
		ld	de, 0Ch
		add	hl, de
		ld	(Ptr1),	hl
		ld	(Ptr2),	hl
loc_77AD:
		ld	hl, (Ptr2)
		ld	a, (hl)
		or	a
		jp	z, loc_77BF
		ld	de, 0Ch
		add	hl, de
		ld	(Ptr2),	hl
		jp	loc_77AD
loc_77BF:
		ld	hl, (Ptr2)
		inc	hl
		ld	(Ptr2),	hl
		ld	bc, (Ptr)
		ld	hl, (Ptr1)
		ex	de, hl
		ld	hl, (Ptr2)
		call	sub_9721
		ld	(Ptr), hl
		ex	de, hl
		ld	(Ptr1),	hl
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
		ld	hl, (pGLBBuffer3)
		ld	(Ptr), hl
		dec	(hl)
		ld	a, (hl)
		or	a
		jp	nz, locret_784D
		ld	de, 765
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0515
		call	sub_980F
		ld	de, byte_0512
		ld	hl, GZero
		call	sub_980F
		call	sub_79AA
		ld	de, byte_0512
		ld	hl, (pGLBBuffer3)
		call	sub_980F
loc_780E:
		ld	hl, byte_0512
		ld	de, byte_053F
		call	JDEN
		jp	z, loc_7830
		call	sub_79AA
		ld	de, 765
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0512
		call	sub_980F
		jp	loc_780E
loc_7830:
		ld	hl, (Ptr)
		ld	de, byte_0515
		call	sub_980E
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
		ld	de, byte_0512
		ld	hl, byte_053F
		call	sub_980F
		call	sub_9B7C
		call	sub_7367
locret_784D:
		ret
; End of function sub_776C
; =============== S U B	R O U T	I N E =======================================
sub_784E:
		call	SSChk		; Check	for room on the	syntax stack
		ld	de, byte_0512
		ld	hl, glbptrUnk
		call	sub_980F
		ld	hl, glbptrUnk
		ld	de, Nil
		call	JDEN
		jp	nz, loc_78E8
		ld	de, byte_0512
		ld	hl, GZero
		call	sub_980F
		call	sub_79AA
		call	sub_9AF9
		ld	de, glbptrUnk
		ld	hl, byte_0512
		call	sub_980F
		jp	loc_78B8
loc_7881:
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	nz, loc_78E8
		call	sub_9AF9
		ld	de, byte_0515
		ld	hl, byte_0512
		call	sub_980F
		ld	de, byte_0512
		ld	hl, byte_0518
		call	sub_980F
		call	sub_79AA
		ld	de, 765
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0512
		ld	hl, byte_0515
		call	sub_980F
loc_78B8:
		ld	hl, (Ptr)
		ld	de, byte_0512
		call	sub_980E
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
		call	sub_7108
		xor	a
		ld	(N), a
		ld	hl, (pGLBBuffer3)
		ld	(hl), 0
		ld	de, 765
		add	hl, de
		ld	(Ptr), hl
		ld	de, Nil
		call	sub_980E
		ld	hl, (pGLBBuffer3)
		ld	(Ptr), hl
		jp	loc_7910
loc_78E8:
		ld	de, byte_0518
		ld	hl, byte_0512
		call	sub_980F
		call	sub_79AA
		ld	hl, (Ptr)
		ld	a, (hl)
		ld	(N), a
		cp	Question
		jp	nz, loc_7910
		ld	de, 765
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0512
		call	sub_980F
		jp	loc_7881
loc_7910:
		ld	hl, (Ptr)
		inc	(hl)
		inc	hl
		ld	(Ptr), hl
		ld	a, (N)
		ld	(byte_054A), a
loc_791E:
		ld	a, (N)
		or	a
		jp	z, loc_7936
		ld	hl, (Ptr)
		ld	de, 0Ch
		add	hl, de
		ld	(Ptr), hl
		ld	hl, N
		dec	(hl)
		jp	loc_791E
loc_7936:
		ld	hl, (Ptr)
		ex	de, hl
		ld	hl, (word_02F2)
		call	CopyHLDE	; Copy (HL) bytes from (HL) to (DE)
		ld	hl, (Ptr)
		ld	de, 9
		add	hl, de
		ld	(Ptr), hl
		ld	de, Nil
		call	sub_980E
		ld	de, byte_052A
		ld	hl, Nil
		call	sub_980F
		ld	hl, (Ptr)
		ld	de, 3
		add	hl, de
		ld	(Ptr1),	hl
		ld	(hl), 0
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
		ld	de, byte_053F
		ld	hl, byte_0512
		call	sub_980F
		ret
; End of function sub_784E
; =============== S U B	R O U T	I N E =======================================
sub_7974:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (bIsGlbOpen)
		cp	1
		jp	z, locret_7994
		ld	a, (GlobalsDR)
		ld	(Drive), a
		xor	a
		ld	(FCBType), a	; 0:Global, 1:Routine, 2:File
		call	GFOpen		; Open globals file
		ld	a, 1
		ld	(bIsGlbOpen), a
		call	sub_7E16
locret_7994:
		ret
; End of function sub_7974
; =============== S U B	R O U T	I N E =======================================
sub_7995:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_7162
		ld	a, (Result)
		cp	1
		jp	z, locret_79A9
		call	sub_7108
		call	sub_9AD9
locret_79A9:
		ret
; End of function sub_7995
; =============== S U B	R O U T	I N E =======================================
sub_79AA:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_7162
		ld	a, (Result)
		cp	1
		jp	z, loc_79BE
		call	sub_7108
		call	sub_9AD9
loc_79BE:
		ld	hl, (pGLBBuffer3)
		ld	(Ptr), hl
		ret
; End of function sub_79AA
; =============== S U B	R O U T	I N E =======================================
sub_79C5:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, 0
		ld	(byte_A696), a
		ld	hl, byte_052A
		ld	de, Nil
		call	JDEN
		jp	nz, loc_79DE
		ld	a, 1
		ld	(byte_A696), a
loc_79DE:
		call	sub_9AF9
		call	sub_7108
		ld	hl, (pGLBBuffer3)
		ld	de, 765
		add	hl, de
		ld	(Ptr1),	hl
		ld	de, Nil
		call	sub_980E
		ld	hl, (pGLBBuffer3)
		ld	(Ptr), hl
		ld	de, byte_052A
		ld	hl, byte_0512
		call	sub_980F
		ld	hl, (Ptr)
		ld	de, 745
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ex	de, hl
		ld	hl, (word_02F2)
		call	CopyHLDE	; Copy (HL) bytes from (HL) to (DE)
		ld	hl, (Ptr)
		ld	de, 9
		add	hl, de
		ld	(hl), 0
		inc	hl
		ld	(Ptr), hl
		ld	de, 0
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(hl), 0
		inc	hl
		ld	a, (byte_A696)
		ld	(hl), a
		inc	hl
		ld	(hl), 1
		inc	hl
		ld	(Ptr), hl
		ld	de, Nil
		call	sub_980E
		ld	hl, (Ptr)
		ld	de, 3
		add	hl, de
		ld	(Ptr), hl
		ld	de, 0
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
		ret
; End of function sub_79C5
; =============== S U B	R O U T	I N E =======================================
sub_7A61:
		call	SSChk		; Check	for room on the	syntax stack
		ld	de, byte_0512
		ld	hl, byte_052A
		call	sub_980F
		ld	a, 1
		ld	(N), a
loc_7A72:
		call	sub_7995
		call	sub_809F
		ld	hl, (Ptr)
		ld	(pIndex), hl
		xor	a
		ld	(IT), a
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, 0
		or	a
		sbc	hl, de
		jp	nz, loc_7A93
		ld	a, 1
		ld	(IT), a
loc_7A93:
		ld	hl, (pIndex)
		ld	bc, 0FFFDh
		add	hl, bc
		ld	(pIndex), hl
		ld	a, (byte_A696)
		cp	1
		jp	z, loc_7ACC
		ld	a, (IT)
		ld	(ix+0),	a
		inc	ix
		ld	a, (N)
		ld	(ix+0),	a
		inc	ix
		ld	hl, byte_0512
		call	sub_97EC
		ld	de, byte_0512
		ld	hl, (pIndex)
		call	sub_980F
		ld	a, 1
		ld	(N), a
		jp	loc_7A72
loc_7ACC:
		call	sub_9B7C
		ld	hl, byte_0512
		ld	de, byte_052A
		call	JDEN
		jp	z, locret_7AFD
		ld	hl, byte_0512
		call	sub_9766
		dec	ix
		ld	a, (ix+0)
		ld	(N), a
		dec	ix
		ld	a, (ix+0)
		ld	(IT), a
		cp	1
		jp	z, loc_7ACC
		ld	hl, N
		inc	(hl)
		jp	loc_7A72
locret_7AFD:
		ret
; End of function sub_7A61
; =============== S U B	R O U T	I N E =======================================
; View a list os globals
ShowGlb:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_7974
		xor	a
		ld	(byte_04EA), a
		ld	de, byte_0512
		ld	hl, glbptrUnk
		call	sub_980F
loc_7B11:
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	z, loc_7B9B
		call	sub_79AA
		ld	hl, (Ptr)
		inc	hl
		ld	(Ptr), hl
loc_7B27:
		ld	hl, (Ptr)
		ld	a, (hl)
		ld	(Count), a
		or	a
		jp	z, loc_7B88
		ld	(word_0274), hl
		inc	hl
		ld	(Ptr), hl
		call	sub_97B3
		ld	(Ptr), hl
		ld	a, 0Ch
		ld	hl, Count
		sub	(hl)
		ld	(ITX), a
loc_7B48:
		ld	(ix+0),	Space
		inc	ix
		ld	hl, ITX
		dec	(hl)
		ld	a, (ITX)
		or	a
		jp	nz, loc_7B48
		ld	(ix+0),	0Ch
		inc	ix
		ld	(ix+0),	3
		inc	ix
		call	Write
		ld	hl, byte_04EA
		inc	(hl)
		ld	a, (byte_04EA)
		cp	5
		jp	nz, loc_7B7B
		call	PrintCRLF
		xor	a
		ld	(byte_04EA), a
loc_7B7B:
		ld	hl, (word_0274)
		ld	de, 0Ch
		add	hl, de
		ld	(Ptr), hl
		jp	loc_7B27
loc_7B88:
		ld	hl, (pGLBBuffer3)
		ld	de, 765
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0512
		call	sub_980F
		jp	loc_7B11
loc_7B9B:
		ld	a, (byte_04EA)
		or	a
		jp	z, locret_7BA5
		call	PrintCRLF
locret_7BA5:
		ret
; End of function ShowGlb
; =============== S U B	R O U T	I N E =======================================
sub_7BA6:
		call	SSChk		; Check	for room on the	syntax stack
		ld	de, byte_0515
		ld	hl, byte_0512
		call	sub_980F
		call	sub_79AA
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(Ptr1),	hl
		ld	hl, (Ptr)
		ld	de, 765
		add	hl, de
		ld	(Ptr2),	hl
		ld	de, byte_0530
		call	sub_980F
		ld	de, (Ptr1)
		ld	hl, (Ptr2)
		or	a
		sbc	hl, de
		ld	(Ptr2),	hl
		ld	hl, (Ptr)
		ld	de, 0Bh
		add	hl, de
		ld	a, (hl)
		ld	(I1), a
		ld	de, 6
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_052D
		call	sub_980F
		ld	hl, (Ptr)
		ld	de, 3
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0512
		ld	hl, byte_0518
		call	sub_980F
		call	sub_7995
		ld	hl, (pGLBBuffer3)
		ld	(Ptr1),	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_02B8), hl
		ld	de, 765
		ld	hl, (Ptr1)
		add	hl, de
		ld	(Ptr1),	hl
		ld	de, byte_0530
		call	sub_980E
		ld	hl, (Ptr1)
		ld	(Ptr3),	hl
		ld	de, (word_02B8)
		or	a
		sbc	hl, de
		ld	(Ptr1),	hl
		ld	bc, (Ptr1)
		ld	hl, (Ptr)
		ex	de, hl
		ld	hl, (Ptr2)
		call	sub_9721
		ld	(Ptr1),	hl
		ex	de, hl
		ld	(Ptr), hl
		ld	hl, (Ptr1)
		ld	de, 0
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (pGLBBuffer3)
		ld	(Ptr), hl
		ld	de, (Ptr1)
		ld	hl, (Ptr3)
		or	a
		sbc	hl, de
		ld	(Ptr3),	hl
		ex	de, hl
		ld	hl, (Ptr)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 0Bh
		add	hl, de
		ld	(Ptr), hl
		ld	a, (hl)
		ld	hl, I1
		add	a, (hl)
		ld	(IT), a
		ld	hl, (Ptr)
		ld	(hl), a
		call	sub_802B
		call	sub_702D
		ld	de, byte_0512
		ld	hl, byte_0515
		call	sub_980F
		call	sub_9B7C
		ld	de, byte_0512
		ld	hl, byte_052D
		call	sub_980F
		call	sub_6CA6
		ld	a, (N)
		ld	(byte_A60B), a
		ld	hl, (word_0274)
		ld	(Ptr), hl
		call	sub_6C8A
		ld	a, (byte_A60B)
		or	a
		jp	nz, loc_7CC3
		ld	a, (IT)
		or	a
		jp	z, loc_7CC3
		call	sub_6DEB
loc_7CC3:
		ld	de, byte_0512
		ld	hl, byte_0518
		call	sub_980F
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 11h
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0512
		call	sub_980F
		ld	hl, byte_0512
		ld	de, byte_052A
		call	JDEN
		jp	nz, locret_7D32
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 0Bh
		add	hl, de
		ld	(Ptr), hl
		ld	a, (hl)
		cp	1
		jp	nz, loc_7D29
		ld	de, byte_052A
		ld	hl, byte_0518
		call	sub_980F
		call	sub_9B7C
		call	sub_84BC
		ld	de, byte_0512
		ld	hl, byte_052A
		call	sub_980F
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 11h
		add	hl, de
		ld	(Ptr), hl
		ld	de, Nil
		call	sub_980E
loc_7D29:
		ld	de, byte_0512
		ld	hl, Nil
		call	sub_980F
locret_7D32:
		ret
; End of function sub_7BA6
; =============== S U B	R O U T	I N E =======================================
sub_7D33:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (byte_04CC)
		ld	(I5), a
		ld	hl, (word_A640)
		ld	(pIndex), hl
loc_7D42:
		ld	hl, (word_02D0)
		ld	(word_02CC), hl
		ld	a, (byte_A697)
		ld	(byte_A698), a
		ld	hl, (pIndex)
		ld	a, (hl)
		ld	(IT), a
		ld	hl, IT
		inc	(hl)
		ld	a, (byte_A697)
		add	a, (hl)
		ld	(byte_A697), a
		cp	65h		; 'e'
		jp	c, loc_7D6C
		xor	a
		ld	(byte_A697), a
		jp	Error15		; Too many naked references
loc_7D6C:
		ld	de, (word_02D0)
		ld	hl, (pIndex)
		ld	a, (IT)
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		ld	hl, (word_02D0)
		ld	a, (IT)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(word_02D0), hl
		ld	hl, (pIndex)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(pIndex), hl
		ld	hl, byte_04D0
		inc	(hl)
		ld	hl, I5
		dec	(hl)
		ld	a, (I5)
		or	a
		jp	nz, loc_7D42
		ret
; End of function sub_7D33
; =============== S U B	R O U T	I N E =======================================
sub_7DA0:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	z, locret_7E15
		call	sub_79AA
		ld	hl, (Ptr)
		ld	de, 0Fh
		add	hl, de
		ld	a, (hl)
		ld	(byte_A696), a
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_0524
		call	sub_980E
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
		ld	hl, (Ptr)
		ld	de, 3
		add	hl, de
		ld	(Ptr), hl
		ld	(word_A640), ix
		call	sub_7E48
		ld	de, byte_0521
		ld	hl, byte_0512
		call	sub_980F
		ld	de, byte_0512
		ld	hl, byte_0524
		call	sub_980F
		dec	ix
		ld	a, (ix+0)
		ld	(byte_04CC), a
		ld	a, (I1)
		add	a, 3
		ld	(byte_A695), a
		xor	a
		ld	(byte_A60B), a
		ld	a, 0
		ld	(byte_A696), a
		call	sub_7305
		ld	ix, (word_A640)
		call	SSChk		; Check	for room on the	syntax stack
locret_7E15:
		ret
; End of function sub_7DA0
; =============== S U B	R O U T	I N E =======================================
sub_7E16:
		call	SSChk		; Check	for room on the	syntax stack
		ld	de, byte_0512
		ld	hl, GZero
		call	sub_980F
		call	sub_79AA
		ld	de, glbptrUnk
		ld	hl, (Ptr)
		call	sub_980F
		ld	hl, (Ptr)
		ld	de, 3
		add	hl, de
		ld	a, (hl)
		ld	(byte_04F9), a
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_A648), hl
		ret
; End of function sub_7E16
; =============== S U B	R O U T	I N E =======================================
sub_7E48:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (Ptr)
		ld	(Ptr1),	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(pIndex), hl
		ld	hl, (Ptr1)
		ld	de, 2
		add	hl, de
		ld	a, (hl)
		ld	(IT), a
		ld	(I1), a
		inc	hl
		ld	(Ptr1),	hl
		ld	(Ptr2),	hl
		ld	hl, (pIndex)
		ld	bc, 0FFFDh
		add	hl, bc
		ld	(pIndex), hl
		ld	a, (byte_A696)
		cp	0
		jp	z, loc_7EAB
loc_7E7F:
		ld	a, (I1)
		or	a
		jp	z, loc_7E98
		ld	hl, (Ptr2)
		ld	c, (hl)
		ld	b, 0
		add	hl, bc
		inc	hl
		ld	(Ptr2),	hl
		ld	hl, I1
		dec	(hl)
		jp	loc_7E7F
loc_7E98:
		ld	hl, (Ptr2)
		ld	e, (hl)
		ld	d, 0
		ld	hl, (pIndex)
		or	a
		sbc	hl, de
		dec	hl
		ld	(pIndex), hl
		jp	loc_7EB5
loc_7EAB:
		ld	hl, (pIndex)
		ld	bc, 0FFFDh
		add	hl, bc
		ld	(pIndex), hl
loc_7EB5:
		ld	hl, (Ptr1)
		ld	bc, (pIndex)
		call	sub_97AE
		ld	(Ptr1),	hl
		call	sub_9321
		call	StrToChar	; Converts a string on ToS to char (0-255)
		ld	(I1), a
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ld	a, (IT)
		ld	(ix+0),	a
		inc	ix
		ret
; End of function sub_7E48
; =============== S U B	R O U T	I N E =======================================
sub_7EDF:
		ld	hl, (pGLBBuffer3)
		ld	(pGLBBuffer1), hl
		ld	de, 3
		add	hl, de
		ld	(pGLBBuffer3), hl
		ld	(pGLbBuffer2), hl
		ld	de, 5
		add	hl, de
		ld	(pGLBBuffer3), hl
		ret
; End of function sub_7EDF
; =============== S U B	R O U T	I N E =======================================
sub_7EF7:
		call	SSChk		; Check	for room on the	syntax stack
		xor	a
		ld	(byte_A699), a
		ld	a, 0
		ld	(byte_04DF), a
		ld	de, byte_0518
		ld	hl, Nil
		call	sub_980F
		jp	loc_7F17
loc_7F0F:
		ld	a, (byte_04DF)
		cp	0
		jp	z, locret_7F4E
loc_7F17:
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	z, loc_7F29
		call	sub_7305
		jp	loc_7F0F
loc_7F29:
		call	sub_79C5
		xor	a
		ld	(byte_A60B), a
		call	sub_7305
		ld	de, byte_0524
		ld	hl, byte_0512
		call	sub_980F
		call	sub_702D
		ld	de, byte_0512
		ld	hl, byte_0518
		call	sub_980F
		call	sub_7DA0
		call	sub_84BC
locret_7F4E:
		ret
; End of function sub_7EF7
; =============== S U B	R O U T	I N E =======================================
sub_7F4F:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (Ptr)
		ld	(Ptr1),	hl
loc_7F58:
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, 0
		or	a
		sbc	hl, de
		jp	z, loc_7F77
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
		jp	loc_7F58
loc_7F77:
		ld	hl, (Ptr)
		inc	hl
		ld	(Ptr), hl
		ld	(pIndex), hl
		ld	de, (word_A64E)
		add	hl, de
		ld	(Ptr), hl
		ld	bc, (Ptr1)
		ex	de, hl
		ld	hl, (pIndex)
		call	sub_972F
		ld	(pIndex), hl
		ex	de, hl
		ld	(Ptr), hl
		ld	hl, (pIndex)
		ld	a, (hl)
		ld	hl, (Ptr)
		ld	(hl), a
		ld	hl, (word_A64E)
		ex	de, hl
		ld	hl, (Ptr1)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr1)
		ld	de, 2
		add	hl, de
		ld	a, (byte_04CC)
		ld	(hl), a
		inc	hl
		ld	(Ptr1),	hl
		ld	a, (byte_A695)
		sub	3
		ld	(IT), a
		ld	de, (Ptr1)
		ld	hl, (word_A640)
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		ld	hl, (Ptr1)
		ld	a, (IT)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(Ptr1),	hl
		ld	a, (byte_A696)
		cp	0
		jp	z, loc_7FF8
		ld	a, (byte_A694)
		ld	(hl), a
		inc	hl
		ld	(Ptr1),	hl
		ld	de, (Ptr1)
		ld	hl, (word_02F4)
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		jp	loc_8001
loc_7FF8:
		ld	hl, (Ptr1)
		ld	de, byte_0521
		call	sub_980E
loc_8001:
		ld	hl, (pGLBBuffer3)
		ld	de, 0Bh
		add	hl, de
		ld	(Ptr), hl
		inc	(hl)
		call	sub_802B
		ld	hl, (pGLBBuffer3)
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	de, (word_A64E)
		or	a
		sbc	hl, de
		ld	(word_02B8), hl
		ex	de, hl
		ld	hl, (Ptr)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ret
; End of function sub_7F4F
; =============== S U B	R O U T	I N E =======================================
sub_802B:
		ld	hl, (pGLBBuffer3)
		ld	de, 0Bh
		add	hl, de
		ld	a, (hl)
		ld	(IT), a
		ld	de, 9
		add	hl, de
		ld	(Ptr1),	hl
		ld	(PtrX),	hl
		xor	a
		ld	(I1), a
		ld	(N), a
loc_8047:
		ld	hl, I1
		inc	(hl)
		inc	(hl)
		ld	a, (IT)
		ld	hl, I1
		cp	(hl)
		jp	c, loc_806A
		ld	hl, N
		inc	(hl)
		ld	hl, (Ptr1)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr1)
		add	hl, de
		ld	(Ptr1),	hl
		jp	loc_8047
loc_806A:
		ld	de, (PtrX)
		ld	hl, (Ptr1)
		or	a
		sbc	hl, de
		ld	(Ptr1),	hl
		ld	hl, (pGLBBuffer3)
		ld	de, 0Ch
		add	hl, de
		ld	(pIndex), hl
		ld	hl, (Ptr1)
		ex	de, hl
		ld	hl, (pIndex)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (pIndex)
		ld	de, 2
		add	hl, de
		ld	(pIndex), hl
		ld	a, (N)
		ld	(hl), a
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
		ret
; End of function sub_802B
; =============== S U B	R O U T	I N E =======================================
sub_809F:
		ld	a, (N)
		ld	(I4), a
		ld	hl, (pGLBBuffer3)
		ld	de, 0Fh
		add	hl, de
		ld	a, (hl)
		ld	(byte_A696), a
		ld	de, 5
		add	hl, de
		ld	(Ptr), hl
loc_80B7:
		ld	a, (I4)
		or	a
		jp	z, locret_80D2
		ld	hl, (Ptr)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (Ptr)
		add	hl, de
		ld	(Ptr), hl
		ld	hl, I4
		dec	(hl)
		jp	loc_80B7
locret_80D2:
		ret
; End of function sub_809F
; =============== S U B	R O U T	I N E =======================================
sub_80D3:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (NameLen)
		ld	(Count), a
		ld	hl, Count
		inc	(hl)
		ld	de, byte_9FD3
		ld	hl, (word_02F2)
		ld	a, (Count)
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		xor	a
		ld	(byte_04D0), a
		ld	hl, byte_9FD3
		ld	a, (Count)
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(word_02CC), hl
		ld	(word_02D0), hl
		ld	a, 3
		ld	(byte_A697), a
		xor	a
		ld	(NR), a
		ret
; End of function sub_80D3
; =============== S U B	R O U T	I N E =======================================
sub_810A:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (byte_A69A)
		cp	1
		jp	nz, loc_811A
		ld	a, 1
		ld	(byte_A699), a
loc_811A:
		ld	de, byte_0515
		ld	hl, byte_0512
		call	sub_980F
		ld	de, byte_0518
		ld	hl, byte_0512
		call	sub_980F
		call	sub_9AF9
		ld	de, byte_052D
		ld	hl, byte_0512
		call	sub_980F
		ld	de, byte_0512
		ld	hl, byte_0518
		call	sub_980F
		call	sub_7995
		ld	hl, (pGLBBuffer3)
		ld	(word_027E), hl
		ld	(word_A64A), hl
		ld	(pIndex), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_0292), hl
		ld	hl, (word_027E)
		ld	de, 0Bh
		add	hl, de
		ld	a, (hl)
		ld	(N), a
		ld	de, 5
		add	hl, de
		ld	a, (hl)
		ld	(IT), a
		ld	de, 4
		add	hl, de
		ld	(word_027E), hl
		ld	(word_027A), hl
		ld	a, (byte_A60B)
		ld	hl, N
		cp	(hl)
		jp	z, loc_8182
		xor	a
		ld	(IT), a
loc_8182:
		ld	de, 765
		ld	hl, (pIndex)
		add	hl, de
		ld	de, (word_0292)
		or	a
		sbc	hl, de
		ld	(pIndex), hl
		ld	(word_027C), hl
		xor	a
		ld	(byte_A60D), a
loc_819A:
		ld	hl, byte_A60D
		inc	(hl)
		ld	hl, (word_027E)
		ld	(Ptr), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(Ptr1),	hl
		ld	de, (Ptr1)
		ld	hl, (word_027E)
		add	hl, de
		ld	(word_027E), hl
		ld	a, (IT)
		and	00000001b
		jp	nz, loc_81C7
		ld	hl, (pIndex)
		or	a
		sbc	hl, de
		ld	(pIndex), hl
loc_81C7:
		ld	de, (pIndex)
		ld	hl, (word_027E)
		or	a
		sbc	hl, de
		jp	c, loc_819A
		ld	hl, byte_A60D
		dec	(hl)
		ld	hl, (Ptr)
		ld	(word_027E), hl
		ld	de, (word_027A)
		or	a
		sbc	hl, de
		ld	(pIndex), hl
		ld	hl, (word_027C)
		ld	(word_A644), hl
		ld	hl, (word_027E)
		ld	de, (Ptr1)
		add	hl, de
		ld	(word_027A), hl
		ld	de, (word_027A)
		ld	hl, (word_A644)
		or	a
		sbc	hl, de
		ld	(word_A644), hl
		ld	de, (word_0292)
		add	hl, de
		ld	(word_A642), hl
		ld	hl, (pIndex)
		add	hl, de
		ld	(word_A644), hl
		ld	a, (N)
		ld	hl, byte_A60D
		sub	(hl)
		ld	(N), a
		xor	a
		ld	(byte_04C3), a
		ld	a, (byte_A60D)
		ld	hl, byte_A60B
		cp	(hl)
		jp	c, loc_823B
		ld	de, (Ptr1)
		ld	hl, (word_A642)
		add	hl, de
		ld	(word_A642), hl
		jp	loc_827E
loc_823B:
		ld	de, byte_0515
		ld	hl, byte_052D
		call	sub_980F
		ld	a, (byte_A60B)
		ld	hl, byte_A60D
		sub	(hl)
		ld	(byte_A60B), a
		ld	hl, byte_A60B
		dec	(hl)
		ld	hl, byte_A60D
		inc	(hl)
		ld	hl, N
		dec	(hl)
		ld	de, (Ptr1)
		ld	hl, (word_A644)
		add	hl, de
		ld	(word_A644), hl
		ld	hl, (word_027E)
		add	hl, de
		ld	(word_027E), hl
		ld	(Ptr), hl
		ld	a, (byte_A60B)
		or	a
		jp	nz, loc_827E
		ld	a, 1
		ld	(byte_04C3), a
		jp	loc_8281
loc_827E:
		call	sub_7E48
loc_8281:
		ld	de, byte_0512
		ld	hl, byte_052D
		call	sub_980F
		call	sub_7108
		ld	hl, (word_027E)
		ld	(Ptr), hl
		ld	hl, (pGLBBuffer3)
		ld	de, 14h
		add	hl, de
		ld	(Ptr1),	hl
		ld	bc, (Ptr1)
		ld	hl, (word_027E)
		ex	de, hl
		ld	hl, (word_027C)
		call	sub_9721
		ld	(Ptr1),	hl
		ex	de, hl
		ld	(word_027E), hl
		ld	hl, (Ptr1)
		ld	de, 0
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 0
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (word_A64A)
		ld	(Ptr), hl
		ld	de, 765
		add	hl, de
		ld	(Ptr1),	hl
		ld	de, byte_051B
		call	sub_980F
		ld	hl, (Ptr1)
		ld	de, byte_0512
		call	sub_980E
		ld	hl, (word_A642)
		ex	de, hl
		ld	hl, (Ptr)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr)
		ld	de, 2
		add	hl, de
		ld	(Ptr), hl
		ld	hl, (pGLBBuffer3)
		ld	(Ptr2),	hl
		ld	de, 765
		add	hl, de
		ld	(Ptr1),	hl
		ld	de, byte_051B
		call	sub_980E
		ld	hl, (word_A644)
		ex	de, hl
		ld	hl, (Ptr2)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr2)
		ld	de, 2
		add	hl, de
		ld	(Ptr2),	hl
		ex	de, hl
		ld	hl, (Ptr)
		call	CopyHLDE	; Copy (HL) bytes from (HL) to (DE)
		ld	hl, (Ptr2)
		ld	de, 9
		add	hl, de
		ld	a, (N)
		ld	(hl), a
		ld	de, 4
		add	hl, de
		ld	(Ptr2),	hl
		call	sub_802B
		ld	hl, (Ptr)
		ld	de, 9
		add	hl, de
		ld	a, (byte_A60D)
		ld	(hl), a
		ld	de, 4
		add	hl, de
		ld	(Ptr), hl
		ld	de, (Ptr2)
		ld	hl, (Ptr)
		ld	a, 5
		call	CopyUp		; Copy A bytes from (DE)->(HL) up
		ld	hl, (Ptr)
		inc	hl
		ld	a, 11111110b
		and	(hl)
		ld	(hl), a
		inc	hl
		ld	(Ptr), hl
		ld	de, byte_0524
		call	sub_980F
		ld	de, byte_0512
		ld	hl, byte_0518
		call	sub_980F
		call	sub_7995
		call	sub_802B
		ld	de, byte_0512
		ld	hl, byte_0515
		call	sub_980F
		ld	a, (byte_04DF)
		ld	(ix+0),	a
		inc	ix
		call	sub_7305
		dec	ix
		ld	a, (ix+0)
		ld	(byte_04DF), a
		ld	de, byte_0512
		ld	hl, byte_052D
		call	sub_980F
		call	sub_702D
		ld	de, byte_0512
		ld	hl, byte_0518
		call	sub_980F
		call	sub_6DEB
		ld	a, (byte_04C3)
		or	a
		jp	nz, loc_8405
		dec	ix
		ld	a, (ix+0)
		ld	(byte_04CC), a
		ld	(word_A640), ix
		ld	hl, (word_A640)
		dec	hl
		dec	hl
		ld	a, (hl)
		ld	(byte_A695), a
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		ld	(word_A640), hl
		ld	a, (byte_04DF)
		cp	0
		jp	z, loc_83FD
		ld	(Ptr1),	hl
		dec	hl
		dec	hl
		ld	e, (hl)
		ld	d, 0
		or	a
		sbc	hl, de
		ld	(word_A640), hl
		ld	a, (byte_A695)
		ld	(IT), a
		ld	hl, IT
		inc	(hl)
		inc	(hl)
		ld	hl, (word_A640)
		ex	de, hl
		ld	hl, (Ptr1)
		ld	a, (IT)
		call	ShiftDn		; Shifts the stack towards its base
loc_83FD:
		ld	a, (byte_A695)
		add	a, 3
		ld	(byte_A695), a
loc_8405:
		ld	a, 1
		ld	(byte_04DF), a
		ld	a, 0
		ld	(byte_A696), a
		ld	de, byte_0521
		ld	hl, byte_052D
		call	sub_980F
		ld	de, byte_0512
		ld	hl, byte_0524
		call	sub_980F
		ld	hl, byte_0512
		ld	de, Nil
		call	JDEN
		jp	z, locret_8430
		call	sub_6D48
locret_8430:
		ret
; End of function sub_810A
; =============== S U B	R O U T	I N E =======================================
sub_8431:
		call	SSChk		; Check	for room on the	syntax stack
		ld	a, (I1)
		or	a
		jp	z, locret_84BB
		ld	hl, (pGLBBuffer3)
		ld	(word_0276), hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(word_02B8), hl
		ld	de, 765
		ld	hl, (word_0276)
		add	hl, de
		ld	de, (word_02B8)
		or	a
		sbc	hl, de
		ld	(word_0276), hl
		ld	hl, (Ptr)
		ld	de, (Ptr1)
		or	a
		sbc	hl, de
		ld	(Ptr3),	hl
		ld	hl, (Ptr1)
		ld	(Ptr2),	hl
		ld	bc, (Ptr1)
		ld	hl, (Ptr)
		ex	de, hl
		ld	hl, (word_0276)
		call	sub_9721
		ld	(Ptr1),	hl
		ex	de, hl
		ld	(Ptr), hl
		ld	hl, (Ptr1)
		ld	de, 0
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (Ptr2)
		ld	(Ptr), hl
		ld	de, (Ptr3)
		ld	hl, (word_02B8)
		add	hl, de
		ld	(word_02B8), hl
		ex	de, hl
		ld	hl, (pGLBBuffer3)
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (pGLBBuffer3)
		ld	de, 0Bh
		add	hl, de
		ld	(pIndex), hl
		ld	a, (hl)
		ld	hl, I1
		sub	(hl)
		ld	(IT), a
		ld	hl, (pIndex)
		ld	(hl), a
		call	sub_802B
locret_84BB:
		ret
; End of function sub_8431
; =============== S U B	R O U T	I N E =======================================
sub_84BC:
		call	SSChk		; Check	for room on the	syntax stack
		ld	de, byte_0512
		ld	hl, byte_053F
		call	sub_980F
		call	sub_79AA
		ld	hl, (Ptr)
		inc	hl
		ld	(Ptr), hl
		ld	a, (byte_054A)
		ld	(IT), a
loc_84D8:
		ld	a, (IT)
		or	a
		jp	z, loc_84F0
		ld	hl, (Ptr)
		ld	de, 0Ch
		add	hl, de
		ld	(Ptr), hl
		ld	hl, IT
		dec	(hl)
		jp	loc_84D8
loc_84F0:
		ld	hl, (Ptr)
		ld	de, 9
		add	hl, de
		ld	(Ptr), hl
		ld	de, byte_052A
		call	sub_980E
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
		ret
; End of function sub_84BC
; =============== S U B	R O U T	I N E =======================================
sub_8506:
		ld	de, Commands
		jr	loc_8555
; End of function sub_8506
; =============== S U B	R O U T	I N E =======================================
sub_850B:
		call	sub_85AF
		ld	hl, (pStkPos)
		ld	a, (hl)
		and	11011111b
		cp	5Ah		; 'Z'
		jr	nz, loc_851A
		dec	b
		inc	hl
loc_851A:
		ld	de, ssvPiece
		call	sub_85E9
		jr	nc, loc_8576
		jp	Error05		; Illegal command name
; End of function sub_850B
; =============== S U B	R O U T	I N E =======================================
sub_8525:
		call	sub_85AF
		push	af
		ld	hl, (pStkPos)
		ld	a, (hl)
		and	11011111b
		cp	5Ah		; 'Z'
		jr	z, loc_8540
		pop	af
		jr	c, loc_853B
		ld	de, svHorolog
		jr	loc_854D
loc_853B:
		ld	de, Functions
		jr	loc_8555
loc_8540:
		dec	b
		inc	hl
		pop	af
		jr	c, loc_854A
		ld	de, svzCount
		jr	loc_854D
loc_854A:
		ld	de, sfzCheck
loc_854D:
		call	sub_85E9
		jr	nc, loc_8576
		jp	Error05		; Illegal command name
loc_8555:
		ld	hl, (pStkPos)
		ld	a, (hl)
		and	11011111b
		cp	5Ah		; 'Z'
		jr	z, loc_859F
		sub	41h		; 'A'
		jp	c, Error05	; Illegal command name
		cp	19h
		jp	nc, Error05	; Illegal command name
		add	a, a
		add	a, a
		ld	c, a
		ld	b, 0
		ex	de, hl
		add	hl, bc
		inc	de
		ld	a, (de)
		cp	41h		; 'A'
		jr	nc, loc_858D
loc_8576:
		ld	a, (de)
		cp	LeftP
		jr	z, loc_857C
		dec	de
loc_857C:
		ex	de, hl
		ld	(pStkPos), hl
		call	GToken		; Loads	to (Token) the token code of char (++pStkPos)
		ld	a, (de)
		ld	l, a
		inc	de
		ld	a, (de)
		ld	h, a
		xor	a
		ld	(Locks), a
		jp	(hl)
loc_858D:
		inc	hl
		inc	hl
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		or	h
		jp	z, Error05	; Illegal command name
		call	sub_85CB
		jr	nc, loc_8576
		jp	Error05		; Illegal command name
loc_859F:
		call	sub_85AF
		dec	b
		inc	hl
		ld	de, sczSave
		call	sub_85E9
		jr	nc, loc_8576
		jp	Error05		; Illegal command name
; End of function sub_8525
; =============== S U B	R O U T	I N E =======================================
sub_85AF:
		push	hl
		ld	hl, (pStkPos)
		ld	b, 0
loc_85B5:
		ld	a, (hl)
		cp	LeftP
		jr	z, loc_85C8
		and	11011111b
		cp	41h		; 'A'
		jr	c, loc_85C8
		cp	LeftB		; Left bracket
		jr	nc, loc_85C9
		inc	hl
		inc	b
		jr	loc_85B5
loc_85C8:
		ccf
loc_85C9:
		pop	hl
		ret
; End of function sub_85AF
; =============== S U B	R O U T	I N E =======================================
sub_85CB:
		ld	b, 0
		ld	a, (hl)
loc_85CE:
		push	de
		ld	c, a
		inc	hl
loc_85D1:
		ld	a, (de)
		and	11011111b
		cp	(hl)
		jr	nz, loc_85DF
		inc	de
		inc	hl
		dec	c
		jr	nz, loc_85D1
		pop	bc
		or	a
		ret
loc_85DF:
		pop	de
		add	hl, bc
		inc	hl
		inc	hl
		ld	a, (hl)
		or	a
		jr	nz, loc_85CE
		scf
		ret
; End of function sub_85CB
; =============== S U B	R O U T	I N E =======================================
sub_85E9:
		ex	de, hl
		ld	a, b
		cp	1
		jr	z, loc_85F3
		call	sub_85CB
		ret
loc_85F3:
		dec	b
loc_85F4:
		ld	a, (hl)
		or	a
		jr	z, loc_8607
		ld	c, a
		inc	hl
		ld	a, (de)
		and	11011111b
		cp	(hl)
		add	hl, bc
		jr	z, loc_8605
		inc	hl
		inc	hl
		jr	loc_85F4
loc_8605:
		inc	de
		scf
loc_8607:
		ccf
		ret
; End of function sub_85E9
Commands:	dw Error05		; Illegal command name
		dw 0
		dw ecBreak		; Entry	point of BREAK command
		dw scBreak
		dw ecClose		; Entry	point of CLOSE command
		dw scClose
		dw ecDo			; Entry	point of DO command
		dw scDo
		dw ecElse		; Entry	point of ELSE command
		dw scElse
		dw ecFor		; Entry	point of FOR command
		dw scFor
		dw ecGoto		; Entry	point of GOTO command
		dw scGoto
		dw ecHangHalt		; Ambiguous H commands
		dw scHang
		dw ecIf			; Entry	point of IF command
		dw scIf
		dw Error05		; Illegal command name
		dw 0
		dw ecKill		; Entry	point of KILL comand
		dw scKill
		dw ecLock		; Entry	point of LOCK command
		dw scLock
		dw Error05		; Illegal command name
		dw 0
		dw Error05		; Illegal command name
		dw 0
		dw ecOpen		; Entry	point of OPEN command
		dw scOpen
		dw ecPrint		; Entry	point of PRINT/ZPRINT command
		dw scPrint
		dw ecQuit		; Entry	point of QUIT command
		dw scQuit
		dw ecRead		; Entry	point of READ command
		dw scRead
		dw ecSet		; Entry	point of SET command
		dw scSet
		dw Error05		; Illegal command name
		dw 0
		dw ecUse		; Entry	point of USE command
		dw scUse
		dw ecView		; Entry	point of VIEW command
		dw scView
		dw ecWrite		; Entry	point of WRITE command
		dw scWrite
		dw ecXecute		; Entry	point of XECUTE	command
		dw scXecute
		dw Error05		; Illegal command name
		dw 0
scBreak:	db 4,'REAK'
		dw ecBreak		; Entry	point of BREAK command
		db 0
scClose:	db 4,'LOSE'
		dw ecClose		; Entry	point of CLOSE command
		db 0
scDo:		db 1,'O'
		dw ecDo			; Entry	point of DO command
		db 0
scElse:		db 3,'LSE'
		dw ecElse		; Entry	point of ELSE command
		db 0
scFor:		db 2,'OR'
		dw ecFor		; Entry	point of FOR command
		db 0
scGoto:		db 3,'OTO'
		dw ecGoto		; Entry	point of GOTO command
		db 0
scHang:		db 3,'ANG'
		dw ecHang		; Entry	point of HANG command
scHalt:		db 3,'ALT'
		dw ecHalt		; Entry	point of HALT command
		db 0
scIf:		db 1,'F'
		dw ecIf			; Entry	point of IF command
		db 0
scKill:		db 3,'ILL'
		dw ecKill		; Entry	point of KILL comand
		db 0
scLock:		db 3,'OCK'
		dw ecLock		; Entry	point of LOCK command
		db 0
scOpen:		db 3,'PEN'
		dw ecOpen		; Entry	point of OPEN command
		db 0
scPrint:	db 4,'RINT'
		dw ecPrint		; Entry	point of PRINT/ZPRINT command
		db 0
scQuit:		db 3,'UIT'
		dw ecQuit		; Entry	point of QUIT command
		db 0
scRead:		db 3,'EAD'
		dw ecRead		; Entry	point of READ command
		db 0
scSet:		db 2,'ET'
		dw ecSet		; Entry	point of SET command
		db 0
scUse:		db 2,'SE'
		dw ecUse		; Entry	point of USE command
		db 0
scView:		db 3,'IEW'
		dw ecView		; Entry	point of VIEW command
		db 0
scWrite:	db 4,'RITE'
		dw ecWrite		; Entry	point of WRITE command
		db 0
scXecute:	db 5,'ECUTE'
		dw ecXecute		; Entry	point of XECUTE	command
		db 0
; ---------------------------------------------------------------------------
Functions:	dw efAscii		; Entry	point of $ASCII	function
		dw sfAscii
		dw Error05		; Illegal command name
		dw 0
		dw efChar		; Entry	point of $CHAR function
		dw sfChar
		dw efData		; Entry	point of $DATA function
		dw sfData
		dw efExtract		; Entry	point of $EXTRACT function
		dw sfExtract
		dw efFind		; Entry	point of $FIND function
		dw sfFind
		dw Error05		; Illegal command name
		dw 0
		dw Error05		; Illegal command name
		dw 0
		dw Error05		; Illegal command name
		dw 0
		dw efJustify		; Entry	point of $JUSTIFY function
		dw sfJustify
		dw Error05		; Illegal command name
		dw 0
		dw efLength		; Entry	point of $LENGTH function
		dw sfLength
		dw Error05		; Illegal command name
		dw 0
		dw efNext		; Entry	point of $NEXT function
		dw sfNext
		dw efOrder		; Entry	point of $ORDER	function
		dw sfOrder
		dw efPiece		; Entry	point of $PIECE	command
		dw sfPiece
		dw Error05		; Illegal command name
		dw 0
		dw efRandom		; Entry	point of $RANDOM function
		dw sfRandom
		dw efSelect		; Entry	point of $SELECT function
		dw sfSelect
		dw efText		; Entry	point of $TEXT function
		dw sfText
		dw Error05		; Illegal command name
		dw 0
		dw efView		; Entry	point of $VIEW function	(not implemented)
		dw sfView
		dw Error05		; Illegal command name
		dw 0
		dw Error05		; Illegal command name
		dw 0
		dw Error05		; Illegal command name
		dw 0
sfAscii:	db 4,'SCII'
		dw efAscii		; Entry	point of $ASCII	function
		db 0
sfChar:		db 3,'HAR'
		dw efChar		; Entry	point of $CHAR function
		db 0
sfData:		db 3,'ATA'
		dw efData		; Entry	point of $DATA function
		db 0
sfExtract:	db 6,'XTRACT'
		dw efExtract		; Entry	point of $EXTRACT function
		db 0
sfFind:		db 3,'IND'
		dw efFind		; Entry	point of $FIND function
		db 0
sfJustify:	db 6,'USTIFY'
		dw efJustify		; Entry	point of $JUSTIFY function
		db 0
sfLength:	db 5,'ENGTH'
		dw efLength		; Entry	point of $LENGTH function
		db 0
sfNext:		db 3,'EXT'
		dw efNext		; Entry	point of $NEXT function
		db 0
sfOrder:	db 4,'RDER'
		dw efOrder		; Entry	point of $ORDER	function
		db 0
sfPiece:	db 4,'IECE'
		dw efPiece		; Entry	point of $PIECE	command
		db 0
sfRandom:	db 5,'ANDOM'
		dw efRandom		; Entry	point of $RANDOM function
		db 0
sfSelect:	db 5,'ELECT'
		dw efSelect		; Entry	point of $SELECT function
		db 0
sfText:		db 3,'EXT'
		dw efText		; Entry	point of $TEXT function
		db 0
sfView:		db 3,'IEW'
		dw efView		; Entry	point of $VIEW function	(not implemented)
		db 0
; ---------------------------------------------------------------------------
svHorolog:	db 7,'HOROLOG'
		dw evHorolog		; Entry	point of $HOROLOG variable
svIo:		db 2,'IO'
		dw evIo			; Entry	point of $IO variable
svJob:		db 3,'JOB'
		dw evJob		; Entry	point of $JOB variable
svStorage:	db 7,'STORAGE'
		dw evStorage		; Entry	point of $STORAGE variable
svTest:		db 4,'TEST'
		dw evTest		; Entry	point of $TEST variable
svX:		db 1,'X'
		dw evX			; Entry	point of $X variable
svY:		db 1,'Y'
		dw evY			; Entry	point of $Y variable
		db 0
; ---------------------------------------------------------------------------
sczSave:	db 4,'SAVE'
		dw eczSave		; Entry	point of ZSAVE command
sczLoad:	db 4,'LOAD'
		dw eczLoad		; Entry	point of ZLOAD command
sczPrint:	db 5,'PRINT'
		dw ecPrint		; Entry	point of PRINT/ZPRINT command
sczDelete:	db 6,'DELETE'
		dw eczDelete		; Entry	point of ZDELETE command
sczRemove:	db 6,'REMOVE'
		dw eczRemove		; Entry	point of ZREMOVE command
sczMove:	db 4,'MOVE'
		dw eczMove		; Entry	point of ZMOVE command
sczGo:		db 2,'GO'
		dw eczGo		; Entry	point of ZGO command
sczInsert:	db 6,'INSERT'
		dw eczInsert		; Entry	point of ZINSERT command
sczOption:	db 6,'OPTION'
		dw eczOption		; Entry	point of ZOPTION command
		db 0
; ---------------------------------------------------------------------------
svzCount:	db 5,'COUNT'
		dw evzCount		; Entry	point of $ZCOUNT variable
svzError:	db 5,'ERROR'
		dw esvError		; Entry	point of $ERROR	variable
svzGlobal:	db 6,'GLOBAL'
		dw evzGlobal		; Entry	point of $ZGLOBAL variable
svzName:	db 4,'NAME'
		dw evzName		; Entry	point of $ZNAME	variable
svzRoutine:	db 7,'ROUTINE'
		dw evzRoutine		; Entry	point of $ZROUTINE variable
		db 0
; ---------------------------------------------------------------------------
sfzCheck:	db 5,'CHECK'
		dw efzCheck		; Entry	point of $ZCHECK function
sfzExists:	db 6,'EXISTS'
		dw efzExists		; Entry	point of $ZEXISTS function
sfzOrder:	db 5,'ORDER'
		dw efzOrder		; Entry	point of $ZORDER function
		db 0
; ---------------------------------------------------------------------------
ssvPiece:	db 5,'PIECE'
		dw esvPiece		; Entry	point of $PIECE	variable
ssvError:	db 5,'ERROR'
		dw esvError		; Entry	point of $ERROR	variable
ssvX:		db 1,'X'
		dw evX			; Entry	point of $X variable
ssvY:		db 1,'Y'
		dw evY			; Entry	point of $Y variable
		db 0
; =============== S U B	R O U T	I N E =======================================
; Loads	to (Token) the token code of char (++pStkPos)
GToken:
		ld	hl, (pStkPos)
		inc	hl
		ld	(pStkPos), hl
		ld	l, (hl)
		ld	h, TokenTable
		ld	a, (hl)
		ld	(Token), a
		ret
; End of function GToken
; =============== S U B	R O U T	I N E =======================================
; GetChar (BIOS	call)
BGetChar:
		ld	a, 0
		ld	(Result), a
		ld	l, 3		; Console status
		call	BIOScall
		or	a
		ret	z		; Nothing there
		ld	a, 1
		ld	(Result), a
		ld	l, 6		; Console input
		call	BIOScall
		ld	(tmpChar), a
		cp	16		; ^P
		jr	nz, BGetChar1
		ld	a, (PrintTgl)
		xor	00000001b
		ld	(PrintTgl), a
		ret
BGetChar1:				; ^S
		cp	19
		ret	nz
		ld	a, 1
		ld	(StopTgl), a
		ret
; End of function BGetChar
; =============== S U B	R O U T	I N E =======================================
; GetChar if A!=0x00 (BIOS call)
BGetChar2:
		ld	a, (bBreakVal)	; Value	passed to BREAK	command
		or	a
		ret	z
		ld	l, 3		; Console status
		call	BIOScall
		or	a
		ret	z
		ld	l, 6		; Console input
		call	BIOScall
		cp	3
		jp	z, PrintErr17
		cp	16		; ^P
		jr	nz, BGetChar3
		ld	a, (PrintTgl)
		xor	00000001b
		ld	(PrintTgl), a
		ret
BGetChar3:				; ^S
		cp	19
		ret	nz
		ld	a, 1
		ld	(StopTgl), a
		ret
; End of function BGetChar2
; =============== S U B	R O U T	I N E =======================================
; Outputs error	message
PrintErr:
		push	af
		cp	1		; Is it	Stack Overflow?
		jr	nz, PrintErr1
		ld	ix, (pSynStack)
		ld	hl, (pPlus1000)
		ld	sp, hl
		xor	a
		ld	(byte_A69D), a
		ld	(byte_A6A3), a
PrintErr1:
		ld	a, (byte_A69F)
		or	a
		jr	z, PrintErr2
		ld	hl, (pIndex)
		ld	(pStkPos), hl
PrintErr2:
		ld	a, (Mode)
		cp	1
		jp	z, PrintErr4
		ld	a, (byte_A6A3)
		or	a
		jp	z, PrintErr4
		ld	hl, 2047h	; (todo) Check this
		ld	(CmdLine), hl
		ld	a, (byte_A04B)
		ld	c, a
		add	a, 2
		ld	(CmdLineSz), a
		ld	b, 0
		ld	de,  CmdLine+2
		ld	hl, ArgPl
		ldir
		ex	de, hl
		ld	(hl), 0Dh
		pop	af
		call	IntToStr
		dec	ix
		dec	ix
		ld	b, (ix+0)
		ld	a, Semicolon
		call	sub_8B33	; Puts A into the stack	(IX)
		push	bc
		ld	hl, byte_A668
		call	sub_97D5
		pop	bc
		call	sub_8B3A
		ld	hl, ibcdUnk07
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jr	z, PrintErr3
		ld	a, Plus
		call	sub_8B33	; Puts A into the stack	(IX)
		push	bc
		call	CharToStr	; Convert char (0-255) to string
		pop	bc
		call	sub_8B3A
PrintErr3:
		ld	a, Carat
		call	sub_8B33	; Puts A into the stack	(IX)
		push	bc
		ld	hl, (pRtnName)
		call	sub_97D5
		pop	bc
		call	sub_8B3A
		ld	a, Semicolon
		call	sub_8B33	; Puts A into the stack	(IX)
		ld	hl, (pStkPos)
		ld	de, (pStkStart)
		or	a
		sbc	hl, de
		ld	(pIndex), hl
		push	bc
		call	sub_9321
		pop	bc
		call	sub_8B3A
		ld	(ix+0),	b
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ld	hl, byte_A04B
		call	sub_97A2
		call	sub_8B22
		xor	a
		ld	(byte_A6A3), a
		ld	a, 1
		ld	(byte_04FF), a
		ld	hl, CmdLine
		ld	(pStkPos), hl
		ld	(pStkStart), hl
		call	sub_8B17
		ret
PrintErr4:				; Outputs a CrLf
		call	putCrLf
		call	putAsterisk	; Places an asterisk under the error position
		ld	de, ErrorsFCB
		ld	a, (ErrorsDR)
		inc	a
		ld	(de), a
		ld	c, 15		; Open file
		call	BDOScall	; Make a call to the CP/M BDOS
		cp	0FFh		; Did it fail?
		jp	nz, PrintErr6
		pop	af
		ld	hl, sErr2
		ld	(hl), Slash
PrintErr5:
		inc	(hl)
		sub	0Ah
		jp	nc, PrintErr5
		add	a, Colon
		inc	hl
		ld	(hl), a
		ld	hl, sErr1
		jp	PrintErr7
PrintErr6:
		pop	af
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	a, l
		and	01111111b
		ld	e, a
		ld	a, l
		and	10000000b
		ld	l, a
		add	hl, hl
		ld	d, h
		push	de
		ld	de, Page0BUF	; Default buffer for reading sequential	files (80h-FFh)
		ld	c, 26		; Set DMA address
		call	BDOScall	; Make a call to the CP/M BDOS
		pop	de
		push	de
		ld	hl, ErrorsFCB+32
		ld	(hl), d
		ld	de, ErrorsFCB
		ld	c, 20		; Read next record
		call	BDOScall	; Make a call to the CP/M BDOS
		pop	de
		ld	d, 0
		ld	hl, Page0Buf
		add	hl, de		; Points to the	error message
PrintErr7:
		ld	a, (hl)
		cp	0Dh
		jp	z, PrintErr8
		call	putChar		; Outputs the character	on A to	the console
		inc	hl
		jr	PrintErr7
PrintErr8:				; Outputs a CrLf
		call	putCrLf
		call	putCrLf		; Outputs a CrLf
		ld	a, (Mode)
		cp	0
		jp	z, PrintErr16
PrintErr9:
		cp	1
		jp	z, PrintErr19
		ld	b, a
		ld	hl, (pStkPos)
PrintErr10:
		ld	a, (hl)
		cp	0Dh
		jr	z, PrintErr11
		inc	hl
		jr	PrintErr10
PrintErr11:
		inc	hl
		inc	hl
		ld	a, b
		cp	2
		jp	z, PrintErr12
		ld	bc, 6
		add	hl, bc
		ld	(TPP), hl
		ld	ix, (TPP)
		call	IndRet		; Return from indirection
		ld	hl, sIndirection
		jp	PrintErr15
PrintErr12:
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		ld	b, 3
PrintErr13:
		ld	a, (hl)
		cp	10h
		jr	c, PrintErr14
		inc	hl
		jr	PrintErr13
PrintErr14:
		inc	hl
		inc	hl
		djnz	PrintErr13
		inc	hl
		inc	hl
		inc	hl
		ld	(TPP), hl
		ld	ix, (TPP)
		call	sub_69DD
		ld	hl, sXecute
PrintErr15:				; Outputs a string which size is pointed by HL
		call	putStrSz
		call	putAsterisk	; Places an asterisk under the error position
		ld	a, (Mode)
		cp	0
		jp	nz, PrintErr9
PrintErr16:
		call	sub_929E
		jr	PrintErr19
PrintErr17:
		ld	a, (Mode)
		cp	1
		jr	z, PrintErr18
		xor	a
		ld	(Case),	a
		ld	(Mode),	a
		ld	(byte_A69C), a
		call	bcBreak		; Body of BREAK	command
		call	sub_55D2
		call	sub_8B17
		ret
PrintErr18:
		ld	sp, (pPlus1000)
		xor	a
		ld	(byte_A69D), a
		ld	(byte_A69C), a
PrintErr19:				; Outputs a CrLf
		call	putCrLf
		xor	a
		ld	(DeviceInUse), a
		call	sub_574A
		call	sub_8B17
		ld	a, (byte_A69D)
		or	a
		jp	z, PrintErr20
		call	sub_8B22
		dec	ix
		dec	ix
		ld	a, (ix+0)
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	ix, bc
		jp	PrintErr21
PrintErr20:
		ld	ix, (pSynStack)
		ld	sp, (pPlus1000)
PrintErr21:				; b2:Routine not saved
		ld	a, (bmFlag1)
		and	00001100b
		ld	(bmFlag1), a	; b2:Routine not saved
		jp	Main		; Prepare initial execution
; End of function PrintErr
; =============== S U B	R O U T	I N E =======================================
sub_8B17:
		xor	a
		ld	(Wait),	a
		ld	(Time),	a
		ld	(byte_04FD), a
		ret
; End of function sub_8B17
; =============== S U B	R O U T	I N E =======================================
sub_8B22:
		pop	bc
		ld	de, 883h	; (todo) Check this
loc_8B26:
		pop	hl
		or	a
		sbc	hl, de
		jr	nz, loc_8B26
		push	de
		push	bc
		ld	ix, (word_A652)
		ret
; End of function sub_8B22
; =============== S U B	R O U T	I N E =======================================
; Puts A into the stack	(IX)
sub_8B33:
		ld	(ix+0),	a
		inc	ix
		inc	b
		ret
; End of function sub_8B33
; =============== S U B	R O U T	I N E =======================================
sub_8B3A:
		dec	ix
		dec	ix
		ld	a, (ix+0)
		add	a, b
		ld	b, a
		ret
; End of function sub_8B3A
; =============== S U B	R O U T	I N E =======================================
; Compares two strings (sets BC=INTLN*257 first)
SCmp0:
		ld	bc, INTLN*257
; End of function SCmp0
; =============== S U B	R O U T	I N E =======================================
; Compares two strings
SCmp:
		push	hl
		push	de
		push	bc
		call	SCmpB		; Compares two strings pointed by (DE) and (HL)
		pop	bc
		pop	de
		pop	hl
		ret
; End of function SCmp
; =============== S U B	R O U T	I N E =======================================
; Compares two strings pointed by (DE) and (HL)
SCmpB:
		ld	a, b
		or	a
		jr	nz, SCmpB1
		or	c
		ret	z
		jp	SCmpB2
SCmpB1:
		ld	a, c
		or	a
		jr	z, SCmpB2
		ld	a, (de)
		cp	(hl)
		ret	nz
		inc	hl
		inc	de
		dec	b
		dec	c
		jp	SCmpB		; Compares two strings pointed by (DE) and (HL)
SCmpB2:
		cp	b
		ret
; End of function SCmpB
; =============== S U B	R O U T	I N E =======================================
sub_8B6A:
		ld	a, (I6)
		push	af
		ld	a, (I1)
		ld	c, a
		ld	b, 0Eh
		ld	hl, (Ptr1)
		ld	de, lbcdTemp1
		call	BCDPack
		ld	(Signal1), a
		ld	a, (Count)
		ld	(byte_04EE), a
		ld	a, (I2)
		ld	c, a
		ld	hl, (Ptr2)
		ld	de, lbcdTemp2
		call	BCDPack
		ld	(byte_04F1), a
		ld	a, (Count)
		ld	(byte_04EF), a
loc_8B9C:
		ld	c, a
		ld	a, (byte_04EE)
		ld	b, a
		pop	af
		cp	0Dh
		jr	nc, loc_8BAF
		cp	7
		jp	nc, loc_8C40
		cp	5
		jr	z, loc_8BB7
loc_8BAF:
		ld	a, (byte_04F1)
		xor	00000001b
		ld	(byte_04F1), a
loc_8BB7:
		ld	a, b
		sub	c
		jr	z, loc_8BFF
		jr	c, loc_8BDA
		ld	c, b
		ld	b, a
		ld	hl, I2
		ld	a, 1Ch
		sub	(hl)
		cp	b
		ld	hl, lbcdTemp2
		jr	nc, loc_8BF6
		ld	de, lbcdTemp1
		ex	de, hl
		call	CopyCDEHL	; Copy C bytes from (DE) to (HL)
		ld	a, (byte_04EF)
		ld	(byte_04EE), a
		jr	loc_8BE8
loc_8BDA:
		cpl
		inc	a
		ld	b, a
		ld	hl, I1
		ld	a, 1Ch
		sub	(hl)
		cp	b
		jr	c, loc_8BE8
		jr	loc_8BF3
loc_8BE8:
		ld	a, (I6)
		cp	0Dh
		jp	nc, loc_8D52
		jp	loc_8D86
loc_8BF3:
		ld	hl, lbcdTemp1
loc_8BF6:
		push	bc
		ld	c, 0Eh
loc_8BF9:
		call	sub_9014
		djnz	loc_8BF9
		pop	bc
loc_8BFF:
		ld	a, c
		ld	(byte_04EE), a
		ld	hl, Signal1
		ld	a, (byte_04F1)
		cp	(hl)
		ld	hl, lbcdTemp1
		ld	de, lbcdTemp2
		ld	c, 0Eh
		jr	nz, loc_8C22
		ld	a, (I6)
		cp	0Dh
		jp	nc, loc_8D52
		call	AbcdDEHL	; Adds two C bytes long	BCDs pointed by	(DE) and (HL)
					; result goes in the BCD pointed by (HL)
		jp	loc_8D86
loc_8C22:
		ld	b, 0Eh
		call	SCmp		; Compares two strings
		jr	c, loc_8C30
		ex	de, hl
		ld	a, (byte_04F1)
		ld	(Signal1), a
loc_8C30:
		push	af
		ld	a, (I6)
		cp	0Dh
		jp	nc, loc_8D4C
		pop	af
		call	SbcdDEHL	; Subtracts two	C bytes	long BCDs pointed by (DE) and (HL)
					; result goes in the BCD pointed by (HL)
		jp	loc_8D86
loc_8C40:
		cp	9
		jr	z, loc_8C6F
		cp	0Bh
		jp	nc, loc_8D1C
		push	af
		ld	hl, Signal1
		ld	a, (byte_04F1)
		xor	(hl)
		ld	(Signal1), a
		pop	af
		cp	7
		jr	nz, loc_8C6F
		ld	a, b
		add	a, c
		ld	(byte_04EE), a
		ld	hl, lbcdTemp1
		ld	de, lbcdTemp2
		ld	c, 0Eh
		call	MbcdDEHL	; Multiplies two C bytes long BCD pointed by DE	and HL
					; result goes in MResult
		ld	hl, ibcdResult	; Multiplication result
		jp	loc_8D86
loc_8C6F:
		push	af
		cp	9
		jr	nz, loc_8C81
		ld	hl, byte_9F15
		ld	de, lbcdTemp1
		push	bc
		ld	c, 14
		call	CopyCDEHL	; Copy C bytes from (DE) to (HL)
		pop	bc
loc_8C81:
		ld	a, b
		sub	c
		jr	c, loc_8C88
		ld	b, a
		jr	loc_8C95
loc_8C88:
		ld	hl, lbcdTemp1
		ld	c, 0Eh
		cpl
		inc	a
		ld	b, a
loc_8C90:
		call	sub_9014
		djnz	loc_8C90
loc_8C95:
		pop	af
		cp	8
		jr	nz, loc_8CAF
		ld	hl, lbcdTemp1
		ld	de, lbcdTemp2
		ld	c, 14
		call	sub_9040
		ld	hl, byte_9F23
		ld	a, b
		ld	(byte_04EE), a
		jp	loc_8D86
loc_8CAF:
		cp	9
		jr	nz, loc_8CFE
		ld	hl, lbcdTemp1
		ld	de, lbcdTemp2
		ld	c, 14
		call	sub_9040
		ld	de, byte_9F23
		call	sub_8E9E
		ld	a, b
		or	a
		jr	z, loc_8CD7
		ld	a, (Signal1)
		ld	hl, 1265
		cp	(hl)
		ld	hl, lbcdTemp1
		jr	z, loc_8CD7
		call	IbcdHL		; Increments by	1 the C	bytes long BCD pointed by (HL)
loc_8CD7:
		ld	de, lbcdTemp2
		call	MbcdDEHL	; Multiplies two C bytes long BCD pointed by DE	and HL
					; result goes in MResult
		ld	hl, lbcdTemp1
		ld	de, byte_9F15
		call	CopyCDEHL	; Copy C bytes from (DE) to (HL)
		ld	hl, lbcdTemp2
		ld	de, ibcdResult	; Multiplication result
		call	CopyCDEHL	; Copy C bytes from (DE) to (HL)
		ld	a, (Signal1)
		ld	(byte_04F1), a
		ld	a, 2
		push	af
		ld	a, (byte_04EF)
		jp	loc_8B9C
loc_8CFE:
		cp	0Ah
		jr	nz, loc_8D1C
		ld	hl, lbcdTemp1
		ld	de, lbcdTemp2
		ld	c, 14
		call	sub_8FB4
		ld	hl, lbcdTemp1
		ld	de, ibcdResult	; Multiplication result
		call	sub_8E9E
		xor	a
		ld	(byte_04EE), a
		jr	loc_8D86
loc_8D1C:
		cp	11
		jr	nz, loc_8D34
		ld	hl, lbcdTemp1
		ld	c, 14
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jr	z, loc_8D64
		ld	hl, lbcdTemp2
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jr	z, loc_8D64
		jr	loc_8D6F
loc_8D34:
		cp	12
		jr	nz, loc_8D52
		ld	hl, lbcdTemp1
		ld	c, 14
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jr	nz, loc_8D6F
		ld	hl, lbcdTemp2
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jr	z, loc_8D64
		jr	loc_8D6F
loc_8D4C:
		pop	af
		jr	z, loc_8D64
		ld	a, (I6)
loc_8D52:
		cp	13
		jr	nz, loc_8D5E
		ld	a, (Signal1)
		or	a
		jr	z, loc_8D64
		jr	loc_8D6F
loc_8D5E:
		ld	a, (Signal1)
		or	a
		jr	z, loc_8D6F
loc_8D64:				; b2:Routine not saved
		ld	a, (bmFlag1)
		and	00000010b
		jr	nz, loc_8D76
loc_8D6B:				; '0'
		ld	a, 30h
		jr	loc_8D78
loc_8D6F:				; b2:Routine not saved
		ld	a, (bmFlag1)
		and	00000010b
		jr	nz, loc_8D6B
loc_8D76:				; '1'
		ld	a, 31h
loc_8D78:
		call	SPush
		ld	a, 1
		call	SPush
		ld	a, 3
		call	SPush
		ret
loc_8D86:
		ld	c, 9
		call	sub_908D
		call	BCDPush		; Push BCD into	the stack
		ret
; End of function sub_8B6A
;
; BCDPack
;	ON ENTRY:
;	   H,L AT MOST SIGNIFICANT BYTE	OF STRING
;	   D,E AT MOST SIGNIFICANT BYTE	OF OF BCD PLACE
;	   B   MAX NUMBER OF BYTES ALLOWED (14 FOR REAL, 5 FOR INTEGER)
;	   C   NUMBER OF BYTES IN STRING
;
;	ON EXIT:
;	  A  SIGN OF BCD NUMBER--0 IF POSITIVE,	1 IF NEGATIVE
;	  COUNT	 NUMBER	OF DECIMAL PLACES
;
; =============== S U B	R O U T	I N E =======================================
; Packs	a string into BCD form
BCDPack:
		push	hl
		push	de
		ld	a, Minus	; Check	for negative
		cp	(hl)
		ld	a, 0		; Assume >= 0
		jr	nz, BCDPack1
		inc	hl		; Skip minux sign
		dec	c
		ld	a, 1		; Set <	0
BCDPack1:				; Save sign indicator
		push	af
		push	bc
		ld	a, b
		add	a, a
		dec	a
		cp	c
		jp	c, Error02	; Arithmetic overflow
		ld	b, 0
		ld	a, Point
		cpir
		ld	a, c
		ld	(Count), a
		add	hl, bc
		dec	hl
		ex	de, hl
		pop	bc
		push	bc
		ld	c, b
		call	pHLtoLbcd	; Points HL to the last	byte of	C long BCD
		pop	bc
		push	bc
BCDPack2:
		ld	a, (de)
		cp	Point
		jr	z, BCDPack4
		rrd
BCDPack3:
		dec	c
		jr	z, BCDPack5
		dec	de
		ld	a, (de)
		cp	Point
		jr	z, BCDPack3
		rrd
		dec	hl
		dec	b
BCDPack4:
		dec	de
		dec	c
		jp	nz, BCDPack2
		jr	BCDPack6
BCDPack5:
		xor	a
		rrd
		xor	a
		jr	BCDPack8
BCDPack6:
		ld	a, b
		or	a
		jr	z, BCDPackEnd
		xor	a
BCDPack7:
		ld	(hl), a
BCDPack8:
		dec	hl
		djnz	BCDPack7
BCDPackEnd:
		pop	bc
		pop	af		; Get sign back
		pop	de
		pop	hl
		ret
; End of function BCDPack
; =============== S U B	R O U T	I N E =======================================
; Points HL to the last	byte of	C long BCD
pHLtoLbcd:
		push	bc
		ld	b, 0
		add	hl, bc
		dec	hl
		pop	bc
		ret
; End of function pHLtoLbcd
; =============== S U B	R O U T	I N E =======================================
; Multiplies C bytes long BCD pointed by (HL) by 2
Mbcd2:
		call	pHLtoLbcd	; Points HL to the last	byte of	C long BCD
		push	af
		push	bc
		xor	a
Mbcd21:
		ld	a, (hl)
		adc	a, a
		daa
		ld	(hl), a
		dec	hl
		dec	c
		jp	nz, Mbcd21
		inc	hl
		pop	bc
		pop	af
		ret
; End of function Mbcd2
; =============== S U B	R O U T	I N E =======================================
; Divides C bytes long BCD pointed by (HL) by 2
Dbcd2:
		push	bc
		push	de
		push	hl
		xor	a
		ld	b, c
		ld	d, 160
Dbcd21:
		ld	a, (hl)
		jr	nc, Dbcd22
		add	a, d
Dbcd22:
		rra
		bit	3, a
		jr	z, Dbcd23
		dec	a
		dec	a
		dec	a
Dbcd23:
		ld	(hl), a
		inc	hl
		djnz	Dbcd21
		pop	hl
		pop	de
		pop	bc
		ret
; End of function Dbcd2
; =============== S U B	R O U T	I N E =======================================
; Adds two C bytes long	BCDs pointed by	(DE) and (HL)
; result goes in the BCD pointed by (HL)
AbcdDEHL:
		push	bc
		push	af
		call	pHLtoLbcd	; Points HL to the last	byte of	C long BCD
		ex	de, hl
		call	pHLtoLbcd	; Points HL to the last	byte of	C long BCD
		xor	a
AbcdDEHL1:
		ld	a, (de)
		adc	a, (hl)
		daa
		ld	(de), a
		dec	hl
		dec	de
		dec	c
		jp	nz, AbcdDEHL1
		jp	c, Error02	; Arithmetic overflow
		ex	de, hl
		inc	hl
		inc	de
		pop	af
		pop	bc
		ret
; End of function AbcdDEHL
; =============== S U B	R O U T	I N E =======================================
; Subtracts two	C bytes	long BCDs pointed by (DE) and (HL)
; result goes in the BCD pointed by (HL)
SbcdDEHL:
		push	bc
		push	af
		call	pHLtoLbcd	; Points HL to the last	byte of	C long BCD
		ex	de, hl
		call	pHLtoLbcd	; Points HL to the last	byte of	C long BCD
		ld	b, c
		xor	a
SbcdDEHL1:
		ld	a, (de)
		sbc	a, (hl)
		daa
		ld	(de), a
		dec	hl
		dec	de
		djnz	SbcdDEHL1
		jp	c, Error02	; Arithmetic overflow
		ex	de, hl
		inc	hl
		inc	de
		pop	af
		pop	bc
		ret
; End of function SbcdDEHL
; =============== S U B	R O U T	I N E =======================================
; Increments by	1 the C	bytes long BCD pointed by (HL)
IbcdHL:
		push	bc
		push	af
		push	hl
		call	pHLtoLbcd	; Points HL to the last	byte of	C long BCD
		xor	a
		ld	b, c
		ld	c, a
		scf
IbcdHL1:
		adc	a, (hl)
		daa
		ld	(hl), a
		jr	nc, IbcdHL2
		dec	hl
		ld	a, c
		djnz	IbcdHL1
		jp	c, Error02	; Arithmetic overflow
IbcdHL2:
		pop	hl
		pop	af
		pop	bc
		ret
; End of function IbcdHL
; =============== S U B	R O U T	I N E =======================================
; Decrements by	1 the C	bytes long BCD pointed by (HL)
DbcdHL:
		ld	a, (hl)
		and	11110000b
		jp	nz, IbcdHL	; Increments by	1 the C	bytes long BCD pointed by (HL)
		push	de
		push	bc
		push	af
		push	hl
		call	pHLtoLbcd	; Points HL to the last	byte of	C long BCD
		ld	e, 0
		scf
		ld	b, c
DbcdHL1:
		ld	a, (hl)
		sbc	a, e
		daa
		ld	(hl), a
		jr	nc, DbcdHL2
		dec	hl
		djnz	DbcdHL1
DbcdHL2:
		pop	hl
		pop	af
		pop	bc
		pop	de
		ret
; End of function DbcdHL
; =============== S U B	R O U T	I N E =======================================
; Tests	a C bytes long BCD pointed by (HL) for zero
lZtest:
		push	hl
		push	bc
		xor	a
		ld	b, a
lZtest1:
		cpi
		jr	nz, lZtest2
		jp	pe, lZtest1
lZtest2:
		pop	bc
		pop	hl
		ret
; End of function lZtest
; =============== S U B	R O U T	I N E =======================================
sub_8E9E:
		push	af
		push	de
		push	hl
		push	bc
		call	pHLtoLbcd	; Points HL to the last	byte of	C long BCD
		ex	de, hl
		call	pHLtoLbcd	; Points HL to the last	byte of	C long BCD
		or	a
		ld	a, b
		rra
		push	af
		push	de
		ld	b, a
		cpl
		ld	e, a
		ld	d, 255
		inc	de
		add	hl, de
		ld	a, c
		sub	b
		ld	c, a
		pop	de
		push	de
		ld	a, b
		ld	b, 0
		lddr
		or	a
		jr	z, loc_8EC8
		ld	b, a
		xor	a
loc_8EC4:
		ld	(de), a
		dec	de
		djnz	loc_8EC4
loc_8EC8:
		pop	hl
		pop	af
		jr	nc, loc_8ED9
		xor	a
		pop	bc
		push	bc
		ld	b, a
		sbc	hl, bc
		inc	hl
		ld	b, c
loc_8ED4:
		rrd
		inc	hl
		djnz	loc_8ED4
loc_8ED9:
		pop	bc
		pop	hl
		pop	de
		pop	af
		ret
; End of function sub_8E9E
; =============== S U B	R O U T	I N E =======================================
; Multiplies two C bytes long BCD pointed by DE	and HL
; result goes in MResult
MbcdDEHL:
		push	hl
		ld	hl, ibcdResult	; Multiplication result
		call	zeroCHL		; Fills	C bytes	pointed	by HL with 0x00
		pop	hl
		call	ZTest		; Tests	a bcd number for zero
		ret	z
		ex	af, af'         ; Saves AF on AF'
		ex	de, hl
		call	ZTest		; Tests	a bcd number for zero
		ex	de, hl
		ret	z
		push	hl
		push	de
		push	bc
		call	pHLtoLbcd	; Points HL to the last	byte of	C long BCD
		ex	de, hl
		call	pHLtoLbcd	; Points HL to the last	byte of	C long BCD
		ex	de, hl
		exx			; Saves	a copy of the registers
		pop	bc
		push	bc
		ld	hl, ibcdResult	; Multiplication result
		call	pHLtoLbcd	; Points HL to the last	byte of	C long BCD
		ld	e, a
		ex	af, af'         ; Restores AF from AF'
		ld	b, a
		add	a, e
		inc	a
		sub	c
		jr	c, MbcdHLDE1
		sub	c
		jp	nc, Error02	; Arithmetic overflow
MbcdHLDE1:
		exx
MbcdHLDE2:
		xor	a
		ex	af, af'
		ld	a, (hl)
		and	00001111b
		push	hl
		push	de
		ld	h, 4		; High byte of the multiplication table
		ld	c, a
		rrca
		rrca
		rrca
		rrca
		ld	b, a
		exx
		push	de
		push	hl
		exx
MbcdHLDE3:
		ld	a, (de)
		and	00001111b
		or	b
		call	sub_8F89
		jr	z, MbcdHLDE4
		ex	af, af'
		ld	a, (de)
		and	11110000b
		or	c
		call	sub_8F9A
		jr	z, MbcdHLDE5
		ex	af, af'
		dec	de
		jr	MbcdHLDE3
MbcdHLDE4:
		exx
		dec	hl
		exx
MbcdHLDE5:
		exx
		ld	(hl), a
		pop	hl
		pop	de
		dec	b
		exx
		pop	de
		pop	hl
		jp	z, MbcdHLDE9
		xor	a
		ex	af, af'
		ld	a, (hl)
		and	11110000b
		push	hl
		push	de
		exx
		push	de
		push	hl
		exx
		ld	b, a
		rrca
		rrca
		rrca
		rrca
		ld	c, a
		ld	h, 4		; (todo) Mult. table?
MbcdHLDE6:
		ld	a, (de)
		and	00001111b
		or	b
		call	sub_8F9A
		jr	z, MbcdHLDE8
		ex	af, af'
		ld	a, (de)
		and	11110000b
		or	c
		call	sub_8F89
		jr	z, MbcdHLDE7
		ex	af, af'
		dec	de
		jp	MbcdHLDE6
MbcdHLDE7:
		exx
		dec	hl
		exx
MbcdHLDE8:
		exx
		ld	(hl), a
		pop	hl
		dec	hl
		pop	de
		dec	b
		exx
		pop	de
		pop	hl
		dec	hl
		jp	nz, MbcdHLDE2
MbcdHLDE9:
		pop	bc
		pop	de
		pop	hl
		ret
; End of function MbcdDEHL
; =============== S U B	R O U T	I N E =======================================
sub_8F89:
		ld	l, a
		ex	af, af'
		add	a, (hl)
		daa
		exx
		add	a, (hl)
		daa
		ld	(hl), a
		ld	a, 0
		jr	nc, loc_8F97
		ld	a, 10h
loc_8F97:
		dec	e
		exx
		ret
; End of function sub_8F89
; =============== S U B	R O U T	I N E =======================================
sub_8F9A:
		ld	l, a
		ex	af, af'
		add	a, (hl)
		daa
		exx
		rrca
		rrca
		rrca
		rrca
		ld	c, a
		and	00001111b
		ld	d, a
		ld	a, c
		and	11110000b
		add	a, (hl)
		daa
		ld	(hl), a
		ld	a, 0
		adc	a, d
		dec	hl
		dec	e
		exx
		ret
; End of function sub_8F9A
; =============== S U B	R O U T	I N E =======================================
sub_8FB4:
		push	bc
		push	hl
		push	de
		ld	(word_0504), hl
		ex	de, hl
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jp	z, Error17	; Division by zero
		ex	de, hl
		ld	hl, byte_9F31
		call	CopyCDEHL	; Copy C bytes from (DE) to (HL)
		ld	hl, ibcdResult	; Multiplication result
		call	zeroCHL		; Fills	C bytes	pointed	by HL with 0x00
		ld	b, c
loc_8FCF:
		ld	de, byte_9F31
		ld	hl, (word_0504)
		ex	de, hl
		call	SCmp		; Compares two strings
		jr	c, loc_8FE1
		call	Mbcd2		; Multiplies C bytes long BCD pointed by (HL) by 2
		jp	loc_8FCF
loc_8FE1:
		pop	de
		push	de
		ld	hl, byte_9F31
		call	SCmp		; Compares two strings
		jr	z, loc_9010
		jr	nc, loc_9010
		ld	hl, ibcdResult	; Multiplication result
		call	Mbcd2		; Multiplies C bytes long BCD pointed by (HL) by 2
		ld	hl, byte_9F31
		call	Dbcd2		; Divides C bytes long BCD pointed by (HL) by 2
		ex	de, hl
		ld	hl, (word_0504)
		call	SCmp		; Compares two strings
		jr	z, loc_9004
		jr	nc, loc_8FE1
loc_9004:				; Subtracts two	C bytes	long BCDs pointed by (DE) and (HL)
		call	SbcdDEHL	; result goes in the BCD pointed by (HL)
		ld	hl, ibcdResult	; Multiplication result
		call	IbcdHL		; Increments by	1 the C	bytes long BCD pointed by (HL)
		jp	loc_8FE1
loc_9010:
		pop	de
		pop	hl
		pop	bc
		ret
; End of function sub_8FB4
; =============== S U B	R O U T	I N E =======================================
sub_9014:
		push	af
		push	bc
		push	de
		call	pHLtoLbcd	; Points HL to the last	byte of	C long BCD
		ld	b, c
		xor	a
loc_901C:
		rld
		dec	hl
		djnz	loc_901C
		or	a
		jp	nz, Error02	; Arithmetic overflow
		inc	hl
		pop	de
		pop	bc
		pop	af
		ret
; End of function sub_9014
; =============== S U B	R O U T	I N E =======================================
; Tests	a bcd number for zero
ZTest:
		push	hl
		push	bc
		xor	a
ZTest1:
		or	(hl)
		jr	nz, ZTest2
		inc	hl
		dec	c
		jp	nz, ZTest1
		jr	ZTest3
ZTest2:
		sub	0Fh
		sbc	a, a
		add	a, c
		add	a, c
ZTest3:
		or	a
		pop	bc
		pop	hl
		ret
; End of function ZTest
; =============== S U B	R O U T	I N E =======================================
sub_9040:
		push	hl
		push	de
		push	hl
		ld	hl, byte_9F23
		call	zeroCHL		; Fills	C bytes	pointed	by HL with 0x00
		pop	hl
loc_904A:
		pop	de
		push	de
		call	sub_8FB4
		push	hl
		ld	hl, byte_9F23
		call	sub_9014
		ld	de, ibcdResult	; Multiplication result
		call	AbcdDEHL	; Adds two C bytes long	BCDs pointed by	(DE) and (HL)
					; result goes in the BCD pointed by (HL)
		call	ZTest		; Tests	a bcd number for zero
		pop	hl
		cp	0Ah
		jr	nc, loc_9070
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jr	z, loc_9070
		call	sub_9014
		inc	b
		jp	loc_904A
loc_9070:
		pop	de
		pop	hl
		ret
; End of function sub_9040
; =============== S U B	R O U T	I N E =======================================
; Fills	C bytes	pointed	by HL with 0x00
zeroCHL:
		push	hl
		push	bc
		xor	a
zeroCHL1:
		ld	(hl), a
		inc	hl
		dec	c
		jp	nz, zeroCHL1
		pop	bc
		pop	hl
		ret
; End of function zeroCHL
; =============== S U B	R O U T	I N E =======================================
; Copy C bytes from (DE) to (HL)
CopyCDEHL:
		push	hl
		push	de
		push	bc
		push	af
		ex	de, hl
		ld	b, 0
		ldir
		pop	af
		pop	bc
		pop	de
		pop	hl
		ret
; End of function CopyCDEHL
; =============== S U B	R O U T	I N E =======================================
sub_908D:
		push	hl
		ld	b, 0Eh
loc_9090:
		ld	a, (hl)
		or	a
		jr	nz, loc_909E
		inc	hl
		djnz	loc_9090
		ld	bc, 0
		pop	hl
		jp	loc_917E
loc_909E:
		ld	a, b
		add	a, a
		ld	b, a
		ld	a, (hl)
		and	11110000b
		jr	nz, loc_90A7
		dec	b
loc_90A7:
		ld	a, (DollarJ)
		or	a
		jr	z, loc_90CE
		ld	a, (byte_04EE)
		cp	b
		jr	c, loc_90CE
		pop	hl
		push	hl
		push	bc
		ld	c, a
		ld	a, 1Ch
		sub	c
		rra
		push	af
		ld	c, a
		ld	b, 0
		add	hl, bc
		pop	af
		pop	bc
		ld	a, (byte_04EE)
		ld	b, a
		ld	d, 0
		jr	c, loc_90D6
		ld	d, 1
		jr	loc_90E3
loc_90CE:
		ld	a, (hl)
		and	11110000b
		ld	a, b
		ld	d, 0
		jr	nz, loc_90E3
loc_90D6:
		ld	a, c
		or	a
		ld	a, d
		push	bc
		jr	z, loc_90F9
		pop	bc
		dec	c
		ld	a, b
		dec	a
		ld	d, 1
		inc	hl
loc_90E3:
		push	bc
		sub	c
		ld	b, a
		jr	c, loc_9131
		jr	z, loc_9131
		ld	a, c
		or	a
		ld	a, d
		jr	z, loc_90F9
loc_90EF:
		xor	a
		dec	c
		jr	z, loc_90F9
		ld	a, 1
		inc	hl
		dec	c
		jr	nz, loc_90EF
loc_90F9:
		push	hl
		push	af
		or	a
		jr	z, loc_9102
		ld	d, 50h		; 'P'
		jr	loc_9104
loc_9102:
		ld	d, 5
loc_9104:
		ld	a, (hl)
		add	a, d
		daa
		ld	(hl), a
		jr	nc, loc_9113
loc_910A:
		dec	hl
		ld	a, (hl)
		adc	a, 0
		daa
		ld	(hl), a
		jp	c, loc_910A
loc_9113:
		pop	af
		pop	hl
		or	a
		jr	nz, loc_911E
		ld	a, (hl)
		and	11110000b
		ld	(hl), a
		inc	hl
		dec	b
loc_911E:
		srl	b
		jr	z, loc_9127
		xor	a
loc_9123:
		ld	(hl), a
		inc	hl
		djnz	loc_9123
loc_9127:
		pop	bc
		pop	hl
		ld	c, 0Eh
		call	ZTest		; Tests	a bcd number for zero
		ld	b, a
		jr	loc_9133
loc_9131:
		pop	bc
		pop	hl
loc_9133:
		ld	de, 0Eh
		add	hl, de
		dec	hl
		ld	d, 1
		ld	a, (byte_04EE)
		ld	c, a
		or	a
		jr	z, loc_9163
		ld	a, b
		or	a
		jr	nz, loc_9148
		ld	c, b
		jr	loc_9163
loc_9148:
		ld	a, (hl)
		and	00001111b
		jr	nz, loc_9163
		dec	b
		dec	c
		ld	d, 0
		jr	z, loc_9163
		ld	a, (hl)
		and	11110000b
		jr	nz, loc_9163
		dec	b
		dec	c
		ld	d, 1
		jr	z, loc_9162
		dec	hl
		jp	loc_9148
loc_9162:
		dec	hl
loc_9163:
		ld	a, b
		sub	c
		jr	nc, loc_9168
		xor	a
loc_9168:
		ld	b, a
		ld	a, c
		add	a, b
		rra
		ld	e, 1
		jr	nc, loc_9171
		dec	e
loc_9171:
		push	de
		cpl
		ld	e, a
		ld	d, 255
		inc	de
		add	hl, de
		pop	de
		ld	a, e
		and	d
		jr	z, loc_917E
		inc	hl
loc_917E:
		ld	a, e
		xor	d
		ret
; End of function sub_908D
; =============== S U B	R O U T	I N E =======================================
; Push BCD into	the stack
BCDPush:
		push	bc
		ld	e, a
		ld	a, c
		or	b
		jr	nz, BCDPush1
		ld	a, 30h		; '0'
		call	SPush
		ld	d, 1
		jr	BCDPush9
BCDPush1:
		ld	d, 0
		ld	a, (Signal1)
		or	a
		jr	z, BCDPush2
		ld	a, Minus
		call	SPush
		inc	d
BCDPush2:				; See if a $J
		ld	a, (DollarJ)
		or	a
		jr	z, BCDPush3
		ld	a, b
		or	a
		jr	nz, BCDPush4
		ld	a, 30h		; '0'
		call	SPush
		inc	d
		jr	BCDPush8
BCDPush3:
		ld	a, b
		or	a
		jr	z, BCDPush8
BCDPush4:
		ld	a, e
		or	a
		jr	nz, BCDPush6
BCDPush5:
		ld	a, (hl)
		and	11110000b
		rra
		rra
		rra
		rra
		or	30h		; '0'
		inc	d
		call	SPush
		dec	b
		jr	z, BCDPush7
BCDPush6:
		ld	a, (hl)
		and	00001111b
		or	30h		; '0'
		inc	d
		call	SPush
		inc	hl
		djnz	BCDPush5
		ld	e, 0
		jr	BCDPush8
BCDPush7:
		ld	e, 1
BCDPush8:
		ld	a, c
		or	a
		jr	z, BCDPush9
		ld	a, Point
		call	SPush
		inc	d
		ld	b, c
		ld	c, 0
		jr	BCDPush3
BCDPush9:
		pop	bc
		ld	a, (DollarJ)
		or	a
		jr	z, BCDPush11
		ld	a, (I6)
		sub	c
		ld	b, a
		jr	z, BCDPush11
		ld	a, c
		or	a
		jr	nz, BCDPush10
		ld	a, Point
		call	SPush
		inc	d
BCDPush10:				; '0'
		ld	a, 30h
		call	SPush
		inc	d
		djnz	BCDPush10
BCDPush11:
		ld	a, d
		call	SPush
		ld	a, 3
		call	SPush
		ret
; End of function BCDPush
; =============== S U B	R O U T	I N E =======================================
SPush:
		ld	(ix+0),	a
		inc	ix
		ret
; End of function SPush
; =============== S U B	R O U T	I N E =======================================
; Outputs a CrLf
putCrLf:
		ld	a, 0Dh
		call	putChar		; Outputs the character	on A to	the console
		ld	a, 0Ah
		call	putChar		; Outputs the character	on A to	the console
		ret
; End of function putCrLf
; =============== S U B	R O U T	I N E =======================================
; Outputs a string which size is pointed by HL
putStrSz:
		ld	a, (hl)
		or	a
		ret	z
		ld	c, a
		inc	hl
putStrSz1:
		ld	a, (hl)
		call	putChar		; Outputs the character	on A to	the console
		inc	hl
		dec	c
		jr	nz, putStrSz1
		ret
; End of function putStrSz
; =============== S U B	R O U T	I N E =======================================
; Places an asterisk under the error position
putAsterisk:
		ld	hl, (pStkPos)
		ld	de, (pStkStart)
		or	a
		sbc	hl, de
		ret	c
		ld	a, h
		or	a
		ret	nz
		ld	b, l
		ld	l, e
		ld	h, d
		ld	c, 0
putAsterisk1:
		ld	a, (hl)
		cp	0Dh		; Look for CR
		jr	z, putAsterisk2
		inc	hl
		inc	c
		jr	putAsterisk1
putAsterisk2:
		ld	a, c
		cp	71
		jr	c, putAsterisk6
		ld	a, b
		cp	36
		jr	c, putAsterisk5
		ld	a, c
		sub	b
		cp	36
		jr	c, putAsterisk3
		ld	a, b
		sub	36
		ld	b, 36
		jr	putAsterisk4
putAsterisk3:
		ld	b, a
		ld	a, 70
		sub	b
		ld	b, a
		ld	a, c
		sub	70
putAsterisk4:
		add	a, e
		ld	e, a
		ld	a, d
		adc	a, 0
		ld	d, a
putAsterisk5:
		ld	c, 70
putAsterisk6:				; Outputs a CrLf
		call	putCrLf
putAsterisk7:				; Check	the original char
		ld	a, (de)
		cp	9		; Was it TAB?
		jr	nz, putAsterisk8
		ld	a, Space
putAsterisk8:				; Outputs the character	on A to	the console
		call	putChar
		inc	de
		dec	c
		jr	nz, putAsterisk7
		call	putCrLf		; Outputs a CrLf
		ld	a, b
		or	a
		jr	z, putAsteriskE
putAsterisk9:
		ld	a, Space
		call	putChar		; Outputs the character	on A to	the console
		dec	b
		jr	nz, putAsterisk9
putAsteriskE:
		ld	a, Asterisk
		call	putChar		; Outputs the character	on A to	the console
		call	putCrLf		; Outputs a CrLf
		ret
; End of function putAsterisk
; =============== S U B	R O U T	I N E =======================================
sub_929E:
		ld	hl, byte_A668
		call	putStrSz	; Outputs a string which size is pointed by HL
		ld	hl, ibcdUnk07
		ld	c, 5
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jr	z, loc_92C2
		ld	a, Plus
		call	putChar		; Outputs the character	on A to	the console
		call	CharToStr	; Convert char (0-255) to string
		ld	hl, byte_A65F
		call	sub_97A2
		ld	hl, byte_A65F
		call	putStrSz	; Outputs a string which size is pointed by HL
loc_92C2:
		ld	a, Carat
		call	putChar		; Outputs the character	on A to	the console
		ld	hl, (pRtnName)
		call	putStrSz	; Outputs a string which size is pointed by HL
		call	putCrLf		; Outputs a CrLf
		ret
; End of function sub_929E
; =============== S U B	R O U T	I N E =======================================
putBackSP:
		ld	a, 8		; BS
		call	putChar		; Outputs the character	on A to	the console
		ld	a, Space	; Space
		call	putChar		; Outputs the character	on A to	the console
		ld	a, 8		; BS
		call	putChar		; Outputs the character	on A to	the console
		ret
; End of function putBackSP
; =============== S U B	R O U T	I N E =======================================
sub_92E1:
		ld	a, 1
		ld	(Result), a
		ld	de, 0
		ex	de, hl
		ld	b, 5
loc_92EC:
		ld	a, (de)
		ld	c, 1
		and	11110000b
		rrca
		rrca
		rrca
		rrca
loc_92F5:
		push	bc
		push	hl
		add	hl, hl
		jr	c, loc_931B
		add	hl, hl
		jr	c, loc_931B
		pop	bc
		add	hl, bc
		jr	c, loc_931B
		add	hl, hl
		jr	c, loc_931B
		add	a, l
		ld	l, a
		ld	a, 0
		adc	a, h
		ld	h, a
		pop	bc
		ld	a, c
		or	a
		jr	z, loc_9316
		ld	a, (de)
		and	00001111b
		ld	c, 0
		jr	loc_92F5
loc_9316:
		inc	de
		dec	b
		jr	nz, loc_92EC
		ret
loc_931B:
		ld	a, 0
		ld	(Result), a
		ret
; End of function sub_92E1
; =============== S U B	R O U T	I N E =======================================
sub_9321:
		ld	hl, (pIndex)
		call	sub_942A
		ld	b, 0
		ld	a, c
		call	sub_934F
		ld	a, d
		call	sub_934B
		ld	a, d
		call	sub_934F
		ld	a, e
		call	sub_934B
		ld	a, e
		and	00001111b
		call	sub_9355
		ld	(ix+0),	b
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ret
; End of function sub_9321
; =============== S U B	R O U T	I N E =======================================
sub_934B:
		rrca
		rrca
		rrca
		rrca
; End of function sub_934B
; =============== S U B	R O U T	I N E =======================================
sub_934F:
		and	00001111b
		ld	c, a
		or	b
		ret	z
		ld	a, c
; End of function sub_934F
; =============== S U B	R O U T	I N E =======================================
sub_9355:
		or	30h		; '0'
		call	SPush
		inc	b
		ret
; End of function sub_9355
; =============== S U B	R O U T	I N E =======================================
sub_935C:
		ld	a, (ix+254)
		ld	c, a
		cpl
		ld	e, a
		ld	d, 255
		dec	de
		add	ix, de
		push	ix
		pop	hl
		ld	de, lbcdTemp1
		ld	b, 0Eh
		call	BCDPack
		ld	(Signal1), a
		ld	a, (Count)
		ld	(byte_04EE), a
		ld	b, a
		ex	de, hl
		ld	c, 0Eh
		call	ZTest		; Tests	a bcd number for zero
		sub	b
		jr	nc, loc_9386
		xor	a
loc_9386:
		ld	d, a
		ld	a, (I6)
		cp	b
		jr	c, loc_938E
		ld	a, b
loc_938E:
		add	a, d
		cp	9
		jr	c, loc_9395
		ld	a, 9
loc_9395:
		ld	c, a
		call	sub_908D
		call	BCDPush		; Push BCD into	the stack
		ret
; End of function sub_935C
; =============== S U B	R O U T	I N E =======================================
sub_939D:
		ld	hl, lbcdTemp1
		ld	de, lbcdRandom
		ld	c, 14		; Number of bytes to copy
		call	CopyCDEHL	; Copy C bytes from (DE) to (HL)
		ld	hl, lbcdTemp2
		ld	de, lbcdRandomL
		call	CopyCDEHL	; Copy C bytes from (DE) to (HL)
		ld	de, lbcdTemp1
		call	MbcdDEHL	; Multiplies two C bytes long BCD pointed by DE	and HL
					; result goes in MResult
		ex	de, hl
		ld	c, 9
		call	zeroCHL		; Fills	C bytes	pointed	by HL with 0x00
		ld	hl,  lbcdRandom+8
		ld	de, byte_9F0F
		ld	c, 6
		call	CopyCDEHL	; Copy C bytes from (DE) to (HL)
		ld	hl,  lbcdTemp1+9
		ld	de, ibcdTemp0
		ld	c, 5
		call	CopyCDEHL	; Copy C bytes from (DE) to (HL)
		ld	hl, lbcdTemp2
		ld	de, lbcdRandom
		ld	c, 14
		call	CopyCDEHL	; Copy C bytes from (DE) to (HL)
		ld	de, lbcdTemp1
		call	MbcdDEHL	; Multiplies two C bytes long BCD pointed by DE	and HL
					; result goes in MResult
		ld	hl, ibcdResult	; Multiplication result
		call	ZTest		; Tests	a bcd number for zero
		ld	b, a
		ld	a, 1Ch
		sub	b
		rra
		push	af
		ld	e, a
		ld	d, 0
		add	hl, de
		ld	a, b
		sub	12
		jr	nc, loc_93FA
		xor	a
loc_93FA:
		ld	b, a
		ld	c, 0
		pop	af
		ld	a, 0
		jr	nc, loc_9403
		inc	a
loc_9403:				; Push BCD into	the stack
		call	BCDPush
		ret
; End of function sub_939D
; =============== S U B	R O U T	I N E =======================================
sub_9407:
		ld	de, ibcdTemp0
		ld	hl, ibcdV8000
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		ld	hl, ibcdTemp0
		ld	c, 5
loc_9415:				; Decrements by	1 the C	bytes long BCD pointed by (HL)
		call	DbcdHL
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jr	nz, loc_9415
		ld	hl, HangTime
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jr	nz, sub_9407
		ret
; End of function sub_9407
; =============== S U B	R O U T	I N E =======================================
; Returns nothing as this is CP/M
GetCurTime:
		ret
; End of function GetCurTime
; =============== S U B	R O U T	I N E =======================================
sub_942A:
		ld	de, 0
		ld	c, d
		ld	b, 10h
loc_9430:
		sla	l
		rl	h
		ld	a, e
		adc	a, e
		daa
		ld	e, a
		ld	a, d
		adc	a, d
		daa
		ld	d, a
		ld	a, c
		adc	a, c
		daa
		ld	c, a
		djnz	loc_9430
		ret
; End of function sub_942A
; =============== S U B	R O U T	I N E =======================================
; Terminate execution
GameOver:
		jp	BOOT
; End of function GameOver
; =============== S U B	R O U T	I N E =======================================
sub_9446:
		ld	a, (byte_04FD)
		or	a
		jr	z, loc_9455
		ld	de, ibcdTemp0
		ld	hl, ibcdV2700
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
loc_9455:
		call	sub_945E
		ld	(tmpChar), a
		jp	loc_94C3
; End of function sub_9446
; =============== S U B	R O U T	I N E =======================================
sub_945E:
		push	bc
		push	de
		push	hl
loc_9461:				; Check	reader device availability
		call	InPort6
		jr	z, loc_946F
		in	a, (4)
		and	01111111b
		sub	l
		pop	hl
loc_946C:
		pop	de
		pop	bc
		ret
loc_946F:				; GetChar if A!=0x00 (BIOS call)
		call	BGetChar2
		ld	a, (byte_04FD)
		or	a
		jr	z, loc_9461
		ld	hl, ibcdTemp0
		ld	c, 5
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jr	nz, loc_9461
		ld	de, ibcdTemp0
		ld	hl, ibcdV2700
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		ld	hl, HangTime
		ld	c, 5
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jr	nz, loc_9461
		xor	a
		ld	(IfSW),	a
		pop	hl
		ld	(hl), 0Dh
		inc	hl
		ld	a, 0Ah
		jr	loc_946C
; End of function sub_945E
; =============== S U B	R O U T	I N E =======================================
sub_94A7:
		ld	a, (byte_04FD)
		or	a
		jr	z, loc_94B6
		ld	hl, ibcdV2700
		ld	de, ibcdTemp0
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
loc_94B6:
		ld	hl, UBuffer1
		ld	c, 0
loc_94BB:
		call	sub_945E
		cp	0Ah
		jr	nz, loc_94D3
		ld	(hl), a
loc_94C3:
		xor	a
		ld	(Wait),	a
		ld	(Time),	a
		ld	(byte_04FD), a
		ld	a, c
		dec	a
		ld	(CmdLineSz), a
		ret
loc_94D3:
		inc	c
		ld	(hl), a
		ld	a, 255
		cp	c
		jr	z, loc_94C3
		ld	a, (byte_0545)
		cp	c
		jr	z, loc_94C3
		inc	hl
		jr	loc_94BB
; End of function sub_94A7
; =============== S U B	R O U T	I N E =======================================
; Writes a character to	the AUX	device
AuxOut:
		ld	a, (tmpChar)
		ld	e, a
		ld	c, 4		; Auxiliary (Punch) output
		call	BDOScall	; Make a call to the CP/M BDOS
		ret
; End of function AuxOut
; =============== S U B	R O U T	I N E =======================================
; Check	reader device availability
InPort6:
		in	a, (6)
		and	00000001b
		ret
; End of function InPort6
s0x15:		db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (todo) Check	this
; =============== S U B	R O U T	I N E =======================================
; Check	for room on the	syntax stack
SSChk:
		exx
		push	ix
		pop	de
		ld	hl, (pSynStack)
		or	a
		dec	hl
		sbc	hl, de
		jp	nc, Error01	; Stack	overflow
		ld	hl, 30
		add	hl, de
		jp	c, Error01	; Stack	overflow
		sbc	hl, sp
		jp	p, Error01	; Stack	overflow
		exx
		ret
; End of function SSChk
; =============== S U B	R O U T	I N E =======================================
BIOScall:
		push	ix
		call	BIOSjmp
		pop	ix
		ret
; End of function BIOScall
; =============== S U B	R O U T	I N E =======================================
BIOSjmp:
		ld	e, l
		ld	d, 0
		ld	hl, (BOOT+1)	; Loads	BIOS jump point
		add	hl, de		; Offsets with DE (was 0L)
		jp	(hl)		; Jumps	to CP/M	BIOS
; End of function BIOSjmp
; =============== S U B	R O U T	I N E =======================================
; Make a call to the CP/M BDOS
BDOScall:
		push	ix
		call	BDOS
		pop	ix
		ret
; End of function BDOScall
; =============== S U B	R O U T	I N E =======================================
sub_9535:
		push	bc
		push	af
		ld	bc, 4
		add	hl, bc
		call	sub_954B
		ld	(hl), a
		dec	hl
		ld	(hl), c
		ld	b, 3
		xor	a
loc_9544:
		dec	hl
		ld	(hl), a
		djnz	loc_9544
		pop	af
		pop	bc
		ret
; End of function sub_9535
; =============== S U B	R O U T	I N E =======================================
sub_954B:
		ld	c, a
		ld	b, 8
		xor	a
loc_954F:
		rl	c
		adc	a, a
		daa
		djnz	loc_954F
		rl	c
		ret
; End of function sub_954B
; =============== S U B	R O U T	I N E =======================================
sub_9558:
		ld	b, (hl)
		inc	hl
		ld	a, (de)
		ld	c, a
		inc	de
		call	SCmpB		; Compares two strings pointed by (DE) and (HL)
		ld	a, 1
		jr	z, loc_9567
		jr	nc, locret_9568
		inc	a
loc_9567:
		inc	a
locret_9568:
		ret
; End of function sub_9558
; =============== S U B	R O U T	I N E =======================================
IntToStr:
		push	de
		push	bc
		push	af
		call	sub_954B
		ld	d, a
		ld	a, c
		or	a
		ld	c, 30h		; '0'
		call	nz, IntToStr2
		ld	a, d
		and	11110000b
		or	b
		rrca
		rrca
		rrca
		rrca
		call	nz, IntToStr2
		ld	a, d
		and	00001111b
		call	IntToStr2
		ld	(ix+0),	b
		inc	ix
		ld	(ix+0),	3
		inc	ix
		pop	af
		pop	bc
		pop	de
		ret
; End of function IntToStr
; =============== S U B	R O U T	I N E =======================================
IntToStr2:
		or	c
		ld	(ix+0),	a
		inc	ix
		inc	b
		ret
; End of function IntToStr2
; =============== S U B	R O U T	I N E =======================================
; Fills	A bytes	pointed	by (hl)	with B
FillHLB:
		or	a
FillHLB1:
		ret	z
		ld	(hl), b
		inc	hl
		dec	a
		jr	FillHLB1
; End of function FillHLB
; =============== S U B	R O U T	I N E =======================================
sub_95A6:
		ld	c, a
		ld	a, 1
		ld	(Result), a
		ld	a, c
		or	a
		jr	z, locret_95D4
		ld	a, b
		or	b
		jr	z, loc_95DD
		push	bc
		ld	a, c
		cp	1
		jp	z, loc_95E2
loc_95BB:
		ld	a, b
		sub	c
		jr	c, loc_95DC
		push	hl
		push	de
		push	bc
loc_95C2:
		ld	a, (de)
		cp	(hl)
		jr	nz, loc_95D5
		inc	hl
		inc	de
		dec	b
		dec	c
		jr	nz, loc_95C2
		ld	a, b
		pop	bc
		pop	de
		pop	bc
loc_95D0:
		pop	bc
		cpl
		add	a, b
		inc	a
locret_95D4:
		ret
loc_95D5:
		pop	bc
		dec	b
		pop	de
		pop	hl
		inc	hl
		jr	loc_95BB
loc_95DC:
		pop	bc
loc_95DD:
		xor	a
		ld	(Result), a
		ret
loc_95E2:
		ld	a, (de)
		ld	c, a
loc_95E4:
		ld	a, (hl)
		cp	c
		jr	z, loc_95EE
		inc	hl
		dec	b
		jr	nz, loc_95E4
		jr	loc_95DC
loc_95EE:
		inc	hl
		dec	b
		ld	a, b
		jr	loc_95D0
; End of function sub_95A6
; =============== S U B	R O U T	I N E =======================================
; Integer to char (0-255)
IntToChar:
		push	hl
		push	de
		push	bc
		ld	a, 0
		ld	(Result), a
		ld	de, ibcdV255
		ld	bc, INTLN*257
		call	SCmp		; Compares two strings
		jr	c, IntToCharEnd
		ld	bc, 3
		add	hl, bc
		ld	a, (hl)
		dec	a
		ld	a, 0
		jp	m, IntToChar2
		jr	z, IntToChar1
		ld	a, 100
IntToChar1:
		add	a, 100
IntToChar2:
		ld	b, a
		inc	hl
		ld	a, (hl)
		and	11110000b
		rrca
		ld	c, a
		rrca
		rrca
		add	a, c
		ld	c, a
		ld	a, (hl)
		and	00001111b
		add	a, c
		add	a, b
		ld	hl, Result
		ld	(hl), 1
IntToCharEnd:
		pop	bc
		pop	de
		pop	hl
		ret
; End of function IntToChar
; =============== S U B	R O U T	I N E =======================================
; Convert char (0-255) to string
CharToStr:
		push	hl
		push	de
		push	bc
		ld	b, 5
		xor	a
		ld	(Signal1), a
		ld	a, (hl)
		and	11110000b
		jr	z, loc_9648
		ld	a, 1
		ld	(Signal1), a
		ld	a, (hl)
		and	00001111b
		jr	loc_964A
loc_9648:
		ld	a, (hl)
		or	a
loc_964A:
		jr	nz, loc_9654
		inc	hl
		djnz	loc_9648
		ld	bc, 0
		jr	loc_9662
loc_9654:
		ld	a, b
		add	a, a
		ld	b, a
		ld	c, 0
		ld	a, (hl)
		and	11110000b
		ld	a, 0
		jr	nz, loc_9662
		inc	a
		dec	b
loc_9662:				; Push BCD into	the stack
		call	BCDPush
		pop	bc
		pop	de
		pop	hl
		ret
; End of function CharToStr
; =============== S U B	R O U T	I N E =======================================
JDEN:
		ld	c, 3
JDEN1:
		ld	a, (de)
		cp	(hl)
		ret	nz
		inc	hl
		inc	de
		dec	c
		jp	nz, JDEN1
		ret
; End of function JDEN
; =============== S U B	R O U T	I N E =======================================
; (todo) This originally was JPEN compare pointers
sub_9675:
		ld	a, l
		sub	e
		ld	l, a
		ld	a, h
		sbc	a, d
		or	l
		ret
; End of function sub_9675
; =============== S U B	R O U T	I N E =======================================
sub_967C:
		ld	c, (hl)
		ld	a, (de)
		cp	c
		ret	nz
		inc	hl
		inc	de
; End of function sub_967C
; =============== S U B	R O U T	I N E =======================================
; Compare C bytes long strings pointed by (DE) and (HL)
JSE:
		ld	a, c
		or	a
		ret	z
JSE1:
		ld	a, (de)
		cp	(hl)
		ret	nz
		inc	hl
		inc	de
		dec	c
		jp	nz, JSE1
		ret
; End of function JSE
; =============== S U B	R O U T	I N E =======================================
sub_968F:
		push	bc
		push	hl
		add	hl, bc
		inc	hl
		inc	hl
		ld	(hl), e
		inc	hl
		ld	(hl), d
		dec	hl
		dec	hl
		dec	hl
		ex	de, hl
		add	hl, bc
		ld	a, (hl)
		ld	c, a
		ld	(de), a
		inc	hl
		inc	de
		ld	a, (hl)
		ld	b, a
		ld	(de), a
		pop	de
		ld	(hl), d
		dec	hl
		ld	(hl), e
		ld	h, b
		ld	l, c
		pop	bc
		add	hl, bc
		inc	hl
		inc	hl
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ret
; End of function sub_968F
; =============== S U B	R O U T	I N E =======================================
; Write	a character to the printer device
PrtOut:
		ld	e, a
		ld	c, 5		; Printer output
		call	BDOScall	; Make a call to the CP/M BDOS
		ret
; End of function PrtOut
; =============== S U B	R O U T	I N E =======================================
sub_96B9:
		inc	hl
		inc	hl
		ld	c, (hl)
		inc	c
		inc	a
		jr	loc_96C3
; End of function sub_96B9
; =============== S U B	R O U T	I N E =======================================
sub_96C0:
		inc	hl
		inc	hl
		ld	c, (hl)
loc_96C3:
		inc	hl
		ld	b, a
loc_96C5:
		ld	a, c
		or	b
		jr	z, loc_9704
		ld	a, c
		or	a
		jr	z, loc_9703
		ld	a, b
		or	a
		jr	z, loc_9705
		push	bc
		ld	a, (de)
		ld	b, a
		ld	c, (hl)
		push	hl
		inc	hl
		inc	de
loc_96D8:
		ld	a, c
		or	a
		jr	nz, loc_96E1
		or	b
		jr	z, loc_96EF
		jr	loc_96FD
loc_96E1:
		ld	a, b
		or	a
		jr	z, loc_96FD
		ld	a, (de)
		cp	(hl)
		jr	nz, loc_96F5
		inc	hl
		inc	de
		dec	b
		dec	c
		jr	loc_96D8
loc_96EF:
		pop	bc
		pop	bc
		dec	b
		dec	c
		jr	loc_96C5
loc_96F5:
		pop	hl
		pop	bc
		ld	a, 0
		jr	c, loc_9705
		jr	loc_9703
loc_96FD:
		pop	hl
		pop	bc
		ld	a, 0
		jr	z, loc_9705
loc_9703:
		inc	a
loc_9704:
		inc	a
loc_9705:
		inc	a
		ld	(Case),	a
		ld	a, b
		ret
; End of function sub_96C0
; =============== S U B	R O U T	I N E =======================================
; Copy A bytes from (DE)->(HL) up
CopyUp:
		or	a
		ret	z
		ld	c, a
		ld	b, 0
		ldir
		ret
; End of function CopyUp
; =============== S U B	R O U T	I N E =======================================
; Copy A bytes from (DE)-(HL) down
CopyDn:
		or	a
		ret	z
		ld	c, a
		ld	b, 0
		lddr
		ret
; End of function CopyDn
; =============== S U B	R O U T	I N E =======================================
sub_971B:
		ld	a, b
		or	c
		ret	z
		ldir
		ret
; End of function sub_971B
; =============== S U B	R O U T	I N E =======================================
sub_9721:
		or	a
		sbc	hl, de
		push	hl
		ld	l, c
		ld	h, b
		pop	bc
		ret	c
		ret	z
		ex	de, hl
		ldir
		ex	de, hl
		ret
; End of function sub_9721
; =============== S U B	R O U T	I N E =======================================
sub_972F:
		push	hl
		or	a
		sbc	hl, bc
		ld	c, l
		ld	b, h
		pop	hl
		ret	c
		ret	z
		lddr
		ret
; End of function sub_972F
; =============== S U B	R O U T	I N E =======================================
; Output 0x00 terminated string	pointed	by HL
putStr:
		ld	a, (hl)
		or	a
		ret	z
		call	putChar		; Outputs the character	on A to	the console
		inc	hl
		jr	putStr		; Output 0x00 terminated string	pointed	by HL
; End of function putStr
; =============== S U B	R O U T	I N E =======================================
; Converts a number to a string	ToS
NumToStr:
		dec	hl
		ld	a, (hl)
		ld	(Signal1), a
		dec	hl
		ld	c, (hl)
		dec	hl
		ld	b, (hl)
		ld	a, c
		add	a, b
		rra
		push	af
		ld	e, a
		ld	a, 0Eh
		sub	e
		add	a, 3
		ld	e, a
		ld	d, 0
		add	hl, de
		pop	af
		ld	a, 0
		jr	nc, NumToStr1
		dec	hl
		inc	a
NumToStr1:				; Push BCD into	the stack
		call	BCDPush
		ret
; End of function NumToStr
; =============== S U B	R O U T	I N E =======================================
sub_9766:
		ld	bc, 3
		jr	sub_9775
; End of function sub_9766
; =============== S U B	R O U T	I N E =======================================
; (todo) Check ... no references to here
sub_976B:
		ld	bc, 4
		jr	sub_9775
		ld	bc, 5
		jr	sub_9775
; End of function sub_976B
; =============== S U B	R O U T	I N E =======================================
sub_9775:
		ex	de, hl
		push	ix
		pop	hl
		or	a
		sbc	hl, bc
		push	hl
		pop	ix
		ldir
		ret
; End of function sub_9775
; =============== S U B	R O U T	I N E =======================================
sub_9782:
		or	a
		ret	z
		ld	c, a
		ld	b, 0
		jr	sub_9775
; End of function sub_9782
; =============== S U B	R O U T	I N E =======================================
sub_9789:
		dec	ix
		ld	h, (ix+0)
		dec	ix
		ld	l, (ix+0)
		ret
; End of function sub_9789
; =============== S U B	R O U T	I N E =======================================
; (todo) Check ... no references to here
sub_9794:
		dec	ix
		ld	a, (ix+255)
		ld	(hl), a
		inc	hl
		ld	a, (ix+0)
		ld	(hl), a
		dec	ix
		ret
; End of function sub_9794
; =============== S U B	R O U T	I N E =======================================
sub_97A2:
		dec	ix
		dec	ix
		ld	a, (ix+0)
		ld	(hl), a
		inc	hl
		jp	sub_9782
; End of function sub_97A2
; =============== S U B	R O U T	I N E =======================================
sub_97AE:
		ld	a, c
		or	b
		ret	z
		jr	sub_97FB
; End of function sub_97AE
; =============== S U B	R O U T	I N E =======================================
sub_97B3:
		or	a
		ret	z
		ld	c, a
		ld	b, 0
		jr	sub_97FB
; End of function sub_97B3
; =============== S U B	R O U T	I N E =======================================
sub_97BA:
		ld	e, (hl)		; (todo) Check this
		inc	hl
		ld	d, (hl)
		ex	de, hl
; End of function sub_97BA
; =============== S U B	R O U T	I N E =======================================
sub_97BE:
		ld	(ix+0),	l
		inc	ix
		ld	(ix+0),	h
		inc	ix
		push	ix
		pop	hl
		ld	de, 1Eh
		add	hl, de
		sbc	hl, sp
		jp	p, Error01	; Stack	overflow
		ret
; End of function sub_97BE
; =============== S U B	R O U T	I N E =======================================
sub_97D5:
		ld	a, (hl)
		or	a
		jr	z, loc_97E0
		ld	c, a
		ld	b, 0
		inc	hl
		call	sub_97FB
loc_97E0:
		ld	(ix+0),	a
		inc	ix
		ld	(ix+0),	3
		inc	ix
		ret
; End of function sub_97D5
; =============== S U B	R O U T	I N E =======================================
sub_97EC:
		ld	bc, 3
		jr	sub_97FB
; End of function sub_97EC
; =============== S U B	R O U T	I N E =======================================
sub_97F1:
		ld	bc, 4		; (todo) Check this
		jr	sub_97FB
		ld	bc, 5
		jr	sub_97FB
; End of function sub_97F1
; =============== S U B	R O U T	I N E =======================================
sub_97FB:
		push	ix
		pop	de
		add	ix, bc
		ldir
		push	hl
		ld	hl, 1Eh
		add	hl, de
		sbc	hl, sp
		jp	p, Error01	; Stack	overflow
		pop	hl
		ret
; End of function sub_97FB
; =============== S U B	R O U T	I N E =======================================
sub_980E:
		ex	de, hl
; End of function sub_980E
; =============== S U B	R O U T	I N E =======================================
sub_980F:
		ld	a, (hl)
		or	a
		jr	z, loc_9817
		inc	a
		jp	nz, Error39	; Disk I/O error
loc_9817:
		ld	bc, 3
		ldir
		ret
; End of function sub_980F
; =============== S U B	R O U T	I N E =======================================
; Copy 5 bytes from (DE) to (HL) ; SetI
Copy5DEHL:
		ex	de, hl
; End of function Copy5DEHL
; =============== S U B	R O U T	I N E =======================================
; Copy 5 bytes from (HL) to (DE)
Copy5HLDE:
		ld	bc, 5
		ldir
		ret
; End of function Copy5HLDE
; =============== S U B	R O U T	I N E =======================================
; Copy (HL) bytes from (HL) to (DE)
CopyHLDE:
		ld	c, (hl)
		ld	b, 0
		inc	bc
		ldir
		ret
; End of function CopyHLDE
; =============== S U B	R O U T	I N E =======================================
; Shifts the stack towards its base
ShiftDn:
		push	af
		push	de
		push	bc
		push	hl
		or	a
		jr	z, ShiftDnEnd
		ld	c, a
		ld	b, 0
		ldir
ShiftDnEnd:
		push	de
		pop	ix
		pop	hl
		pop	bc
		pop	de
		pop	af
		ret
; End of function ShiftDn
; =============== S U B	R O U T	I N E =======================================
; Shifts the stack towards the top
ShiftUp:
		push	af
		push	bc
		ld	b, 0
		ld	c, a
		add	hl, bc
		dec	hl		; HL to	first one to get
		ex	de, hl
		add	hl, bc
		push	hl
		pop	ix
		call	SSChk		; Check	for room on the	syntax stack
		ex	de, hl
		or	a		; See if no bytes to move
		jr	z, ShiftUpEnd
		dec	de
		lddr
		inc	de
ShiftUpEnd:
		pop	bc
		pop	af
		inc	hl
		ret
; End of function ShiftUp
; =============== S U B	R O U T	I N E =======================================
; Converts a string on ToS to char (0-255)
StrToChar:
		push	hl
		push	de
		push	bc
		ld	a, 0
		ld	(Result), a
		ld	a, (ix+254)
		dec	a
		cp	3
		jr	nc, StrToChar5
		add	a, a
		ld	c, a
		ld	b, 0
		ld	hl, StrToChar1
		add	hl, bc
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	de, 0F00h
		jp	(hl)
StrToChar1:
		dw StrToChar4
		dw StrToChar3
		dw StrToChar2
StrToChar2:
		ld	a, (ix+251)
		and	d
		cp	3
		jr	nc, StrToChar5
		ld	b, a
		add	a, a
		add	a, a
		add	a, b
		add	a, a
		ld	e, a
StrToChar3:
		ld	a, (ix+252)
		and	d
		add	a, e
		ld	b, a
		add	a, a
		add	a, a
		add	a, b
		add	a, a
		jr	c, StrToChar5
		ld	e, a
StrToChar4:
		ld	a, (ix+253)
		and	d
		add	a, e
		jr	c, StrToChar5
		ld	e, a
		ld	a, 1
		ld	(Result), a
StrToChar5:
		ld	a, (ix+254)
		cpl
		ld	c, a
		ld	b, 255
		dec	bc
		add	ix, bc
		ld	a, e
		pop	bc
		pop	de
		pop	hl
		ret
; End of function StrToChar
; =============== S U B	R O U T	I N E =======================================
; Converts string on ToS to integer
StrToInt:
		push	af
		push	de
		push	bc
		push	hl
		push	ix
		pop	hl
		dec	hl		; HL to	3
		dec	hl		; HL to	Length
		ld	a, (hl)
		ld	c, a
		cpl			; For 2's complement of length
		ld	e, a
		ld	d, 255
		inc	de
		add	hl, de
		push	hl		; HL->ToS pointer
		pop	ix
		pop	de		; Get integer start
		ld	b, INTLN
		call	BCDPack
		or	a		; Check	sign
		jr	z, StrToIntEnd
		ld	a, (de)
		or	11110000b	; Set sign
		ld	(de), a
StrToIntEnd:
		ex	de, hl
		pop	bc
		pop	de
		pop	af
		ret
; End of function StrToInt
; =============== S U B	R O U T	I N E =======================================
sub_98DD:
		push	hl
		push	de
		push	bc
		push	af
		ex	de, hl
		push	ix
		pop	hl
		dec	hl
		dec	hl
		ld	a, (hl)
		push	af
		cpl
		ld	c, a
		ld	b, 255
		inc	bc
		add	hl, bc
		push	hl
		pop	ix
		pop	af
		ld	c, a
		ld	b, 0Eh
		call	BCDPack
		dec	de
		ld	(de), a
		dec	de
		ld	a, (Count)
		ld	(de), a
		dec	de
		ld	b, a
		or	a
		jr	z, loc_9906
		dec	c
loc_9906:
		ld	a, c
		sub	b
		ld	(de), a
		pop	af
		pop	bc
		pop	de
		pop	hl
		ret
; End of function sub_98DD
; =============== S U B	R O U T	I N E =======================================
sub_990E:
		ld	a, (byte_04FD)
		or	a
		jr	z, loc_991D
		ld	de, ibcdTemp0
		ld	hl, ibcdV3060
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
loc_991D:
		call	sub_9926
		ld	(tmpChar), a
		jp	loc_99B8
; End of function sub_990E
; =============== S U B	R O U T	I N E =======================================
sub_9926:
		push	hl
		push	de
		push	bc
loc_9929:				; Direct console I/O
		ld	c, 6
		ld	e, 255		; ReadChar
		call	BDOScall	; Make a call to the CP/M BDOS
		or	a		; Anything returned?
		jr	z, loc_9967	; No.
		cp	7		; Is it	Ctrl-G?
		jr	nz, loc_9963	; No.
loc_9937:				; Direct console I/O
		ld	c, 6
		ld	e, 255		; ReadChar
		call	BDOScall	; Make a call to the CP/M BDOS
		or	a		; Anything returned?
		jr	z, loc_994B	; No.
		cp	7		; Is it	Ctrl-G?
		jr	z, loc_9929	; Yes.
		ld	c, 4		; Auxiliary (punch) out
		ld	e, a
		call	BDOScall	; Make a call to the CP/M BDOS
loc_994B:				; Check	reader device availability
		call	InPort6
		jr	z, loc_9937
		ld	c, 3		; Auxiliary (reader) input
		call	BDOScall	; Make a call to the CP/M BDOS
		or	a
		jr	z, loc_9937
		and	01111111b	; Strip	out high bit
		ld	e, a		; WriteChar
		ld	c, 6		; Direct console I/O
		call	BDOScall	; Make a call to the CP/M BDOS
		jp	loc_9937
loc_9963:
		pop	bc
		pop	de
		pop	hl
		ret
loc_9967:
		ld	a, (byte_04FD)
		or	a
		jr	z, loc_9929
		ld	hl, ibcdTemp0
		ld	c, 5
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jr	nz, loc_9929
		ld	hl, ibcdV3060
		ld	de, ibcdTemp0
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
		ld	hl, HangTime
		ld	c, 5
		call	DbcdHL		; Decrements by	1 the C	bytes long BCD pointed by (HL)
		call	lZtest		; Tests	a C bytes long BCD pointed by (HL) for zero
		jr	nz, loc_9929
		xor	a
		ld	(IfSW),	a
		ld	a, 0Dh
		jr	loc_9963
; End of function sub_9926
; =============== S U B	R O U T	I N E =======================================
sub_9998:
		ld	a, (byte_04FD)
		or	a
		jr	z, loc_99A7
		ld	de, ibcdTemp0
		ld	hl, ibcdV3060
		call	Copy5HLDE	; Copy 5 bytes from (HL) to (DE)
loc_99A7:
		ld	a, (byte_A6A2)
		ld	d, a
loc_99AB:
		ld	hl, CmdLine
		ld	c, 0
loc_99B0:
		call	sub_9926
		cp	0Dh
		jr	nz, loc_99C7
		ld	(hl), a
loc_99B8:
		xor	a
		ld	(Wait),	a
		ld	(Time),	a
		ld	(byte_04FD), a
		ld	a, c
		ld	(CmdLineSz), a
		ret
loc_99C7:
		cp	127
		jp	z, loc_99E5
		cp	Space
		jr	nc, loc_9A1B
		cp	9
		jr	z, loc_9A1B
		cp	3
		jp	z, PrintErr18
		cp	1
		jr	nz, loc_99E1
		ld	d, 0
		jr	loc_99B0
loc_99E1:
		cp	8
		jr	nz, loc_99F5
loc_99E5:
		ld	a, c
		or	a
		jr	z, loc_99B0
		ld	a, d
		or	a
		jr	z, loc_99F0
		call	putBackSP
loc_99F0:
		dec	hl
		dec	c
		jp	loc_99B0
loc_99F5:
		cp	18h
		jr	nz, loc_9A0B
		ld	a, c
		or	a
		jp	z, loc_99B0
loc_99FE:
		ld	a, d
		or	a
		jr	z, loc_9A05
		call	putBackSP
loc_9A05:
		dec	c
		jr	nz, loc_99FE
		jp	loc_99AB
loc_9A0B:
		cp	10h
		jp	nz, loc_99B0
		ld	a, (PrintTgl)
		xor	00000001b
		ld	(PrintTgl), a
		jp	loc_99B0
loc_9A1B:
		ld	e, a
		cp	9
		jr	nz, loc_9A22
		ld	a, Space
loc_9A22:
		and	d
		call	nz, putChar	; Outputs the character	on A to	the console
		inc	c
		ld	(hl), e
		ld	a, 255
		cp	c
		jp	z, loc_99B8
		ld	a, (byte_0545)
		cp	c
		jp	z, loc_99B8
		inc	hl
		jp	loc_99B0
; End of function sub_9998
; =============== S U B	R O U T	I N E =======================================
; Outputs the character	on A to	the console
putChar:
		push	hl
		push	de
		push	bc
		push	af
		call	BGetChar	; GetChar (BIOS	call)
		ld	a, (StopTgl)
		or	a
		jr	z, putChar1
		ld	l, 6		; Console input
		call	BIOScall
		xor	a
		ld	(StopTgl), a
putChar1:
		pop	af
		push	af
		ld	l, 9		; Console output
		ld	c, a
		call	BIOScall
		pop	af
		ld	c, a
		ld	a, (PrintTgl)
		or	a
		jr	z, putChar2
		ld	l, 0Ch		; List output
		call	BIOScall
putChar2:
		pop	bc
		pop	de
		pop	hl
		ret
; End of function putChar
; =============== S U B	R O U T	I N E =======================================
sub_9A68:
		push	bc
		add	hl, bc
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		pop	hl
		push	hl
		add	hl, de
		ld	(hl), c
		inc	hl
		ld	(hl), b
		pop	hl
		add	hl, bc
		inc	hl
		inc	hl
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ret
; End of function sub_9A68
; =============== S U B	R O U T	I N E =======================================
sub_9A7F:
		ld	hl, (word_0513)
		add	hl, hl
		push	hl
		add	hl, hl
		pop	de
		add	hl, de
		ld	(GlobalsFCB+33), hl
		ld	hl,  GlobalsFCB+35
		ld	(hl), 0
		ret
; End of function sub_9A7F
; =============== S U B	R O U T	I N E =======================================
; Read a global	buffer (768B) in (DE)
GlobalRead:
		ld	l, 20		; Read sequential
		jp	GlobalRW
; End of function GlobalRead
; =============== S U B	R O U T	I N E =======================================
; Write	a global buffer	(768B) in (DE)
GlobalWrite:
		ld	l, 21		; Write	sequential
GlobalRW:
		ld	a, (GlobalsDR)
		inc	a
		ld	(GlobalsFCB), a
		ld	b, 6		; Read 6x128 regs (1 Global block=768)
GlobalRW1:				; Set DMA address
		ld	c, 26
		push	de
		push	bc
		push	hl
		call	BDOScall	; Make a call to the CP/M BDOS
		pop	hl
		pop	bc
		push	bc
		push	hl
		ld	a, 6
		cp	b
		ld	a, l
		jp	nz, GlobalRW2
		add	a, 13		; Reset	disk system
GlobalRW2:				; BDOS function	in A
		ld	c, a
		ld	de, GlobalsFCB
		call	BDOScall	; Make a call to the CP/M BDOS
		or	a		; Is there an error?
		jp	nz, Error39	; Disk I/O error
		pop	hl
		pop	bc
		pop	de
		push	hl
		ld	a, 6
		cp	b
		jp	nz, GlobalRW3
		ld	hl,  GlobalsFCB+32
		inc	(hl)
GlobalRW3:
		ld	hl, 128
		add	hl, de
		ex	de, hl
		pop	hl
		dec	b
		jp	nz, GlobalRW1
		ret
; End of function GlobalWrite
; =============== S U B	R O U T	I N E =======================================
sub_9AD9:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_9A7F
		ld	hl, (pGLBBuffer3)
		ex	de, hl
		call	GlobalRead	; Read a global	buffer (768B) in (DE)
		ret
; End of function sub_9AD9
; =============== S U B	R O U T	I N E =======================================
sub_9AE7:
		call	SSChk		; Check	for room on the	syntax stack
		call	sub_9A7F
		ld	hl, (word_A62E)
		ld	de, 8
		add	hl, de
		ex	de, hl
		call	GlobalWrite	; Write	a global buffer	(768B) in (DE)
		ret
; End of function sub_9AE7
; =============== S U B	R O U T	I N E =======================================
sub_9AF9:
		ld	hl, 0
		ld	a, 1
		ld	(byte_04F8), a
		ld	de, 0
loc_9B04:
		ld	(word_0513), hl
		xor	a
		ld	(byte_0512), a
		push	hl
		push	de
		call	sub_7995
		ld	bc, 768		; (todo) Check this
		ld	hl, (pGLBBuffer3)
		ld	a, (byte_04F8)
		or	a
		jp	z, loc_9B3C
		ld	bc, 761
		ld	de, 5
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	a, d
		or	e
		jp	z, Error50	; Running out of global	space
		dec	de
		ld	(hl), d
		dec	hl
		ld	(hl), e
		inc	hl
		inc	hl
		ex	de, hl
		ld	(word_A648), hl
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
		ex	de, hl
loc_9B3C:
		pop	de
loc_9B3D:
		ld	a, (hl)
		or	a
		jp	nz, loc_9B53
		inc	hl
		inc	de
		dec	bc
		ld	a, c
		or	b
		jp	nz, loc_9B3D
		xor	a
		ld	(byte_04F8), a
		pop	hl
		inc	hl
		jp	loc_9B04
loc_9B53:
		pop	bc
		ld	bc, 0
		ex	de, hl
loc_9B58:
		rlca
		jp	c, loc_9B60
		inc	bc
		jp	loc_9B58
loc_9B60:
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, bc
		ld	(word_0513), hl
		xor	a
		ld	(byte_0512), a
		scf
		ex	de, hl
		inc	c
loc_9B6E:
		rra
		dec	c
		jp	nz, loc_9B6E
		cpl
		and	(hl)
		ld	(hl), a
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
		ret
; End of function sub_9AF9
; =============== S U B	R O U T	I N E =======================================
sub_9B7C:
		ld	hl, (word_0513)
		push	hl
		ld	bc, 38h		; '8'
		add	hl, bc
		ld	a, l
		and	00000111b
		ld	e, a
		ld	d, 3		; (todo)
loc_9B8A:
		xor	a
		rr	h
		rr	l
		dec	d
		jr	nz, loc_9B8A
		or	a
		ld	bc, 768
loc_9B96:
		sbc	hl, bc
		jr	c, loc_9B9D
		inc	d
		jr	loc_9B96
loc_9B9D:
		add	hl, bc
		push	hl
		push	de
		ld	l, d
		ld	h, 0
		ld	(word_0513), hl
		call	sub_7995
		pop	de
		pop	hl
		xor	a
		scf
		inc	e
loc_9BAE:
		rra
		dec	e
		jp	nz, loc_9BAE
		ex	de, hl
		ld	hl, (pGLBBuffer3)
		add	hl, de
		or	(hl)
		ld	(hl), a
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
		pop	hl
		push	hl
		ld	(word_0513), hl
		call	sub_7995
		ld	hl, (pGLBBuffer1)
		ld	(word_A62E), hl
		ld	hl, (pGLbBuffer2)
		ld	(hl), 0
		call	sub_5A67
		call	sub_629D
		ld	hl, (word_A648)
		inc	hl
		ld	(word_A648), hl
		ld	hl, 0
		ld	(word_0513), hl
		call	sub_7995
		ld	hl, (word_A648)
		ex	de, hl
		ld	hl, (pGLBBuffer3)
		ld	bc, 5
		add	hl, bc
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (pGLbBuffer2)
		ld	(hl), 1
		pop	hl
		ld	(word_0513), hl
		ret
; End of function sub_9B7C
; =============== S U B	R O U T	I N E =======================================
sub_9C00:
		ld	a, 1
		ld	(Result), a
		ld	c, 26		; Set DMA address
		ld	de, Page0Buf
		call	BDOScall	; Make a call to the CP/M BDOS
		ld	a, (byte_A6A5)
		or	a
		jr	z, loc_9C3F
		xor	a
		ld	(byte_A6A5), a
		ld	hl, (word_027C)
		ld	de, 8
		sbc	hl, de
		ld	a, (I1)
		cp	3
		jr	z, loc_9C29
		dec	hl
		dec	hl
		dec	hl
loc_9C29:
		dec	hl
		ld	bc, Space
		ld	de, Backslash
		ldir
		ld	de, Backslash
		ld	a, (RoutinesDR)
		inc	a
		ld	(de), a
		ld	c, 17		; Search for first
		call	BDOScall	; Make a call to the CP/M BDOS
loc_9C3F:
		ld	de, (Ptr1)
		ld	a, (RoutinesDR)
		inc	a
		ld	(de), a
		ld	c, 17		; Search for first
		ld	a, (IT)
		add	a, c
		ld	c, a
		call	BDOScall	; Make a call to the CP/M BDOS
		cp	255
		jp	nz, loc_9C5D
		ld	a, 0
		ld	(Result), a
		ret
loc_9C5D:
		and	00000011b
		ld	hl, 128
		add	a, a
		add	a, a
		add	a, a
		add	a, a
		add	a, a
		ld	e, a
		ld	d, 0
		add	hl, de
		inc	hl
		ld	(Ptr), hl
		ret
; End of function sub_9C00
; =============== S U B	R O U T	I N E =======================================
; Find first file
FFirst:
		call	SSChk		; Check	for room on the	syntax stack
		call	PrepFCB		; Prepares FCB
		ld	c, 26		; Set DMA address
		ld	de, Page0BUF
		call	BDOScall	; Make a call to the CP/M BDOS
		ld	hl, (pFCBAddr)
		ld	a, (Drive)
		inc	a
		ld	(hl), a
		ex	de, hl
		ld	c, 17		; Search for first
		call	BDOScall	; Make a call to the CP/M BDOS
		inc	a
		jp	nz, FFirst1
		ld	(Result), a
		ret
FFirst1:
		ld	a, 1
		ld	(Result), a
		ret
; End of function FFirst
; =============== S U B	R O U T	I N E =======================================
; Reset	disk system
DiskReset:
		ld	c, 13		; Reset	disk system
		call	BDOScall	; Make a call to the CP/M BDOS
		ret
; End of function DiskReset
; =============== S U B	R O U T	I N E =======================================
; Compute file size
FSize:
		ld	de, (pFCBAddr)
		ld	a, (Drive)
		inc	a
		ld	(de), a
		ld	c, 23h		; Compute file size
		call	BDOScall	; Make a call to the CP/M BDOS
		ld	hl, (pFCBAddr)
		ld	bc, 33
		add	hl, bc
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	(pIndex), hl
		call	sub_9321
		ld	hl, ibcdTemp0
		call	StrToInt	; Converts string on ToS to integer
		ret
; End of function FSize
; =============== S U B	R O U T	I N E =======================================
; Read random file record in DE
FRndRead:
		ld	hl, ibcdTemp0
		call	sub_92E1
		ld	a, (Result)
		cp	0
		jp	z, Error48	; Invalid parameter
		ex	de, hl
		ld	hl, (pFCBAddr)
		ld	bc, 33
		add	hl, bc
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	hl, (pFRWBuffer)
		ex	de, hl
		ld	c, 1Ah		; Set DMA address
		call	BDOScall	; Make a call to the CP/M BDOS
		ld	de, (pFCBAddr)
		ld	a, (Drive)
		inc	a
		ld	(de), a
		ld	c, 33		; Random read
		call	BDOScall	; Make a call to the CP/M BDOS
		or	a
		ret	z
		jp	Error48		; Invalid parameter
; End of function FRndRead
; =============== S U B	R O U T	I N E =======================================
; Create file
FCreate:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (pFCBAddr)
		ld	a, (Drive)
		inc	a
		ld	(hl), a
		ex	de, hl
		ld	c, 22		; Make file
		call	BDOScall	; Make a call to the CP/M BDOS
		inc	a
		ret	nz
		jp	Error09		; Directory full
; End of function FCreate
; =============== S U B	R O U T	I N E =======================================
; Sequential write file
FSeqWrite:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (pFRWBuffer)
		ex	de, hl
		ld	c, 26		; Set DMA address
		call	BDOScall	; Make a call to the CP/M BDOS
		ld	hl, (pFCBAddr)
		ld	a, (Drive)
		inc	a
		ld	(hl), a
		ld	b, 5
FSeqWrite2:
		ld	hl, (pFCBAddr)
		ex	de, hl
		ld	c, 21		; Write	next record
		push	bc
		call	BDOScall	; Make a call to the CP/M BDOS
		or	a
		pop	bc
		ret	z
		dec	b
		jp	z, Error39	; Disk I/O error
		ld	l, 21		; Home disk
		call	BIOScall
		jp	FSeqWrite2
; End of function FSeqWrite
; =============== S U B	R O U T	I N E =======================================
Null3:
		ret			; (todo) Check this
; End of function Null3
; =============== S U B	R O U T	I N E =======================================
; Close	globals	file
GFClose:
		ld	hl, GlobalsFCB
		ld	(pFCBAddr), hl
		ld	a, (GlobalsDR)
		ld	(Drive), a
FClose:					; Close	file
		call	SSChk
		ld	hl, (pFCBAddr)
		ld	a, (Drive)
		inc	a
		ld	(hl), a
		ex	de, hl
		ld	c, 16		; Close	file
		call	BDOScall	; Make a call to the CP/M BDOS
		ret
; End of function GFClose
; =============== S U B	R O U T	I N E =======================================
; Open globals file
GFOpen:
		call	SSChk		; Check	for room on the	syntax stack
		call	PrepFCB		; Prepares FCB
FOpen:					; Open file
		ld	hl, (pFCBAddr)
		ld	a, (Drive)
		inc	a
		ld	(hl), a
		ex	de, hl
		ld	c, 15		; Open file
		call	BDOScall	; Make a call to the CP/M BDOS
		inc	a
		ret	nz
		ld	a, (FCBType)	; 0:Global, 1:Routine, 2:File
		or	a
		jp	nz, Error38	; Routine not on disk
		jp	Error37		; Global file not on disk
; End of function GFOpen
; =============== S U B	R O U T	I N E =======================================
sub_9D7F:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (pFRWBuffer)
		ex	de, hl
		ld	c, 26		; Set DMA address
		call	BDOScall	; Make a call to the CP/M BDOS
		ld	hl, (word_02D4)
		ld	a, 00010000b
		and	(hl)
		jr	z, loc_9D9F
		ld	a, (hl)
		and	11101111b
		ld	(hl), a
		ld	hl, (pFCBAddr)
		ld	bc, Space
		add	hl, bc
		inc	(hl)
loc_9D9F:
		ld	hl, (pFCBAddr)
		ld	a, (Drive)
		inc	a
		ld	(hl), a
		ex	de, hl
		ld	c, 20		; Read next record
		call	BDOScall	; Make a call to the CP/M BDOS
		cp	2
		jp	nc, Error39	; Disk I/O error
		ld	hl, (pFRWBuffer)
		ld	de, 0
		ld	c, 128
		ld	b, a
loc_9DBB:
		ld	a, (hl)
		cp	1Ah
		jr	z, loc_9DD2
		inc	hl
		inc	de
		dec	c
		jr	nz, loc_9DBB
		ld	a, b
		or	a
		jp	z, loc_9DD2
		ld	de, 0
		ld	hl, (pFRWBuffer)
		ld	(hl), 1Ah
loc_9DD2:
		ex	de, hl
		ld	(word_A622), hl
		ret
; End of function sub_9D7F
; =============== S U B	R O U T	I N E =======================================
; Delete file
FDelete:
		call	SSChk		; Check	for room on the	syntax stack
		ld	hl, (pFCBAddr)
		ld	a, (Drive)
		inc	a
		ld	(hl), a
		ld	hl, (pFCBAddr)
		ld	a, (Drive)
		inc	a
		ld	(hl), a
		ex	de, hl
		ld	c, 19		; Delete file
		call	BDOScall	; Make a call to the CP/M BDOS
		ret
; End of function FDelete
; =============== S U B	R O U T	I N E =======================================
; Prepares FCB
PrepFCB:
		ld	a, (FCBType)	; 0:Global, 1:Routine, 2:File
		or	a
		jp	nz, PrepFCB1
		ld	hl, GlobalsFCB
		ld	(pFCBAddr), hl
		ld	hl,  GlobalsFCB+12
		ld	(hl), 0
		ret
PrepFCB1:
		cp	1
		jp	nz, PrepFCB2
		ld	hl,  DFCB0+1
		jp	PrepFCB3
PrepFCB2:
		ld	hl, (pDevice)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		inc	hl
PrepFCB3:
		ld	(pFCBAddr), hl
		push	ix
		pop	hl
		dec	hl
		dec	hl
		ld	c, (hl)
		ld	a, c
		cpl
		ld	e, a
		ld	d, 255
		inc	de
		add	hl, de
		push	hl
		pop	ix
		ld	hl, (pFCBAddr)
		ex	de, hl
		push	ix
		pop	hl
		xor	a
		ld	(de), a
		push	de
		inc	de
		ld	b, 0Bh
		ld	a, Space
PrepFCB4:
		ld	(de), a
		inc	de
		dec	b
		jp	nz, PrepFCB4
		or	b
		jp	z, PrepFCB5
		ld	b, 15h
		xor	a
		jp	PrepFCB4
PrepFCB5:
		pop	de
		ld	b, 8
PrepFCB6:
		inc	de
		ld	a, (hl)
		cp	61h		; 'a'
		jr	c, PrepFCB7
		cp	7Bh		; '{'
		jr	nc, PrepFCB7
		and	11011111b
PrepFCB7:
		cp	Point
		jp	z, PrepFCB8
		inc	hl
		ld	(de), a
		dec	c
		jp	z, PrepFCBE
		dec	b
		jp	nz, PrepFCB6
		ld	a, (hl)
		cp	Point
		jp	nz, PrepFCBE
		inc	de
PrepFCB8:
		inc	hl
		dec	c
		push	bc
		ld	c, b
		ld	b, 0
		ex	de, hl
		add	hl, bc
		ex	de, hl
		dec	de
		pop	bc
		ld	b, 3
		jp	PrepFCB6
PrepFCBE:				; 0:Global, 1:Routine, 2:File
		ld	a, (FCBType)
		cp	2		; Is it	normal file?
		ret	z
		ld	c, b		; If not adds .MMP extension
		ld	b, 0
		ex	de, hl
		add	hl, bc
		ld	(hl), 4Dh	; 'M'
		inc	hl
		ld	(hl), 4Dh	; 'M'
		inc	hl
		ld	(hl), 50h	; 'P'
		ret
; End of function PrepFCB
; =============== S U B	R O U T	I N E =======================================
Null4:
		ret			; (todo) Check this
; End of function Null4
; =============== S U B	R O U T	I N E =======================================
Null2:
		ret
; End of function Null2
;
;=====================	 DATA AREA 1   ======================================
;
Nil:		db 0FFh, 0FFh, 0FFh
GZero:		db 0, 0, 0
ibcdTemp0:	db 0, 0, 0, 0, 0
ibcdTemp1:	db 0, 0, 0, 0, 0
ibcdUnk02:	db 0, 0, 0, 0, 0
ibcdDay:	db 0, 0, 0, 0, 0
ibcdUnk03:	db 0, 0, 0, 0, 0
ibcd1:		db 0, 0, 0, 0, 0
ibcdUnk05:	db 0, 0, 0, 0, 0
ibcdV0:		db 0, 0, 0, 0, 0
ibcdV1:		db 0, 0, 0, 0, 1
ibcdV2:		db 0, 0, 0, 0, 2
ibcdV127:	db 0, 0, 0, 1, 27h
ibcdVmin1:	db 0F0h, 0, 0, 0, 1
ibcdV255:	db 0, 0, 0, 2, 55h
ibcdVmax:	db 9, 99h, 99h,	99h, 99h
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0
lbcdTemp1:	db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
lbcdTemp2:	db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
ibcdResult:	db 0, 0, 0, 0, 0	; Multiplication result
		db 0, 0, 0
byte_9F0F:	db 0, 0, 0, 0, 0, 0
byte_9F15:	db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
byte_9F23:	db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
byte_9F31:	db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0
FReal:		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0
lbcdRandom:	db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 1
lbcdRandomL:	db 0, 0, 0, 0, 0, 0, 0,	0, 23h,	45h, 67h, 89h, 87h, 63h
TPP:		dw 0
Result:		db 0
Case:		db 0
bmActFlag:	db 0
Token:		db 0
pStkPos:	dw 0
Locks:		db 0
IndFL:		db 0
IndSW:		db 0
DoSW:		db 0
ForSW:		db 0
bmFlag:		db 0
Mode:		db 1
		db 0
pPlus1000:	dw 0
pSynStack:	dw 0
		db 0
		db 0
IODevice:	db 0
ibcdUnk08:	db 0, 0, 0, 0, 0
IfSW:		db 0
pCurRtnLine:	dw 0
pStartOfRtn:	dw 0
pLineBefore:	dw 0
pEndOfRtn:	dw 0
pRtnName:	dw 0
word_9F96:	dw 0
word_9F98:	dw 0
word_9F9A:	dw 0
pSymbolTbl:	dw 0
pEnd:		dw 0
bBDOSaddr:	dw 0
		dw 0FF01h
sBreak:		db 'B R E A K  ---  ',0
sRoutinesOn:	db 0Dh,'ROUTINES ON '
RDrLetter:	db 0
sGlobalsOn:	db 0Ch,'GLOBALS ON '
GDrLetter:	db 0
Minus1:		db 2,'-1'
byte_9FD3:	db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0
VarName:	db 0, 0, 0, 0, 0, 0, 0,	0, 0
word_A049:	dw 0
byte_A04B:	db 0
ArgPl:		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
DevTable:	db 1, 2, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0FFh
		dw 0
		dw CmdLine
		dw 0
		db 0
		db 0, 1, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 84h
		dw 0
		dw PBuff
		dw 0
		db 0
		db 0, 2, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 80h
		dw DFCB1
		dw DBuf1
		dw 0
		db 0
		db 0, 2, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 80h
		dw DFCB2
		dw DBuf2
		dw 0
		db 0
		db 0, 2, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 80h
		dw DFCB3
		dw DBuf3
		dw 0
		db 0
		db 0, 2, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0FFh
		dw 0
		dw UBuffer1
		dw 0
DFCB0:		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0
		db 0
DFCB1:		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0
		db 0
DFCB2:		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0
		db 0
DFCB3:		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0
		db 0
sErr1:		db 'ERR: '
sErr2:		db '  ',0Dh
sIndirection:	db 0Bh,'Indirection'
sXecute:	db 6,'Xecute'
mmpFCB:		db 0			; FCB for listing *.MMP	(view 3)
		db '????????MMP'
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0
fileFCB:	db 0			; FCB for listing *.* (view 4)
		db '???????????'
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0
dirFCB:		db 0
		db 'DIR     DIR'
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0
PBuff:		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0
DBuf1:		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
DBuf2:		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
DBuf3:		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
UBuffer1:	db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
UBuffer2:	db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0
SaveRtnBuf:	db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
byte_A581:	db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0
Wait:		db 0
Time:		db 0
HangTime:	db 0, 0, 0, 0, 0
ibcdV8000:	db 0, 0, 0, 80h, 0
ibcdV3060:	db 0, 0, 0, 30h, 60h
ibcdV2700:	db 0, 0, 0, 27h, 0
byte_A60B:	db 0
		db 0
byte_A60D:	db 0
		db 0
byte_A60F:	db 0
byte_A610:	db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
byte_A617:	db 0, 0, 0
byte_A61A:	db 0, 0, 0
ibcdUnk07:	db 0, 0, 0, 0, 0
word_A622:	dw 0
word_A624:	dw 0
word_A626:	dw 0
word_A628:	dw 0
word_A62A:	dw 0
word_A62C:	dw 0
word_A62E:	dw 0
word_A630:	dw 0
word_A632:	dw 0
word_A634:	dw 0
word_A636:	dw 0
word_A638:	dw 0
word_A63A:	dw 0
word_A63C:	dw 0
SymEnd:		dw 0
word_A640:	dw 0
word_A642:	dw 0
word_A644:	dw 0
		db 0
		db 0
word_A648:	dw 0
word_A64A:	dw 0
		db 0
		db 0
word_A64E:	dw 0
pStkStart:	dw 0
word_A652:	dw 0
word_A654:	dw 0
TRtnName:	db 0, 0, 0, 0, 0, 0, 0,	0, 0 ; Temp routine name storage
byte_A65F:	db 0, 0, 0, 0, 0, 0, 0,	0, 0
byte_A668:	db 0, 0, 0, 0, 0, 0, 0,	0, 0
byte_A671:	db 0, 0, 0, 0, 0, 0, 0,	0, 0
byte_A67A:	db 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0
sDev:		db 3,'DEV'
sColon:		db 3,' : '
byte_A691:	db 0
byte_A692:	db 0
byte_A693:	db 0
byte_A694:	db 0
byte_A695:	db 0
byte_A696:	db 0
byte_A697:	db 0
byte_A698:	db 0
byte_A699:	db 0
byte_A69A:	db 0
		db 0
byte_A69C:	db 0
byte_A69D:	db 0
byte_A69E:	db 0
byte_A69F:	db 0
bBreakVal:	db 1			; Value	passed to BREAK	command
byte_A6A1:	db 0
byte_A6A2:	db 0FFh
byte_A6A3:	db 0
byte_A6A4:	db 0
byte_A6A5:	db 0
; =============== S U B	R O U T	I N E =======================================
; Initializes random seed
RandomSeed:
		ld	hl, lbcdRandom
		ld	c, 14
		call	IbcdHL		; Increments by	1 the C	bytes long BCD pointed by (HL)
		ld	l, 3		; Console status
		call	BIOScall
		or	a
		jr	z, RandomSeed	; Initializes random seed
		ld	hl,  lbcdRandom+0Dh
		ld	a, (hl)
		and	11110000b
		or	00000001b
		ld	(hl), a
		ret
; End of function RandomSeed
; =============== S U B	R O U T	I N E =======================================
Init:
		ld	sp, bbcdMonth	; New stack is below bcdMonth
EnterDate:
		ld	de, sEnterDate
		ld	c, 9		; Output string
		call	BDOScall	; Make a call to the CP/M BDOS
		ld	de, iBufferSZ
		ld	c, 10		; Buffered console input
		call	BDOScall	; Make a call to the CP/M BDOS
		ld	hl, iBuffer
		ld	a, (hl)		; Reads	the number of chars typed
		or	a
		jp	z, EndInit	; No characters	typed
		cp	8
		jp	nz, EnterDate	; Different than 8
		inc	hl		; Point	to the fist char typed
		ld	de, 112h	; Month	valilation (1-12)
		call	ChkDate
		jp	nz, EnterDate
		ld	a, b
		ld	(bbcdMonth), a
		ld	a, c
		ld	(binMonth), a
		ld	de, 131h	; Day validation (1-31)
		call	ChkDate
		jp	nz, EnterDate
		ld	a, b
		ld	(ibcdDay+4), a
		ld	de, 8191h	; Year validation 81-91
		call	ChkDate
		jp	nz, EnterDate
		ld	a, b
		ld	(ibcdYear+4), a
		ld	a, c
		ld	(binYear), a
		ld	a, (binMonth)
		dec	a
		add	a, a
		ld	c, a
		ld	b, 0
		ld	hl, nDaysTableW
		add	hl, bc
		ld	de,  ibcdDay+3
		ex	de, hl
		ld	c, 2
		call	AbcdDEHL	; Adds two C bytes long	BCDs pointed by	(DE) and (HL)
					; result goes in the BCD pointed by (HL)
		ld	a, (binYear)
		cp	84		; 84 was a leap	year
		jp	z, EnterDate1
		cp	88		; 88 was a leap	year
		jp	nz, EnterDate2
EnterDate1:
		ld	a, (binMonth)
		cp	3
		jp	c, EnterDate2
		call	IbcdHL		; Increments by	1 the C	bytes long BCD pointed by (HL)
EnterDate2:
		ld	a, (ibcdYear+4)
		sub	81h
		ld	(ibcdYear+4), a
		ld	hl, ibcdYear
		ld	de, ibcdV365
		ld	c, 5
		call	MbcdDEHL	; Multiplies two C bytes long BCD pointed by DE	and HL
					; result goes in MResult
		ld	hl, ibcdDay
		ld	de, ibcdResult	; Multiplication result
		call	AbcdDEHL	; Adds two C bytes long	BCDs pointed by	(DE) and (HL)
					; result goes in the BCD pointed by (HL)
		ld	de, ibcdV51134
		call	AbcdDEHL	; Adds two C bytes long	BCDs pointed by	(DE) and (HL)
					; result goes in the BCD pointed by (HL)
		ld	a, (binYear)
		cp	85
		jp	c, EndInit
		cp	89
		jp	c, EnterDate3
		call	IbcdHL		; Increments by	1 the C	bytes long BCD pointed by (HL)
EnterDate3:				; Increments by	1 the C	bytes long BCD pointed by (HL)
		call	IbcdHL
EndInit:
		ld	de, sNewLinex3
		ld	c, 9		; Output string
		call	BDOScall	; Make a call to the CP/M BDOS
		jp	Start		; Startup initializations
; End of function Init
; =============== S U B	R O U T	I N E =======================================
ChkDate:
		ld	a, (hl)		; Gets the digit pointed by HL
		cp	30h		; '0'
		jp	c, ChkDate2
		cp	Colon
		jp	nc, ChkDate2
		and	00001111b	; Clears the high 4 bits
		ld	c, a		; Saves	A on C
		rla			; Slides the digit left	4 bits
		rla
		rla
		rla
		ld	b, a		; Keeps	the left 4 bits	in B
		ld	a, c		; Restores A from C
		add	a, a		; Multiplies by	10 ...
		add	a, a
		add	a, c
		add	a, a
		ld	c, a		; ... and saves	on C
		inc	hl		; Advance one digit
		ld	a, (hl)
		cp	30h		; '0'
		jp	c, ChkDate2
		cp	Colon
		jp	nc, ChkDate2
		and	00001111b
		push	af		; Saves	A on the stack
		or	b
		ld	b, a		; Saves	BCD version on B
		pop	af		; Restores A from the stack
		add	a, c
		ld	c, a		; Saves	binary version on C
		inc	hl		; Skips	the /
		inc	hl		; Points to the	next field
		ld	a, b
		cp	d		; Checks the BCD lower limit
		jp	c, ChkDate2
		cp	e		; Checks the BCD higher	limit
		jp	c, ChkDate1
		jp	nz, ChkDate2
ChkDate1:				; Theres no error A=0x00
		xor	a
		jp	ChkDate3
ChkDate2:				; There's error A=0x01
		ld	a, 1
ChkDate3:				; Updates the Zero flag
		or	a
		ret
; End of function ChkDate
;
;=====================	 DATA AREA 2   ======================================
;
sEnterDate:	db 0Dh,0Ah
		db 'Enter today',27h,'s date (mm/dd/yy): $'
sEnterTime:	db 0Dh,0Ah		; Not used in CP/M
		db 'Enter the current time (hh:mm): $'
sNewLinex3:	db 0Dh,	0Ah, 0Ah, 0Ah, 24h
ibcdYear:	db 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0
; ----
nDaysTableW:	db 0, 0
		db 0, 31h
		db 0, 59h
		db 0, 90h
		db 1, 20h
		db 1, 51h
		db 1, 81h
		db 2, 12h
		db 2, 43h
		db 2, 73h
		db 3, 4
		db 3, 34h
; ----
ibcdV60:	db 0, 0, 0, 0, 60h
ibcdV365:	db 0, 0, 0, 3, 65h
ibcdV51134:	db 0, 0, 5, 11h, 34h	; 51134	= 31/12/80
iBufferSZ:	db 20
iBuffer:	db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		db 0, 0, 0, 0, 0, 0, 0,	0, 0
bbcdMonth:	db 0
binMonth:	db 0
binYear:	db 0
sGreet:		db 'Z80 Mumps - Version 4.06',0Dh,0Ah
		db 'rebuilt in Feb/2014 by Marcelo Dantas',0Dh,0Ah
		db 'marcelo.f.dantas@gmail.com'
ifdef BINMODE
		db 0Dh,0Ah
		db '(binary file mode)',0Dh,0Ah 
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0
else
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
endif