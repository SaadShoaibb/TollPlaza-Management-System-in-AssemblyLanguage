.model small
.stack 100h
.data 
menu0 db 'Project by Saad Shoaib$'
menu db 'Toll Plaza System$'
menu1 db 'Press 1 for Car Toll$'
menu2 db 'Press 2 for Bus Toll$'
menu3 db 'Press 3 for Truck Toll$'
menu4 db 'Press 4 to show Total Collection$'
menu5 db 'Press 5 to delete the records$'
menu6 db 'Press 6 to exit$'
msg1 db 'Thank you for using the Toll Plaza System.$'
msg2 db 'Invalid input. Please try again.$'
msg3 db 'Amount collected: $'
msg4 db 'Total number of cars: $'
msg5 db 'Total number of buses: $'
msg6 db 'Total number of trucks: $'
msg7 db 'Records deleted successfully$'
msg8 db 'Please Pay toll of Rs:50 $'
msg9 db 'Please Pay toll of Rs:100 $'
msg10 db 'Please Pay toll of Rs:150 $'
n_line DB 0AH,0DH,"$"
c dw 50
t dw 150
b dw 100
amount dw 0
carCount dw 0
busCount dw 0
truckCount dw 0
.code
printNumber proc
    mov bx, 10
    mov cx, 0
l1:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne l1
l2:
    pop dx
    add dl, 48
    mov ah, 2
    int 21h
    loop l2
    ret
printNumber endp
main proc
mov ax, @data
mov ds, ax

while_:
    ; Display menu
    mov dx, 10
    mov ah, 2
    int 21h
    mov dx, 13
    mov ah, 2
    int 21h
    mov dx, offset menu0
    mov ah, 9
    int 21h
    mov dx, 10
    mov ah, 2
    int 21h
    mov dx, 13
    mov ah, 2
    int 21h
    mov dx, offset menu
    mov ah, 9
    int 21h
    mov dx, 10
    mov ah, 2
    int 21h
    mov dx, 13
    mov ah, 2
    int 21h
    mov dx, offset menu1
    mov ah, 9
    int 21h
    mov dx, 10
    mov ah, 2
    int 21h
    mov dx, 13
    mov ah, 2
    int 21h
    mov dx, offset menu2
    mov ah, 9
    int 21h
    mov dx, 10
    mov ah, 2
    int 21h
    mov dx, 13
    mov ah, 2
    int 21h
    mov dx, offset menu3
    mov ah, 9
    int 21h
    mov dx, 10
    mov ah, 2
    int 21h
    mov dx, 13
    mov ah, 2
    int 21h
    mov dx, offset menu4
    mov ah, 9
    int 21h
    mov dx, 10
    mov ah, 2
    int 21h
    mov dx, 13
    mov ah, 2
    int 21h
    mov dx, offset menu5
    mov ah, 9
    int 21h
    mov dx, 10
    mov ah, 2
    int 21h
    mov dx, 13
    mov ah, 2
    int 21h
    mov dx, offset menu6
    mov ah, 9
    int 21h
    mov dx, 10
    mov ah, 2
    int 21h
    mov dx, 13
    mov ah, 2
    int 21h
    mov dx, offset n_line
    mov ah, 9
    int 21h

    ; Read user input
    mov ah, 1
    int 21h

    ; Handle user input
    cmp al, '1'
    je carToll
    cmp al, '2'
    je busToll
    cmp al, '3'
    je truckToll
    cmp al, '4'
    je showCollection
    cmp al, '5'
    je deleteRecords
    cmp al, '6'
    je end_

    mov dx, offset msg2
    mov ah, 9
    int 21h
    jmp while_

carToll:
    ; Car Toll Calculation
    mov dx, offset n_line
    mov ah, 9
    int 21h
    mov dx, offset msg8
    mov ah, 9
    int 21h
    mov dx, offset n_line
    mov ah, 9
    int 21h
    mov ax, c
    add amount, ax
    inc carCount
    jmp while_
busToll:
    ; Bus Toll Calculation
    mov dx, offset n_line
    mov ah, 9
    int 21h
    mov dx, offset msg9
    mov ah, 9
    int 21h
    mov dx, offset n_line
    mov ah, 9
    int 21h
    mov ax, b
    add amount, ax
    inc busCount
    jmp while_
truckToll:
    ; Truck Toll Calculation
    mov dx, offset n_line
    mov ah, 9
    int 21h
    mov dx, offset msg10
    mov ah, 9
    int 21h  
    mov dx, offset n_line
    mov ah, 9
    int 21h
    ; Truck Toll Calculation
    mov ax, t
    add amount, ax
    inc truckCount
    jmp while_
showCollection:
    ; Display total collection and vehicle counts
    mov dx, offset n_line
   mov ah, 9
    int 21h
    mov dx, offset msg3
    mov ah, 9
    int 21h
    mov ax, amount
    call printNumber
    mov dx, offset n_line
    mov ah, 9
    int 21h
    mov dx, offset msg4
    mov ah, 9
    int 21h
    mov ax, carCount
    call printNumber
    mov dx, offset n_line
    mov ah, 9
    int 21h
    mov dx, offset msg5
    mov ah, 9
    int 21h
    mov ax, busCount
    call printNumber
    mov dx, offset n_line
    mov ah, 9
    int 21h
    mov dx, offset msg6
    mov ah, 9
    int 21h
    mov ax, truckCount
    call printNumber
    mov dx, offset n_line
    mov ah, 9
    int 21h
    jmp while_
deleteRecords:
    ; Delete records
    mov dx, offset n_line
    mov ah, 9
    int 21h
    mov word ptr amount, 0
    mov word ptr carCount, 0
    mov word ptr busCount, 0
    mov word ptr truckCount, 0
    mov dx, offset msg7
    mov ah, 9
    int 21h
    mov dx, offset n_line
    mov ah, 9
    int 21h
    jmp while_
end_:
    mov dx, offset msg1
    mov ah, 9
    int 21h
    mov ax, 4C00h
    int 21h
main endp

end main
