%option noyywrap
%x A B

%%
<INITIAL>b  BEGIN B;
<INITIAL>a  BEGIN INITIAL;
<INITIAL>\n printf("REJECTED\n"); BEGIN INITIAL;

<B>a  BEGIN A;
<B>b  BEGIN B;
<B>\n printf("REJECTED\n"); BEGIN INITIAL;

<A>a  BEGIN A;
<A>b  BEGIN B;
<A>\n printf("ACCEPTED\n"); BEGIN INITIAL;

<*>[^ab\n].*\n printf("INVALID\n"); BEGIN INITIAL;
%%

int main() { yylex(); }
