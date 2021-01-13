DAC0: 21 00 00      ld hl, 0x0000
DAC3: 01 20 00      ld bc, 0x0020
DAC6: 3A AF FC      ld a, (0xFCAF)
DAC9: 3D            dec a
DACA: CA D0 DA      jp z, 0xDAD0
DACD: 01 28 00      ld bc, 0x0028
DAD0: 3A 31 f2      ld a, (0xF231) ; 
DAD3: 3D            dec a
DAD4: CA DB DA      jp z, 0xDADB
DAD7: 09            add hl, bc
DAD8: C3 D3 DA      jp 0xDAD3
DADB: 11 00 00      ld de, 0x0000
DADE: 3A 30 F2      ld a, (0xF230)
DAD1: 3D            dec a
DAD2: 5F            ld e, a
DAD3: 19            add hl, de
DAD4: ED 5B 22 F9   ld de, (0xF922)
DAD8: 19            add hl, de
DAD9: E5            push hl
DADA: D1            pop de
DADB: 3A 33 F2      ld a, (0xF233)
DADE: F5            push af
DADF: CD 4A 00      call 0x004A
DAE2: 32 40 F2      ld (0xF240), a
DAE5: 3A 32 F2      ld a, (0xF232) 
DAE8: 3D            dec a
DAE9: F5            push af
DAEA: 09            add hl, bc
DAEB: CD 4A 00      call 0x004A
DAEE: ED 42         sbc hl, bc
DAF0: CD 4D 00      call 0x004A
DAF3: 09            add hl, bc
DAF4: F1            pop af
DAF5: 3D            dec a
DAF6: c2 F9 DA      jp nz, 0xDAF9
DAF9: 3A 40 F2      ld (0xF240), a
DAFC: CD 4D 00      call 0x004D
DAFF: 13            inc de
DB00: D5            push de
DB01: E1            pop hl
DB02: F1            pop af
DB03: 3D            dec a
DB04: C2 EE DA      jp nz, 0xDAEE
DB07: C9            ret
DB08: 01


