%option noyywrap

%%
[0-9] ;
. ECHO;
%%

void main() { yylex(); }
