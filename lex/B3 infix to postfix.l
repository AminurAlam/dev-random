%{
char op = '\0';
%}

%option noyywrap

%%

[0-9]+ {
    printf("%s ", yytext);
    if (op != '\0') {
        printf("%c ", op);
        op = '\0';
    }
}
\n {
    if (op != '\0') {
        printf("%c ", op);
        op = '\0';
    }
    printf("\n");
}
[+*] op = yytext[0];
. ;

%%

int main() { yylex(); }
