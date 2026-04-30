%option noyywrap
%x Q1 Q2 Q3

%%
<INITIAL>a  BEGIN Q1;
<INITIAL>b  BEGIN Q2;
<INITIAL>\n printf("REJECTED\n"); BEGIN INITIAL;

<Q1>a  BEGIN INITIAL;
<Q1>b  BEGIN Q3;
<Q1>\n printf("ACCEPTED\n"); BEGIN INITIAL;

<Q2>a  BEGIN Q3;
<Q2>b  BEGIN INITIAL;
<Q2>\n printf("REJECTED\n"); BEGIN INITIAL;

<Q3>a  BEGIN Q2;
<Q3>b  BEGIN Q1;
<Q3>\n printf(" REJECTED\n"); BEGIN INITIAL;

<*>[^ab\n].*\n printf("INVALID\n"); BEGIN INITIAL;
%%

void main() { yylex(); }
