%option noyywrap

%%
.*ba$ ECHO; printf(" passed");
.+    ECHO; printf(" failed");
%%

int main() { yylex(); }
