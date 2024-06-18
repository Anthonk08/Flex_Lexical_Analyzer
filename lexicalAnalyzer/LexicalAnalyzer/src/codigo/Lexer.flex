package codigo;
import static codigo.Tokens.*;
%% /*Declaraciones que vamos a utilizar*/
%class Lexer
%type Tokens
L=[a-zA-z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+ /*Los espacios que ignorara el analizador lexico*/
%{
    public String lexeme;
%}
%%
/*Palabras reservadas*/
int |
if |
else |
while {lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/} /*Se ignoraran los espacios*/
"//".* {/*Ignore*/} 
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
. {return ERROR;}