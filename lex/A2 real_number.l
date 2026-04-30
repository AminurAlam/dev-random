%option noyywrap

%%
^[+-]?[0-9]+$         ECHO; printf(" Integer");
^[+-]?[0-9]*\.[0-9]+$ ECHO; printf(" Float");
.*                    ECHO; printf(" Invalid");
%%

int main() { yylex(); }
