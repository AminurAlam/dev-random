%{
#include <assert.h>
int n = 0;
%}

%option noyywrap

%%
#.*$ { n++; ECHO; }
%%

void main() {
    yylex();
    printf("comments: %d\n", n);
    assert(n == 3);
}
