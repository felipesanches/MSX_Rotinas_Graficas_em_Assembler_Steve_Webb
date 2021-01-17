; MSX-BIOS calls:
READ_VRAM	EQU 0x004A
WRITE_VRAM	EQU 0x004D

; Entry-point:
ROT1		EQU 0xDAC0

; Params to routine #1:
Y1		EQU 0xF230 ; Rect top-left coords
X1		EQU 0xF231
Y2		EQU 0xF232 ; Rect bottom-right coords
X2		EQU 0xF233

; Local variables:
CHAR		EQU 0xF240 ; One char read from VRAM (to be moved somewhere else)

; System variables:
NAME_BASE	EQU 0xF922 ; Current pattern name table address.
SCREEN_MODE	EQU 0xFCAF ; Current video-screen mode.


ROT1:
	ld hl, 0x0000
	ld bc, 0x0020
	ld a, (SCREEN_MODE)
	dec a
	jp z, label_DAD0
	ld bc, 0x0028

label_DAD0:
	ld a, (X1)

label_DAD3:
	dec a
	jp z, label_DADB
	add hl, bc
	jp label_DAD3

label_DADB:
	ld de, 0x0000
	ld a, (Y1)
	dec a
	ld e, a
	add hl, de
	ld de, (NAME_BASE)
	add hl, de
	push hl
	pop de
	ld a, (X2)

label_DAEE:
	push af
	call READ_VRAM
	ld (0xF240), a
	ld a, (Y2)
	dec a

label_DAF9:
	push af
	add hl, bc
	call READ_VRAM
	sbc hl, bc
	call READ_VRAM
	add hl, bc
	pop af
	dec a
	jp nz, label_DAF9
	ld a, (CHAR)
	call WRITE_VRAM
	inc de
	push de
	pop hl
	pop af
	dec a
	jp nz, label_DAEE
	ret

label_DB18:
	db 0x01
