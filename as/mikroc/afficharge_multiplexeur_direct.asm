
_init:

;afficharge_multiplexeur_direct.c,3 :: 		void init(){
;afficharge_multiplexeur_direct.c,4 :: 		TRISA=0;
	CLRF       TRISA+0
;afficharge_multiplexeur_direct.c,5 :: 		TRISb=0;
	CLRF       TRISB+0
;afficharge_multiplexeur_direct.c,6 :: 		}
L_end_init:
	RETURN
; end of _init

_deco:

;afficharge_multiplexeur_direct.c,7 :: 		void deco(){
;afficharge_multiplexeur_direct.c,8 :: 		mil=x/1000;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _mil+0
	MOVF       R0+1, 0
	MOVWF      _mil+1
;afficharge_multiplexeur_direct.c,9 :: 		cent=(x%1000)/100;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _cent+0
	MOVF       R0+1, 0
	MOVWF      _cent+1
;afficharge_multiplexeur_direct.c,10 :: 		dez=(x%100)/10;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _dez+0
	MOVF       R0+1, 0
	MOVWF      _dez+1
;afficharge_multiplexeur_direct.c,11 :: 		uni=x%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _uni+0
	MOVF       R0+1, 0
	MOVWF      _uni+1
;afficharge_multiplexeur_direct.c,12 :: 		}
L_end_deco:
	RETURN
; end of _deco

_aff:

;afficharge_multiplexeur_direct.c,13 :: 		aff() {
;afficharge_multiplexeur_direct.c,14 :: 		portb=list[mil] ;porta.ra0=1;delay_ms(5);porta.ra0=0;
	MOVF       _mil+0, 0
	ADDLW      _list+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	BSF        PORTA+0, 0
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_aff0:
	DECFSZ     R13+0, 1
	GOTO       L_aff0
	DECFSZ     R12+0, 1
	GOTO       L_aff0
	NOP
	NOP
	BCF        PORTA+0, 0
;afficharge_multiplexeur_direct.c,15 :: 		portb=list[cent];porta.ra1=1;delay_ms(5);porta.ra1=0;
	MOVF       _cent+0, 0
	ADDLW      _list+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	BSF        PORTA+0, 1
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_aff1:
	DECFSZ     R13+0, 1
	GOTO       L_aff1
	DECFSZ     R12+0, 1
	GOTO       L_aff1
	NOP
	NOP
	BCF        PORTA+0, 1
;afficharge_multiplexeur_direct.c,16 :: 		portb=list[dez] ;porta.ra2=1;delay_ms(5);porta.ra2=0;
	MOVF       _dez+0, 0
	ADDLW      _list+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	BSF        PORTA+0, 2
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_aff2:
	DECFSZ     R13+0, 1
	GOTO       L_aff2
	DECFSZ     R12+0, 1
	GOTO       L_aff2
	NOP
	NOP
	BCF        PORTA+0, 2
;afficharge_multiplexeur_direct.c,17 :: 		portb=list[uni] ;porta.ra3=1;delay_ms(5);porta.ra3=0;
	MOVF       _uni+0, 0
	ADDLW      _list+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	BSF        PORTA+0, 3
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_aff3:
	DECFSZ     R13+0, 1
	GOTO       L_aff3
	DECFSZ     R12+0, 1
	GOTO       L_aff3
	NOP
	NOP
	BCF        PORTA+0, 3
;afficharge_multiplexeur_direct.c,18 :: 		}
L_end_aff:
	RETURN
; end of _aff

_main:

;afficharge_multiplexeur_direct.c,19 :: 		void main() {
;afficharge_multiplexeur_direct.c,21 :: 		porta=0;
	CLRF       PORTA+0
;afficharge_multiplexeur_direct.c,22 :: 		portb=0;
	CLRF       PORTB+0
;afficharge_multiplexeur_direct.c,23 :: 		init();
	CALL       _init+0
;afficharge_multiplexeur_direct.c,24 :: 		for(x=0;x<=5959;x++){
	CLRF       _x+0
	CLRF       _x+1
L_main4:
	MOVLW      128
	XORLW      23
	MOVWF      R0+0
	MOVLW      128
	XORWF      _x+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVF       _x+0, 0
	SUBLW      71
L__main14:
	BTFSS      STATUS+0, 0
	GOTO       L_main5
;afficharge_multiplexeur_direct.c,25 :: 		deco();
	CALL       _deco+0
;afficharge_multiplexeur_direct.c,26 :: 		for(i=0;i<50;i++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main7:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      50
	SUBWF      main_i_L0+0, 0
L__main15:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;afficharge_multiplexeur_direct.c,27 :: 		aff();
	CALL       _aff+0
;afficharge_multiplexeur_direct.c,26 :: 		for(i=0;i<50;i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;afficharge_multiplexeur_direct.c,28 :: 		}
	GOTO       L_main7
L_main8:
;afficharge_multiplexeur_direct.c,24 :: 		for(x=0;x<=5959;x++){
	INCF       _x+0, 1
	BTFSC      STATUS+0, 2
	INCF       _x+1, 1
;afficharge_multiplexeur_direct.c,29 :: 		}
	GOTO       L_main4
L_main5:
;afficharge_multiplexeur_direct.c,30 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
