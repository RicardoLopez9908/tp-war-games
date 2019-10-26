
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here  

call initJuego

ret




;PROC


proc initJuego 
    
    ;call PrintMap
    call establecerBase
    
        
    ret
    
endp
     
     
     

proc establecerBase
    
    mov dx, offset pedir_coordenadas_base 
    call print
    call ingresarCoordenadas
ret
         
endp
     
     

     
proc ingresarCoordenadas
    
    mov dx, offset pedir_coordenada_x
    call print    
    call input_coordenada
                  
    mov dx, offset pedir_coordenada_y
    call print    
    call input_coordenada                  
                  
    
ret        
    
    
endp         
     

proc print

    mov AH, 9
    int 21h
    
    ret
    
endp




proc input_coordenada
    
    CICLO:

    call input_teclado
    call solo_numeros
    
    cmp AL, '.'
    jne CICLO
ret         
endp

proc solo_numeros
    
    cmp AL, '0'
    jb SALIR
    
    cmp AL, '9'
    ja SALIR
    
    mov AH, 2  ; escribe un char en la salida standar
    mov DL, AL
    int 21h 
    
    
SALIR: 
    ret
endp    
     
proc input_teclado
    
    mov AH, 7 ;leer teclado
    int 21h
    
 ret 
endp
         
iniciar_juego db 'Iniciar juego$'
pedir_coordenadas_base db 'Ingrese la ubicacion de su base secreta$'
pedir_coordenada_x db '',10,13,'Ingrese coordenada x: $'
pedir_coordenada_y db '',10,13,'Ingrese coordenada y: $'

