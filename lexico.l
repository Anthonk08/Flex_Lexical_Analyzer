%{
#include <stdio.h>
#include <stdlib.h>

// Función para pasar tokens a Python
void send_token(const char *type, const char *text);
%}

%%
"while"            { send_token("WHILE_KEYWORD", yytext); }
"if"               { send_token("IF_KEYWORD", yytext); }
"else"             { send_token("ELSE_KEYWORD", yytext); }
"return"           { send_token("RETURN_KEYWORD", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { send_token("IDENTIFIER", yytext); }
[0-9]+             { send_token("NUMBER", yytext); }
"+"                { send_token("PLUS", yytext); }
"-"                { send_token("MINUS", yytext); }
"*"                { send_token("MULTIPLY", yytext); }
"/"                { send_token("DIVIDE", yytext); }
[ \t\n]            { /* Ignorar espacios en blanco */ }
.                  { send_token("UNKNOWN", yytext); }
%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}

// Función para pasar tokens a Python
void send_token(const char *type, const char *text) {
    printf("%s %s\n", type, text);
}

