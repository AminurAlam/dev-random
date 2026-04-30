%s A B C
%option noyywrap

%%
<INITIAL>[0-9]+ BEGIN A;
<INITIAL>[^\n] BEGIN C;
<INITIAL>\n BEGIN INITIAL; printf("Not Accepted\n");

<A>\.[0-9]+ BEGIN B;
<A>[^\n] BEGIN C;
<A>\n BEGIN INITIAL; printf("Integer\n");

<B>[^\n] BEGIN C;
<B>\n BEGIN INITIAL; printf("Float\n");

<C>[^\n] BEGIN C;
<C>\n BEGIN INITIAL; printf("Invalid\n");
%%

int main() { yylex(); }
