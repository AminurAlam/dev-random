#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/tdtr:0.5.5": *
#import "/typst/snippets/note.typ": *
#show: template.with("Compiler Design")

#let sink(n) = node-attr(sink: n)

#pagebreak()

= DIFFERENCE

== Top-down vs Bottom-up Parsers

#table(
  columns: (19%, auto, auto),
  [FEATURE], [TOP-DOWN PARSING], [BOTTOM-UP PARSING],
  [Tree Construction],
  [Builds the parse tree from the root down to the leaves.],
  [Builds the parse tree from the leaves up to the root.],

  [Derivation Strategy],
  [Finds the Leftmost Derivation of the input string.],
  [Finds the Rightmost Derivation in reverse.],

  [Core Mechanism],
  [Predictive: Uses lookahead tokens to guess the correct rule to expand.],
  [Shift-Reduce: Pushes tokens to a stack and reduces them when they match a rule.],

  [Left Recursion],
  [Cannot handle left-recursive grammars. (Requires elimination).],
  [Can easily handle left-recursive grammars.],

  [Common Prefixes],
  [Struggles with common prefixes. (Requires Left Factoring).],
  [Handles common prefixes naturally without modification.],

  [Power & Scope],
  [Less powerful. Parses a smaller subset of context-free grammars (LL grammars).],
  [More powerful. Parses a much wider range of context-free grammars (LR grammars).],

  [Implementation],
  [Easy to write by hand (e.g., Recursive Descent parsers).],
  [Extremely difficult to write by hand; usually relies on parser generators (e.g.,
    YACC, Bison).],

  [Examples], [Recursive Descent, LL(1).], [LR(0), SLR(1), LALR(1), CLR(1).],
)

== Compiler vs Interpreter

#table(
  columns: 2,
  [COMPILER], [INTERPRETER],
  [more processing], [less processing],
  [faster], [slower],
  [writing compiler is hard], [easier to write],
  [CPU is interpreting], [SW is interpreting],
  [less secure], [more secure],
  [IR is low level], [IR is HLL],
  [not portable], [portable],

  [The compiler saves the Machine Language in form of Machine Code on disks],
  [The Interpreter does not save the Machine Language],

  [The compiler generates an output in the form of executable],
  [The interpreter does not generate any output],

  [Any change in the source program after the compilation requires recompiling the
    entire code],
  [Any change in the source program during the translation does not require
    retranslation of the entire code],

  [Errors are displayed in Compiler after Compiling together at the current time],
  [Errors are displayed in every single line],

  [The compiler can see code upfront], [The Interpreter works line by line],

  [does not require source code for later execution],
  [requires source code for later execution],

  [Execution takes place after compilation], [Execution happens on every line],

  [takes a large amount of time for analyzing the source code],
  [takes less time for analyzing the source code],

  [CPU utilization is more], [CPU utilization is less],

  [C, C++, C\#], [Python, Ruby, Perl, MATLAB],
)

#pagebreak()

= PHASES OF COMPILER

#let blob(pos, label, tint: white, ..args) = node(
  pos,
  align(center, label),
  width: 40mm,
  stroke: 1pt,
  inset: 8pt,
  corner-radius: 5pt,
  ..args,
)

#figure(diagram(
  spacing: 15pt,
  cell-size: (80mm, 20mm),
  edge-stroke: 1pt,

  blob((0, 0), [], stroke: none),
  edge([character stream], "-|>"),
  blob((0, 1), [lexical analyzer]),
  edge([token streams], "-|>"),
  blob((0, 2), [syntax analyzer]),
  edge([syntax tree], "-|>"),
  blob((0, 3), [semantic analyzer]),
  edge([annotated tree], "-|>"),
  blob((0, 4), [intermediate code generator]),
  edge([IR], "-|>"),
  blob((0, 5), [code generator]),
  edge([target code], "-|>"),
  blob((0, 6), [machine dependent code optimizer]),
  edge([target code], "-|>"),
  blob((0, 7), [], stroke: none),

  blob((1, 4), [symbol table], height: 50pt),
))

#pagebreak()

= LEX

Lexical Analysis is the very first phase of the compiler. Also known as a scanner or
lexer, its primary job is to read the raw source code (a stream of characters) and
group them into meaningful, logical units called tokens.

You can think of the lexical analyzer as the "reader" of the compiler. Just as you
read English by grouping individual letters into words before trying to understand
the grammar of a sentence, the compiler groups characters into tokens before passing
them to the parser (Syntax Analyzer) to check the grammar.

== Terminology

/ Lexeme: The actual sequence of characters in the source code. It is the raw text.
  (e.g., `int`, `counter`, `=`, `100`).
/ Token: The categorical label or internal representation given to a lexeme by the
  compiler. It is usually represented as a pair: `<Token Attribute Name, Value>`.
  (e.g., `<KEYWORD>`, `<IDENTIFIER>`, `<pointer_to_symbol_table>`).
/ Pattern: The rule that describes how a sequence of characters can form a specific
  token. Patterns are almost always defined using Regular Expressions (Regex). (e.g.,
  The pattern for an identifier might be `[a-zA-Z_][a-zA-Z0-9_]*`).

== Example

Consider the following simple line of C-like code: `int count = 100 + bonus;`

The lexical analyzer reads this character by character (`i`, `n`, `t`, ` `, `c`…) and
generates a stream of tokens:

#table(
  columns: (15%, 20%, 50%),
  [Lexeme], [Token Type], [Description],
  [`int`], [`KEYWORD`], [Reserved word denoting an integer type],
  [`count`], [`IDENTIFIER`], [A user-defined name],
  [`=`], [`ASSIGN_OP`], [Assignment operator],
  [`100`], [`NUMBER`], [An integer literal/constant],
  [`+`], [`ADD_OP`], [Addition operator],
  [`bonus`], [`IDENTIFIER`], [Another user-defined name],
  [`;`], [`PUNCTUATION`], [Statement terminator],
)

== Roles and Responsibilities

Aside from generating tokens, the lexer handles several crucial "housekeeping" tasks
for the compiler:

+ / Stripping Whitespace and Comments: The lexer completely removes spaces, tabs,
    newline characters, and all programmer comments (e.g., `//` or `/* */`). These
    are irrelevant to the parser and would only complicate the grammar.
+ / Correlating Errors with Line Numbers: Because the lexer reads the code
    line-by-line and character-by-character, it keeps track of the current line
    number and column number. When the parser or semantic analyzer finds an error
    later, they ask the lexer for the line number to provide a helpful error message.
+ / Interacting with the Symbol Table: When the lexer discovers a new identifier
    (like a variable or function name), it inserts it into the Symbol Table---a
    central database used by all phases of the compiler to store information about
    the program's variables.
+ / Macro Expansion (Sometimes): In languages like C, a preprocessor usually handles
    macros (`#define`), but in some compiler architectures, the lexical analyzer
    expands these macros as it reads the code.

== Workings

Lexical analyzers are built upon the mathematical foundation of Finite Automata
(State Machines).

+ / Regular Expressions: The compiler designer defines the patterns for all valid
    tokens using regular expressions.
+ / Deterministic Finite Automaton (DFA): The regex patterns are converted into a
    DFA. The DFA is a state machine that reads characters one by one. As it
    transitions through states, it checks if the characters form a valid pattern.
+ / Longest Match Rule: If a lexer is reading the string `counter`, it doesn't stop
    at `count` (which might be a valid word or keyword). It keeps reading until it
    hits a space or an operator to find the longest possible string that matches a
    valid pattern.

== Errors Handling

A lexical error occurs when the lexer encounters a sequence of characters that does
not match any defined pattern in the language.

Examples of Lexical Errors:

- An illegal character not supported by the language (e.g., using `@` or `$` in a
  standard C program outside of a string).
- An unclosed string literal (e.g., `String s = "Hello;` where the closing quote is
  missing).
- A variable name that breaks the rules (e.g., `int 2ndPlace;` because identifiers
  typically cannot start with a number).

Recovery: The most common error recovery strategy for a lexer is the "Panic Mode"
approach for characters: it simply deletes the offending, unrecognizable character,
issues an error message (e.g., "Stray '\@' in program"), and continues reading the
next character to find the next valid token.

== Seperation from Parsing

You might wonder why the compiler doesn't just parse the raw characters directly.
Dividing lexical analysis and syntax analysis into two separate phases is a
fundamental design principle for several reasons:

/ Simplicity of Design: It makes the parser's job much easier. The parser's grammar
  rules can be written in terms of high-level tokens (like `IDENTIFIER` or `NUMBER`)
  rather than worrying about complex character-level spacing, comments, and line
  breaks.
/ Efficiency: Reading a file character-by-character from a hard drive is incredibly
  slow. The lexer utilizes highly optimized, specialized buffering techniques to read
  chunks of source code into memory quickly. Isolating this I/O work makes the whole
  compiler much faster.
/ Portability: Different operating systems have different ways of representing
  special characters (like Carriage Return `r` vs Line Feed `n` for a new line). The
  lexer normalizes these differences, allowing the parser to remain completely
  platform-independent.

Today, developers rarely write lexical analyzers completely from scratch. They use
Lexer Generators (like Lex in UNIX, or its modern open-source equivalent Flex). The
developer simply feeds a text file containing Regular Expressions to Flex, and Flex
automatically writes the highly optimized C code for the DFA state machine.

#pagebreak()

= PARSER

#table(
  columns: 2,
  [TOP-DOWN PARSING], [BOTTOM-UP PARSING],
  [It is a parsing strategy that first looks at the highest level of the parse tree
    and works down the parse tree by using the rules of grammar.],
  [It is a parsing strategy that first looks at the lowest level of the parse tree
    and works up the parse tree by using the rules of grammar.],

  [Top-down parsing attempts to find the left most derivations for an input string.],
  [Bottom-up parsing can be defined as an attempt to reduce the input string to the
    start symbol of a grammar.],

  [In this parsing technique we start parsing from the top (start symbol of parse
    tree) to down (the leaf node of parse tree) in a top-down manner.],
  [In this parsing technique we start parsing from the bottom (leaf node of the parse
    tree) to up (the start symbol of the parse tree) in a bottom-up manner.],

  [This parsing technique uses Left Most Derivation.],
  [This parsing technique uses Right Most Derivation.],

  [The main leftmost decision is to select what production rule to use in order to
    construct the string.],
  [The main decision is to select when to use a production rule to reduce the string
    to get the starting symbol.],

  [Example: Recursive Descent parser.], [Example: Shift Reduce parser.],
)

== Types

#tidy-tree-graph(
  spacing: (0pt, 40pt),
  draw-edge: tidy-tree-draws.horizontal-vertical-draw-edge,
)[
  - PARSERS
    - top down \ (left to right, leftmost derivation)
      - predictive
        - recursive decent
        - LL(1)
      - backtracking
    - bottom up \ (left to right, rightmost derivation)
      - Operator \ precedence
      - LR \ Parsers
        - LR(0)
        - SLR
        - CLR
        - LALR
]

== LL parsing table

- find first and follow
- make tables of rules by terminals
- number each production
- for each production
  - find its first
  - if its #math.epsilon find the follow of LHS
  - enter that production number in that column

== SLR parsing table

#img("assets/lr0.png")

== Check if LL

1. / case 1: no null present

#let Fi = "First"
#let Fo = "Follow"

$S -> a | b | c$

if $epsilon in Fi(a) inter Fi(b) inter Fi(c) "then it is LL"$

if $epsilon in.not Fi(a) inter Fi(b) inter Fi(c) "then it is NOT LL"$

2. / case 2: null present

$S -> a | b | epsilon$

if $epsilon in Fi(a) inter Fi(b) inter Fo(S) "then it is LL"$

if $epsilon in.not Fi(a) inter Fi(b) inter Fo(S) "then it is NOT LL"$

#pagebreak()

= TOP-DOWN PARSERS

Top-down parsing is a strategy used in compiler design to analyze a string of symbols
(source code) according to the rules of a formal grammar. As the name suggests, it
attempts to construct a parse tree starting from the root (the starting non-terminal
symbol) and working its way down to the leaves (the terminal symbols or the actual
tokens of the string).

Essentially, a top-down parser attempts to find a leftmost derivation for an input
string.

Here is a detailed breakdown of how top-down parsing works, its variants, and its
limitations.

== Leftmost Derivation

In top-down parsing, the parser always looks at the leftmost non-terminal in the
current string and replaces it using one of the grammar's production rules.

Example: Consider the grammar:
$
  S arrow a B c \
  B arrow d | e
$

If the input string is $a d c$, the top-down parser does the following:

+ / Start with the root:
  $S$
+ / Apply rule $S arrow a B c$:
  The string becomes $a B c$. The parser matches the terminal $a$ with the input.
+ / Look at the next non-terminal ($B$):
  The parser needs to choose between $B arrow d$ and $B arrow e$.
+ / Choose $B arrow d$:
  The string becomes $a d c$. The parser matches $d$ and then matches $c$.
+ / Success:
  The parse tree is complete.

== Types

=== A. Recursive Descent Parsing (with Backtracking)

This is the most general form of top-down parsing. It uses a set of recursive
functions, where each function corresponds to a non-terminal in the grammar.

/ How it works: When it encounters a non-terminal with multiple production rules, it
  simply tries the first rule. If that rule fails to match the input string later on,
  the parser undoes its work (backtracks), returns to the previous state, and tries
  the next available rule.
/ Pros: Very easy to write manually (often used for simple configuration languages).
/ Cons: Backtracking is highly inefficient and computationally expensive ($O (c^n)$
  time complexity in the worst case).

=== B. Predictive Parsing (Without Backtracking)

To avoid the severe performance hit of backtracking, compilers use predictive
parsing. A predictive parser uses lookahead tokens (peeking at the next incoming
tokens of the input string) to predict exactly which production rule to apply.

The most common implementation of this is the LL Parser (specifically LL(1)):

- L = Left-to-right scanning of the input.
- L = Leftmost derivation.
- \+ = Uses 1 lookahead token to make decisions.

Predictive parsers can be implemented in two ways:

+ / Recursive Predictive Parsing: Similar to recursive descent, but written carefully
    so that the lookahead token guarantees the correct path without ever needing to
    backtrack.
+ / Non-Recursive (Table-Driven) Predictive Parsing: Uses an explicit stack (instead
    of recursive function calls) and a pre-computed parsing table. The table tells
    the parser exactly which rule to apply based on the non-terminal currently on top
    of the stack and the current input token.

== Grammar Requirements and Transformations

A top-down parser cannot handle just any context-free grammar. Because it predicts
the parse tree from the top down, the grammar must be free of ambiguities that
confuse the parser. Before generating a top-down parser, the grammar must undergo two
crucial transformations:

=== A. Elimination of Left Recursion

A grammar is left-recursive if a non-terminal can derive a sequence starting with
itself, such as $A arrow A alpha$.

/ The Problem: A top-down parser trying to expand $A$ will continually replace it
  with $A alpha$, then $A alpha alpha$, entering an infinite loop without ever
  consuming an input token.
/ The Solution: Left recursion must be converted to right recursion.
  - Rule: $A arrow A alpha \| beta$ becomes:
  - $A arrow beta A'$
  - $A' arrow alpha A' \| epsilon$ (where $epsilon$ is the empty string).

=== B. Left Factoring

Left factoring is required when two or more production rules for the same
non-terminal share a common prefix.

/ The Problem: Consider $A arrow alpha beta_1 \| alpha beta_2$. If a predictive
  parser sees an input matching $alpha$, it does not know whether to choose the first
  or the second rule.
/ The Solution: Factor out the common prefix so the parser can process it before
  making a decision.
  - Rule: $A arrow alpha beta_1 \| alpha beta_2$ becomes:
  - $A arrow alpha A'$
  - $A' arrow beta_1 \| beta_2$

== Summary

Top-down parsing is a highly intuitive, goal-directed method of parsing source code.
While basic recursive descent is too slow due to backtracking, LL(1) predictive
parsing is exceptionally fast ($O (n)$ time complexity) and is widely used in modern
compilers, provided the grammar is carefully designed to avoid left recursion and
common prefixes.

#pagebreak()

= BOTTOM-UP PARSERS

Bottom-up parsing is a parsing strategy that constructs a parse tree starting from
the leaves (the actual input tokens or terminal symbols) and works its way up to the
root (the starting non-terminal symbol of the grammar).

While top-down parsing attempts to guess the derivations from the start symbol,
bottom-up parsing looks for patterns in the input that match the right side of a
grammar rule and replaces them with the left side. Essentially, it traces a rightmost
derivation in reverse.

Here is a detailed breakdown of how bottom-up parsing works, its core mechanisms, and
its different variants.

== Shift-Reduce Parsing

The most common implementation of bottom-up parsing is Shift-Reduce parsing. It uses
a data structure called a stack to hold grammar symbols and an input buffer to hold
the remaining string to be parsed.

The parser performs four primary actions:

+ / Shift: Move the next input token from the input buffer onto the stack.
+ / Reduce: If a sequence of symbols at the top of the stack matches the right-hand
    side of a production rule (called a handle), replace those symbols with the
    non-terminal on the left-hand side of that rule.
+ / Accept: The parsing is successfully completed when the input buffer is empty, and
    the stack contains only the starting non-terminal symbol.
+ / Error: A syntax error is discovered if the parser cannot perform a valid shift or
    reduce action.

=== An Example Trace

Consider the following simplified expression grammar:

+ $E arrow E + E$
+ $E arrow E E$
+ $E arrow i d$

Let's trace how a shift-reduce parser would process the input string `id + id  id`.
We use `$` to represent the end of the input and the bottom of the stack.

#table(
  columns: 4,
  [Step], [Stack], [Input Buffer], [Action],
  [1], [\$], [id + id \* id\$], [Shift (move id to stack)],
  [2], [\$ id], [+ id \* id\$], [Reduce by E→id],
  [3], [\$ E], [+ id \* id\$], [Shift (move + to stack)],
  [4], [\$ E +], [id \* id\$], [Shift (move id to stack)],
  [5], [\$ E + id], [\* id\$], [Reduce by E→id],
  [6], [\$ E + E], [\* id\$], [Shift (move \* to stack)],
  [7], [\$ E + E \*], [id\$], [Shift (move id to stack)],
  [8], [\$ E + E \* id], [\$], [Reduce by E→id],
  [9], [\$ E + E \* E], [\$], [Reduce by E→E∗E],
  [10], [\$ E + E], [\$], [Reduce by E→E+E],
  [11], [\$ E], [\$], [Accept],
)

== Shift-Reduce Conflicts

Because shift-reduce parsing relies on making decisions at every step, it can
sometimes run into ambiguities where it doesn't know which action to take. These are
known as conflicts:

/ Shift/Reduce Conflict: The parser cannot decide whether to shift the next token
  onto the stack or reduce the symbols already on the stack. (e.g., in step 6 above,
  if the parser reduced $E + E$ immediately instead of shifting `*`, it would violate
  standard math precedence).
/ Reduce/Reduce Conflict: The parser identifies that the symbols on the top of the
  stack match the right-hand side of more than one production rule, and it doesn't
  know which non-terminal to reduce it to.

== Types

To resolve these conflicts without backtracking, compilers use table-driven LR
Parsers. LR stands for Left-to-right scanning, Rightmost derivation in reverse.

LR parsers are distinguished by how they build their parsing tables (specifically,
how much lookahead they use to make decisions). They are generally ordered from least
powerful (but smallest tables) to most powerful (but largest tables):

=== A. LR(0)

- The simplest LR parser.
- 0 means it uses zero lookahead tokens. It makes decisions based only on the current
  contents of the stack.
- Very restrictive; it cannot handle grammars with shift/reduce or reduce/reduce
  conflicts.

=== B. SLR(1) (Simple LR)

- An upgrade to LR(0) that uses 1 lookahead token.
- It tries to resolve conflicts by looking at the "Follow set" of a non-terminal. It
  will only perform a reduction if the next incoming token is a valid symbol that can
  legally follow that non-terminal.
- Easy to implement but still cannot handle complex grammars.

=== C. LALR(1) (Look-Ahead LR)

- The industry standard for bottom-up parsing. Tools like YACC (Yet Another
  Compiler-Compiler) and Bison generate LALR(1) parsers.
- It merges states from the more complex CLR(1) parser to keep the table size small
  and manageable, while retaining almost all of its predictive power.
- Strikes the perfect balance between table size and parsing power.

=== D. CLR(1) (Canonical LR)

- The most powerful LR parser.
- It uses a very precise 1-token lookahead mechanism baked directly into every state
  of the parser.
- It can parse the largest class of context-free grammars, but it generates an
  enormous parsing table with too many states, making it impractical for most
  real-world compilers.

#pagebreak()

= CODE OPTIMIZATION TECHNIQUES

== Data-Flow and Local Optimizations

These techniques look at small, straight-line sequences of code (called basic blocks)
to eliminate redundant calculations.

/ Constant Folding: The compiler evaluates constant expressions at compile-time
  rather than runtime.
  / Before: `int seconds_per_day = 60 * 60 * 24;`
  / After: `int seconds_per_day = 86400;`
/ Constant Propagation: If a variable is assigned a constant value, the compiler
  replaces later uses of that variable with the constant itself.
  / Before: `int x = 5; int y = x + 10;`
  / After: `int y = 5 + 10;` (which then folds to `15`)
/ Common Subexpression Elimination (CSE): If the exact same calculation is performed
  multiple times and the variables involved haven't changed, the compiler computes it
  once and reuses the result.
  / Before: `a = b + c; d = (b + c)  2;`
  / After: `temp = b + c; a = temp; d = temp  2;`
/ Dead Code Elimination: The compiler removes code that will never be executed
  (unreachable code) or code whose results are never used.
  / Before: `int x = 10; if (false) { x = 20; } return x;`
  / After: `return 10;`
/ Algebraic Simplification: Simplifying math equations using basic algebraic rules.
  / Examples: `x + 0` becomes `x`. `y * 1` becomes `y`.

== Loop Optimizations

see next section

== Interprocedural Optimizations

These optimizations look at the entire program, analyzing how different functions
call each other.

/ Function Inlining: The compiler replaces a function call with the actual body of
  the function. This eliminates the overhead of jumping to another memory address,
  pushing variables to the stack, and returning.
  / Before:
  ```c
  int square(int x) { return x * x; }
  int main() { return square(5); }
  ```
  / After:
  ```c
  int main() { return 5 * 5; } // Which then folds to 25
  ```
/ Tail Call Optimization (TCO): If the very last act of a function is to call another
  function (or itself recursively), the compiler can reuse the current function's
  stack frame instead of creating a new one. This prevents stack overflow errors in
  deep recursion.

== Machine-Dependent Optimizations

These occur at the very end of the compilation process and are tailored to the
specific hardware (CPU architecture) the code is being compiled for (e.g., x86, ARM).

/ Register Allocation: CPU registers are the fastest memory available. The compiler
  analyzes which variables are used most frequently and attempts to keep them in CPU
  registers rather than slower RAM.
/ Instruction Scheduling: Modern CPUs can execute multiple instructions at the same
  time (Instruction-Level Parallelism). The compiler reorders assembly instructions
  so that the CPU's pipeline stays full and doesn't stall waiting for memory fetches.
/ Peephole Optimization: The compiler looks at a tiny, sliding window (a "peephole")
  of generated assembly code and looks for short sequences that can be replaced by a
  single, faster instruction unique to that specific CPU.

== The Trade-off

It is worth noting that compilers usually offer different optimization levels (like
`-O0`, `-O1`, `-O2`, `-O3` in GCC/Clang). Higher optimization levels result in
incredibly fast code, but they take much longer to compile and can make the code
difficult to debug, as the compiled machine code no longer maps cleanly to the
original source code.

#pagebreak()

= LOOP OPTIMIZATION

Because programs typically spend about 90% of their execution time inside loops,
compilers focus a massive amount of their optimization energy right there. Making a
loop even slightly faster can drastically improve the overall performance of an
application.

Here is a deep dive into the specific loop optimization techniques compilers use,
complete with examples of how they transform your code behind the scenes:

== Loop-Invariant Code Motion (Hoisting)

If a calculation inside a loop produces the exact same result on every single
iteration, computing it repeatedly is a waste of CPU cycles. The compiler "hoists"
this calculation outside the loop so it only executes once.

#grid(
  columns: (50%, 50%),
  inset: 10pt,
  stroke: black,
  ```c
  for (int i = 0; i < 1000; i++)
    array[i] = (x * y) + i;
  ```,
  ```c
   int temp = x * y;
   for (int i = 0; i < 1000; i++)
     array[i] = temp + i;
  ```,
)

== Loop Unrolling

Every time a loop repeats, the CPU has to do "bookkeeping": incrementing the counter,
checking the condition (e.g., `i < 100`), and jumping back to the top of the loop.
Loop unrolling reduces this overhead by putting multiple copies of the loop body
inside a single iteration.

#grid(
  columns: (50%, 50%),
  inset: 10pt,
  stroke: black,
  ```c
  for (int i = 0; i < 100; i++)
    process(array[i]);
  ```,
  ```c
  for (int i = 0; i < 100; i += 4) {
    process(array[i]);
    process(array[i+1]);
    process(array[i+2]);
    process(array[i+3]);
  }
  ```,
)

== Strength Reduction

This technique replaces expensive mathematical operations (like multiplication or
division) with cheaper ones (like addition or subtraction) when dealing with loop
variables.

#grid(
  columns: (50%, 50%),
  inset: 10pt,
  stroke: black,
  ```c
  for (int i = 0; i < 50; i++)
    int value = i * 7;
  ```,
  ```c
  int value = 0;
  for (int i = 0; i < 50; i++)
    value += 7;
  ```,
)

== Loop Fusion (Loop Jamming)

If a program has two separate loops that iterate over the same range and don't depend
on each other's results, the compiler can merge them into a single loop. This halves
the loop overhead and often improves memory caching because data is accessed closer
together in time.

#grid(
  columns: (50%, 50%),
  inset: 10pt,
  stroke: black,
  ```c
  for (int i = 0; i < 100; i++)
    a[i] = b[i] + 5;
  for (int i = 0; i < 100; i++)
    c[i] = d[i] * 2;
  ```,
  ```c
  for (int i = 0; i < 100; i++) {
      a[i] = b[i] + 5;
      c[i] = d[i] * 2;
  }
  ```,
)

== Loop Fission (Loop Distribution)

The exact opposite of loop fusion! Sometimes, a loop body is so massive and does so
many different things that it causes "cache thrashing" (constantly knocking necessary
data out of the CPU cache). The compiler will split the large loop into multiple
smaller, highly focused loops to improve memory access speeds.

== Loop Peeling

Sometimes the first few iterations (or the very last few) of a loop require special
handling or checks. Instead of checking for that special condition on every single
iteration, the compiler "peels" those edge cases off and handles them outside the
main loop.

#grid(
  columns: (50%, 50%),
  inset: 10pt,
  stroke: black,
  ```c
  for (int i = 0; i < n; i++) {
    if (i == 0)
      setup_first_element(a[i]);
    else
      process_element(a[i]);
  }
  ```,
  ```c
  if (n > 0)
    setup_first_element(a[0]); // Peeled off!

  for (int i = 1; i < n; i++)
    process_element(a[i]);     // No more 'if' statement inside the loop
  ```,
)

== Vectorization (SIMD)

Modern CPUs have special instructions (SIMD: Single Instruction, Multiple Data) that
can process multiple pieces of data at the exact same time. Modern compilers try to
transform standard loops into vectorized loops so the CPU can calculate chunks of
data (like 4, 8, or 16 numbers) in a single hardware tick.

Compilers have to play a delicate balancing act with these techniques, often using
complex heuristics to decide if an optimization will actually help or accidentally
hurt performance based on the specific hardware.

#pagebreak()

= INTERMEDIATE CODE GENERATION

Intermediate Code Generation is a critical phase in compiler design. It acts as the
bridge between the high-level source code you write and the low-level machine code
that your computer's processor actually executes.

After a compiler checks your code for syntax and semantic errors, it translates the
code into a form called Intermediate Representation (IR).

== Why Do Compilers Use Intermediate Code?

You might wonder why a compiler does not just translate source code (like C++ or
Java) directly into machine code (like x86 or ARM). Using an intermediate step
provides several massive advantages:

/ Machine Independence (Portability): The IR is entirely independent of the target
  hardware. This allows the compiler to be split into a Front-End (which translates
  the source code to IR) and a Back-End (which translates the IR to machine code).
  Because of this, you do not need to write a completely new compiler for every
  combination of language and hardware. You just write a new back-end for a new
  processor.
/ Easier Optimization: It is incredibly difficult to optimize high-level source code
  or raw machine code. IR is designed specifically to make code optimization
  algorithms (like removing dead code or unrolling loops) much easier to apply.
/ Re-usability: A single IR can be used by multiple languages. For example, LLVM IR
  is used by C, C++, Rust, and Swift to generate optimized machine code.

== Levels of Intermediate Representation

Intermediate code generally falls into two categories based on how closely it
resembles the final machine code:

+ / High-Level IR: This is closer to the original source code. It retains things like
    variables, arrays, and hierarchical structures.
    / Abstract Syntax Trees (AST): A tree representation of the source code's
      structure.
    / Directed Acyclic Graphs (DAG): Similar to an AST, but it identifies and merges
      common sub-expressions so the compiler does not compute the same thing twice.
+ / Low-Level IR: This is much closer to machine code. It flattens the program out
    into a linear sequence of simple instructions, removing complex structures like
    `for` loops and `if/else` statements in favor of simple jumps (like `goto`).
    / Three-Address Code (TAC): The most common low-level IR.

== Deep Dive: Three-Address Code (TAC)

In Three-Address Code, complex expressions are broken down into a series of simple
instructions. The fundamental rule of TAC is that each instruction can have at most
three operands (typically two sources and one destination) and only one operator.

To achieve this, the compiler creates temporary variables (usually labeled `t1`,
`t2`, `t3`, etc.) to store the results of intermediate steps.

=== Example Translation

Consider the following high-level mathematical expression: `a = b * -c + b * -c`

The compiler cannot compute this all at once. It breaks it down into TAC like this:

```js
t1 = -c          // Compute the unary minus
t2 = b * t1      // Compute the first multiplication
t3 = -c          // Compute the second unary minus
t4 = b * t3      // Compute the second multiplication
t5 = t2 + t4     // Add the two products together
a = t5           // Assign the final result to 'a'
```

Note: A smart compiler using a Directed Acyclic Graph (DAG) before generating TAC
would recognize that `b * -c` is computed twice and optimize it out, saving
instructions!

=== Managing Control Flow in TAC

High-level languages use `if`, `while`, and `for` loops to control the flow of a
program. TAC flattens these using conditional and unconditional jumps (similar to
assembly language).

Source Code:

```c
if (x > y) {
    z = x;
} else {
    z = y;
}
```

Three-Address Code Translation:

```text
      if x > y goto L1
      goto L2
L1:   z = x
      goto L3
L2:   z = y
L3:   ... (next instruction)
```

== How is TAC stored in Memory?

As we explored previously, the compiler needs a data structure to store these TAC
instructions in memory so it can optimize them. The three standard implementations
are:

/ Quadruples: Stores the operator, two arguments, and an explicit temporary result
  variable.
/ Triples: Stores the operator and two arguments, using the index of previous
  instructions instead of temporary variables.
/ Indirect Triples: Uses an array of pointers to point to triples, combining the
  space-saving of triples with the optimization flexibility of quadruples.

#pagebreak()

= INTERMEDIATE REPRESENTATION

In compiler design, Intermediate Representation (IR) is the data structure or code
used internally by a compiler to represent source code while translating it into
machine code.

One of the most common forms of IR is Three-Address Code (TAC), where a single
instruction generally has at most three operands (two inputs and one output).
Quadruples and triples are the two primary ways compilers implement and store
Three-Address Code in memory.

Here is a breakdown of how they work, using the expression `x = (a + b) * c` as an
example.

== The Baseline: Three-Address Code (TAC)

Before looking at quadruples and triples, here is what the expression
`x = (a + b) * c` looks like in standard TAC. The compiler generates temporary
variables (`t1`, `t2`) to hold intermediate values:

```py
t1 = a + b
t2 = t1  c
x = t2
```

== Quadruples

A quadruple is a record structure with exactly four fields. It explicitly stores the
temporary variables created during translation.

The four fields are:

+ / Op: The operator (e.g., `+`, `-`, `*`,`=`).
+ / Arg1: The first operand.
+ / Arg2: The second operand (can be empty).
+ / Result: The variable or temporary name where the result is stored.

Example using Quadruples: For our TAC above, the quadruples table looks like this:

#table(
  columns: (10%, 10%, 10%, 10%),
  [Op], [Arg1], [Arg2], [Result],
  [+], [a], [b], [t1],
  [\*], [t1], [c], [t2],
  [=], [t2], [], [x],
)

Pros & Cons:

/ Pro: Highly flexible for optimization. Because the results are explicitly named
  (`t1`, `t2`), you can easily reorder or move these instructions around during the
  code optimization phase without breaking references.
/ Con: Takes up more memory because it requires storing the names of all the
  temporary variables.

== Triples

A triple is a record structure with only three fields. Instead of creating explicit
temporary variables to store results, a triple refers to the index (or position) of
the statement that computed the value.

The three fields are:

+ / Op: The operator.
+ / Arg1: The first operand (or a reference to a previous triple).
+ / Arg2: The second operand (or a reference to a previous triple).

Example using Triples: For the same expression, the triples table looks like this:

#table(
  columns: (10%, 10%, 10%, 10%),
  [Index], [Op], [Arg1], [Arg2],
  [(0)], [+], [a], [b],
  [(1)], [\*], [(0)], [c],
  [(2)], [=], [x], [(1)],
)

Note: In index (1), `(0)` refers to the result of the operation at index 0.

Pros & Cons:

/ Pro: Saves memory. By eliminating the `Result` field and the need to generate
  temporary variable names, the compiler uses less space.
/ Con: Difficult to optimize. If the optimizer wants to move instruction `(0)` to a
  different part of the code, it has to find and update every single subsequent
  instruction that referenced `(0)`.

== Summary Comparison

#table(
  columns: (20%, auto, auto),
  [Feature], [Quadruples], [Triples],
  [Number of Fields], [4 (Op, Arg1, Arg2, Result)], [3 (Op, Arg1, Arg2)],
  [Temporary Variables],
  [Uses explicit names (`t1`, `t2`)],
  [Uses statement pointers (`(0)`, `(1)`)],

  [Memory Usage], [Higher], [Lower],
  [Code Optimization],
  [Easy (instructions are self-contained)],
  [Difficult (moving instructions breaks index pointers)],

  [Indirect Triples],
  [N/A],
  [A variation exists that uses an array of pointers to triples, making optimization
    easier while saving space.],
)

#pagebreak()

= ERROR HANDLING

In compiler design, error handling is a crucial component that ensures the compiler
doesn't just crash when it encounters invalid code, but instead provides helpful
feedback to the programmer. A robust error handler has three main goals: detect the
error, report it clearly (with line and column numbers), and recover quickly enough
to detect subsequent errors without generating an avalanche of false "cascading"
errors.

Errors can occur at various stages of compilation, but the most complex and
standardized error handling techniques are implemented during the Syntax Analysis
(Parsing) phase.

Here is a detailed breakdown of the primary error recovery techniques used in
compiler design.

== Panic Mode Recovery

This is the simplest, most common, and most effective error recovery strategy used by
most modern compilers.

/ How it works: When the parser discovers an error, it enters "panic mode." It simply
  discards input tokens one by one until it finds a designated synchronizing token.
/ Synchronizing Tokens: These are clear delimiters in the language that indicate the
  end of a statement or block, such as a semicolon (`;`), a closing brace (`}`), or
  keywords like `end` or `catch`.
/ Pros: It is incredibly easy to implement and guarantees that the parser will not
  fall into an infinite loop during recovery.
/ Cons: It skips over a substantial amount of code. Any other legitimate syntax
  errors present in the skipped tokens will go undetected in that compilation pass.

== Phrase-Level Recovery

Phrase-level recovery attempts to perform a localized correction on the remaining
input so the parser can continue.

/ How it works: When an error is detected, the parser looks at the immediate upcoming
  tokens and applies a local correction. This might involve replacing a comma with a
  semicolon, inserting a missing parenthesis, or deleting an extraneous token.
/ Example: If the parser sees `x = a + * b;`, it might delete the `*` and report
  "extraneous '\*' removed." If it sees `printf("Hello")`, it might insert a missing
  semicolon at the end.
/ Pros: It allows the parser to save and analyze more code than panic mode, catching
  more errors in a single pass.
/ Cons: It is harder to implement. If the local correction is poorly chosen, it can
  trick the parser into an infinite loop or cause a cascade of confusing,
  false-positive errors down the line.

== Error Productions

This technique relies on the compiler writer anticipating the most common mistakes
programmers make and explicitly building them into the language's grammar.

/ How it works: The grammar is augmented with special "error production" rules. If
  the parser utilizes one of these rules, it knows exactly what mistake the
  programmer made and can output a highly specific error message.
/ Example: In C or C++, using `=` instead of `==` inside an `if` statement is a
  common mistake. The compiler writer might add an error production specifically to
  catch `if ( id = expr )` instead of `if ( id == expr )`. When the parser hits this
  rule, it successfully parses the code but throws a specific warning/error: "Did you
  mean '==' instead of '='?"
/ Pros: Generates incredibly helpful, precise, and human-friendly error messages.
/ Cons: It complicates the grammar, increases the size of the parser, and requires
  the compiler designer to know in advance what mistakes are most likely to occur.

== Global Correction

Global correction is largely a theoretical concept and is rarely implemented in
production compilers due to its high computational cost.

/ How it works: When an input program contains errors, the compiler attempts to find
  the "closest" valid program. It computes the minimum number of insertions,
  deletions, and mutations (Minimum Distance Editing) required to turn the globally
  invalid token stream into a syntactically valid one.
/ Pros: It theoretically finds the absolute best way to fix the program with the
  least amount of disruption.
/ Cons: It is computationally prohibitive. The time and space complexity required to
  calculate the optimal global correction for a large source file is far too
  expensive for a practical, fast compiler.

== Errors in Other Compilation Phases

While the techniques above apply mostly to the parsing (syntax) phase, errors are
handled in other phases as well:

/ Lexical Errors: Occur during tokenization (e.g., illegal characters, unclosed
  string literals). The Lexer usually deletes the offending character, reports it,
  and continues scanning the next character.
/ Semantic Errors: Occur during type-checking and scope resolution (e.g., type
  mismatches, using undeclared variables, calling a function with the wrong number of
  arguments). The compiler usually logs the error and assigns a "dummy" or
  "universal" type (like `any`) to the erroneous variable so it can continue checking
  the rest of the code without crashing.
