%{
    #include <assert.h>
    int a = 0, b = 0;
%}

%option noyywrap

%%
a { a++; ECHO; }
b { b++; ECHO; }
\n {
    if (a%2 == 1 && b%2 == 0)
        printf(" passed\n");
    else
        printf(" failed\n");
    a=0; b=0;
}
%%

void main() { yylex(); }
