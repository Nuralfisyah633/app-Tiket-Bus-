ORG 100h  ; Memulai program pada alamat 100h

; Menampilkan menu pemesanan tiket
MENU:
    MOV DX, OFFSET MENU_TEXT
    MOV AH, 09h
    INT 21h

; Input nama penumpang                                                       
    MOV DX, OFFSET NAME_PROMPT
    MOV AH, 09h
    INT 21h

    MOV AH, 0Ah ; Input string
    MOV DX, OFFSET NAME_BUFFER
    INT 21h

; Input tujuan
    MOV DX, OFFSET DEST_PROMPT
    MOV AH, 09h
    INT 21h

    MOV AH, 0Ah ; Input string
    MOV DX, OFFSET DEST_BUFFER
    INT 21h

; Input jumlah tiket
    MOV DX, OFFSET TICKETS_PROMPT
    MOV AH, 09h
    INT 21h

    MOV AH, 01h ; Input karakter jumlah tiket
    INT 21h
    SUB AL, '0' ; Mengonversi karakter ke angka
    MOV NUM_TICKETS, AL

; Menampilkan ringkasan
    MOV DX, OFFSET SUMMARY_TEXT
    MOV AH, 09h
    INT 21h

    MOV DX, OFFSET NAME_BUFFER+2 ; Menampilkan nama
    MOV AH, 09h
    INT 21h

    MOV DX, OFFSET DEST_TEXT
    MOV AH, 09h
    INT 21h

    MOV DX, OFFSET DEST_BUFFER+2 ; Menampilkan tujuan
    MOV AH, 09h
    INT 21h

    MOV DX, OFFSET TICKET_COUNT_TEXT
    MOV AH, 09h
    INT 21h

    MOV AL, NUM_TICKETS
    ADD AL, '0' ; Konversi angka ke karakter
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    MOV AH, 4Ch ; Keluar program
    INT 21h

MENU_TEXT DB 'Program Tiket Bus$'
NAME_PROMPT DB 0Dh, 0Ah, 'Masukkan Nama Penumpang: $'
NAME_BUFFER DB 21, 0, 21 DUP('$') ; Buffer untuk nama, max 20 karakter
DEST_PROMPT DB 0Dh, 0Ah, 'Masukkan Tujuan: $'
DEST_BUFFER DB 21, 0, 21 DUP('$') ; Buffer untuk tujuan, max 20 karakter
TICKETS_PROMPT DB 0Dh, 0Ah, 'Masukkan Jumlah Tiket: $'
SUMMARY_TEXT DB 0Dh, 0Ah, 'Ringkasan Pemesanan:', 0Dh, 0Ah, 'Nama: $'
DEST_TEXT DB 0Dh, 0Ah, 'Tujuan: $'
TICKET_COUNT_TEXT DB 0Dh, 0Ah, 'Jumlah Tiket: $'
NUM_TICKETS DB 0