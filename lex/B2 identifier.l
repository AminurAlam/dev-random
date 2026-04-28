%option noyywrap

%%
[A-z_][A-z_0-9]*$ ECHO;
. { printf("ERROR: `%s` is invalid\n", yytext); }
%%

int main() { yylex(); }
