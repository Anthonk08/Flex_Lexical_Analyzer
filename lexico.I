
%{
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>
FILE *yyin;
}%

/*Opciones*/
/*Flex solo leera un fichero de entrada*/
%option noyywrap
/*Nos permite tener el numero de linea*/
%option yylineno

/*Tokens*/
DIGITO [0-9]
LETRA [a-zA-Z]
ESPACIO [" "]
INI_COMENTARIO ["/*"]
FIN_COMENTARIO ["*/"]
GUIONES [-_]
CHAR_COMA [","]
CHAR_PUNTO ["."]
CHAR_PUNTOYCOMA [";"]
CHAR_DOSPUNTOS [":"]

IDENTIFICADOR {LETRA}({LETRA}|{DIGITO}|{GUIONES})*
CONST_INTEGER (-?[1-9][0-9]{0,4})|0
COSNT_FLOAT {DIGITO}{0,8}{CHAR_PUNTO}{DIGITO}{1,8}

CONST_CADENA \"[^\n"]*\"

/*Operaciones logicas*/
OP_SUMA ["+"]
OP_RESTA ["-"]
OP_MULT ["*"]
OP_DIV ["/"]
OP_IGUAL ["="]
OP_MAYOR [">"]
OP_MENOR ["<"]
OP_MAYORIGUAL ">="
OP_MENORIGUAL "<="
OP_COMP_IGUAL "=="
OP_NEGACION "!"
OP_DISTINTO "!="

/*DOBLE FUNCIONALIDAD*/
OP_DOSPUNTOS [":"]

/*Caracteres de apertura, cierre y fin de linea*/
LLAVE_A ["{"]
LLAVE_C ["}"]
PARENTESIS_A ["["]