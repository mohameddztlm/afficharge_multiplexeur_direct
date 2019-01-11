#line 1 "C:/Users/mohamed/Desktop/as/mikroc/afficharge_multiplexeur_direct.c"
char list[]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};
int mil,cent,dez,uni,x;
void init(){
TRISA=0;
TRISb=0;
}
void deco(){
 mil=x/1000;
 cent=(x%1000)/100;
 dez=(x%100)/10;
 uni=x%10;
}
aff() {
portb=list[mil] ;porta.ra0=1;delay_ms(5);porta.ra0=0;
portb=list[cent];porta.ra1=1;delay_ms(5);porta.ra1=0;
portb=list[dez] ;porta.ra2=1;delay_ms(5);porta.ra2=0;
portb=list[uni] ;porta.ra3=1;delay_ms(5);porta.ra3=0;
}
void main() {
int i;
porta=0;
portb=0;
 init();
 for(x=0;x<=5959;x++){
 deco();
 for(i=0;i<50;i++){
 aff();
 }
 }
}
