%{
#include <assert.h>
int cn = 0, nl = 0;
%}

%option noyywrap

%%
[B-DF-HJ-NP-TV-Zb-df-hj-np-tv-z] cn++; ECHO;
\n nl++; ECHO;
%%

int main() {
    yylex();
    printf("consonants = %d, newlines = %d\n", cn, nl);
    assert(cn == 7);
    assert(nl == 4);
}

