%{
#include <stdio.h>
%}

/* Define exclusive states for the DFA */
%x Q1 Q2 Q3

%%

    /* --- INITIAL STATE: Even 'a', Even 'b' --- */
<INITIAL>a  { BEGIN Q1; }
<INITIAL>b  { BEGIN Q2; }
<INITIAL>\n { 
    printf("Result: REJECTED (Even 'a', Even 'b')\n\n"); 
    BEGIN INITIAL; /* Reset for the next string */
}

    /* --- STATE Q1: Odd 'a', Even 'b' (ACCEPTING STATE) --- */
<Q1>a       { BEGIN INITIAL; }
<Q1>b       { BEGIN Q3; }
<Q1>\n      { 
    printf("Result: ACCEPTED\n\n"); 
    BEGIN INITIAL; 
}

    /* --- STATE Q2: Even 'a', Odd 'b' --- */
<Q2>a       { BEGIN Q3; }
<Q2>b       { BEGIN INITIAL; }
<Q2>\n      { 
    printf("Result: REJECTED (Even 'a', Odd 'b')\n\n"); 
    BEGIN INITIAL; 
}

    /* --- STATE Q3: Odd 'a', Odd 'b' --- */
<Q3>a       { BEGIN Q2; }
<Q3>b       { BEGIN Q1; }
<Q3>\n      { 
    printf("Result: REJECTED (Odd 'a', Odd 'b')\n\n"); 
    BEGIN INITIAL; 
}

    /* --- ERROR HANDLING: Catch invalid characters --- */
<*>[^ab\n].*\n { 
    /* If any character other than 'a', 'b', or newline is found, 
       reject the whole line and reset */
    printf("Result: REJECTED (Invalid characters found)\n\n"); 
    BEGIN INITIAL; 
}

%%

int yywrap() {
    return 1; /* Indicate end of input */
}

int main() {
    printf("--- DFA: Odd 'a' and Even 'b' ---\n");
    printf("Enter strings over {a, b} (Press Ctrl+C to exit):\n\n");
    yylex();
    return 0;
}
