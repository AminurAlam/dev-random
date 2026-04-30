%option noyywrap

%%
[A-z_][A-z_0-9]*$ ECHO;
.+$ ECHO; printf(" is invalid\n");
%%

int main() { yylex(); }
