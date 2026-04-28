%{
#include <stdio.h>
char saved_op = '\0';
%}

%option noyywrap

%%

[0-9]+ {
    printf("%s ", yytext);
    if (saved_op != '\0') {
        printf("%c ", saved_op);
        saved_op = '\0';
    }
}

[+*] saved_op = yytext[0];

\n {
    if (saved_op != '\0') {
        printf("%c ", saved_op);
        saved_op = '\0';
    }
    printf("\n");
}

\s ;
. ;

%%

void main() { yylex(); }
