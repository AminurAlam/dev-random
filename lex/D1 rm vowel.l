%option noyywrap

%%
[aeiouAEIOU] ;
. ECHO;
%%

int main() { yylex(); }
