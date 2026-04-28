%{
#include <assert.h>
int cn = 0, nl = 0;
%}

%option noyywrap

%%
\n nl++;
[A-z] {
    char ch = yytext[0];
    if (!(ch=='a'||ch=='e'||ch=='i'||ch=='o'||ch=='u'||
        ch=='A'||ch=='E'||ch=='I'||ch=='O'||ch=='U'))
        cn++;
}
%%

int main() {
    yylex();
    printf("consonants = %d, newlines = %d\n", cn, nl);
    assert(cn == 7);
    assert(nl == 4);
}

