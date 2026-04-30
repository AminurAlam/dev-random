%{
char op = '0';
int res = 0;
%}

%option noyywrap

%%
^-?[0-9]+       res = atoi(yytext);
"+"|"-"|"*"|"/" op = yytext[0];
[0-9]+          switch (op) {
    case '+': res = res + atoi(yytext); break;
    case '-': res = res - atoi(yytext); break;
    case '*': res = res * atoi(yytext); break;
    case '/': res = res / atoi(yytext); break;
}
\n {
    printf("%d\n", res);
    res = 0;
}
[ \t\n]+ ;
. return 1;
%%

int main() { yylex(); }
