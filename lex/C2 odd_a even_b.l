%{
int a = 0, b = 0;
%}

%option noyywrap

%%
a a++; ECHO;
b b++; ECHO;
\n {
    printf(a%2 && !(b%2) ? " passed\n" : " failed\n");
    a=0; b=0;
}
%%

int main() { yylex(); }
