#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/tdtr:0.5.5": *
#import "snippets/note.typ": *
#show: template.with("Compiler Design")

#let sink(n) = node-attr(sink: n)

+ [x] BOTTOM UP PARSING
+ [x] TOP DOWN PARSING
+ [ ] CONSTRUCT LR(0)
+ [ ] SLR PARSING TABLE
+ [x] CODE OPTIMIZATION TECHNIQUE
+ [x] LOOP CODE OPTIMIZATION TECHNIQUE
+ [ ] INTERMEDIATE CODE GENERATION
+ [ ] QUADRUPLE AND TRIPLE
+ [ ] LL(1) PARSING TABLE
+ [ ] COMPUTE FIRST AND FOLLOW
+ [ ] CONVERT NFA TO DFA
+ [ ] SYNTAX DIRECTED TRANSLATIONS
+ [ ] ERROR HANDLING TECHNIQUES IN CD
+ [ ] LEXICAL ANALYZER
+ [ ] EXPLAIN PHASES OF COMPILER WITH DIAGRAM

#pagebreak()

= DIFFERENCE

== compiler and interpreter [TODO]

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
  corner-radius: 5pt,
  ..args,
)

#figure(diagram(
  spacing: 5pt,
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

structure
- declerations
- translation rules
- auxiliary procedures

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

#tidy-tree-graph(
  draw-node: (stroke: none),
  draw-edge: (
    tidy-tree-draws.south-north-draw-edge,
    (marks: "-"),
  ),
)[
  - S
    - NP
      - Det
        - The #sink(2)
      - Adj
        - big #sink(2)
      - N
        - dog #sink(2)
    - VP
      - V
        - barked #sink(2)
      - PP
        - P
          - at #sink(1)
        - NP
          - Det
            - the
          - N
            - mailman
]

== check if LL

1. / case 1: no null present

#let Fi = "First"

$S -> a | b | c$

if $epsilon in Fi(a) inter Fi(b) inter Fi(c) "then it is LL"$

if $epsilon in.not Fi(a) inter Fi(b) inter Fi(c) "then it is NOT LL"$

2. / case 2: null present

$S -> a | b | epsilon$

if $epsilon in Fi(a) inter Fi(b) inter Fi(S) "then it is LL"$

if $epsilon in.not Fi(a) inter Fi(b) inter Fi(S) "then it is NOT LL"$

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

== The Core Mechanism: Leftmost Derivation

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

== Types of Top-Down Parsers

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

== The Core Mechanism: Shift-Reduce Parsing

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
  align: (auto, auto, auto, auto),
  table.header([Step], [Stack], [Input Buffer], [Action]),
  table.hline(),
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

== The Shift-Reduce Conflicts

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

== Types of Bottom-Up Parsers (LR Parsers)

To resolve these conflicts without backtracking, compilers use table-driven LR
Parsers. LR stands for Left-to-right scanning, Rightmost derivation in reverse.

LR parsers are distinguished by how they build their parsing tables (specifically,
how much lookahead they use to make decisions). They are generally ordered from least
powerful (but smallest tables) to most powerful (but largest tables):

=== A. LR(0) Parser

- The simplest LR parser.
- 0 means it uses zero lookahead tokens. It makes decisions based only on the current
  contents of the stack.
- Very restrictive; it cannot handle grammars with shift/reduce or reduce/reduce
  conflicts.

=== B. SLR(1) Parser (Simple LR)

- An upgrade to LR(0) that uses 1 lookahead token.
- It tries to resolve conflicts by looking at the "Follow set" of a non-terminal. It
  will only perform a reduction if the next incoming token is a valid symbol that can
  legally follow that non-terminal.
- Easy to implement but still cannot handle complex grammars.

=== C. LALR(1) Parser (Look-Ahead LR)

- The industry standard for bottom-up parsing. Tools like YACC (Yet Another
  Compiler-Compiler) and Bison generate LALR(1) parsers.
- It merges states from the more complex CLR(1) parser to keep the table size small
  and manageable, while retaining almost all of its predictive power.
- Strikes the perfect balance between table size and parsing power.

=== D. CLR(1) Parser (Canonical LR)

- The most powerful LR parser.
- It uses a very precise 1-token lookahead mechanism baked directly into every state
  of the parser.
- It can parse the largest class of context-free grammars, but it generates an
  enormous parsing table with too many states, making it impractical for most
  real-world compilers.

== Summary: Top-Down vs. Bottom-Up

While top-down parsers (like LL(1)) are intuitive and easy to write by hand
(Recursive Descent), they struggle with left recursion and require the grammar to be
heavily modified.

Bottom-up parsers (like LALR(1)) are incredibly powerful. They can easily handle
left-recursive grammars, can parse a much wider variety of languages, and detect
syntax errors at the exact moment they occur. However, because building their parsing
tables is a complex mathematical process, they are almost never written by hand;
instead, developers use parser generator tools to create them.

Would you like to dive into how tools like YACC/Bison are used to automatically
generate these parsers in practice?

#pagebreak()

= CODE OPTIMIZATION TECHNIQUES

When a compiler translates your source code into machine code, it doesn't just do a
direct word-for-word translation. Modern compilers have a complex "middle end"
dedicated to optimization rewriting your logic behind the scenes so that the final
program runs faster, uses less memory, or consumes less power, all without changing
what the program actually does.

These optimizations generally fall into a few major categories. Here are the most
common and powerful code optimization techniques used by compilers:

== Local Optimizations (Basic Blocks)

These techniques look at small, straight-line segments of code (where there are no
jumps, loops, or branches) to find inefficiencies.

/ Constant Folding: If an expression consists entirely of constants, the compiler
  calculates the result at compile time rather than wasting CPU cycles at runtime.
  / Before: ```c int seconds_per_day = 60 * 60 * 24;```
  / After: ```c int seconds_per_day = 86400;```

/ Constant Propagation: If a variable is assigned a constant value and its value
  doesn't change, the compiler replaces subsequent uses of that variable directly
  with the constant.
  / Before: ```c
    int x = 14;
    int y = x + 5;```
  / After: ```c int y = 14 + 5;```

/ Common Subexpression Elimination (CSE): If the exact same calculation is performed
  multiple times, the compiler does it once, stores the result, and reuses it.
  / Before: ```c
    a = (x * y) + z;
    b = (x * y) - 5;```
  / After: ```c
    temp = x * y;
    a = temp + z;
    b = temp - 5;```

== Loop Optimizations

Loops are where programs spend most of their time, so compilers work incredibly hard
to optimize them.

/ Loop-Invariant Code Motion (Hoisting): If a calculation inside a loop yields the
  same result on every single iteration, the compiler moves it outside the loop so it
  only runs once.
  / Before: ```c
    for (int i = 0; i < 100; i++)
      a[i] = x * y;```
  / After: ```c
    temp = x * y;
    for (int i = 0; i < 100; i++)
      a[i] = temp;```

/ Loop Unrolling: Loop control instructions (like checking `i < 100` and jumping back
  up) take time. Unrolling reduces this overhead by executing the loop body multiple
  times per iteration.
  / Before: ```c
    for (int i = 0; i < 4; i++)
      do_something();```
  / After: ```c
    do_something();
    do_something();
    do_something();
    do_something();```

/ Strength Reduction in Loops: Replacing expensive operations (like multiplication)
  with cheaper ones (like addition) based on loop counters.
  / Before: ```c
    for (int i = 0; i < 10; i++)
      a[i] = i * 4;```
  / After: ```c
    int temp = 0;
    for (int i = 0; i < 10; i++) {
      a[i] = temp;
      temp = temp + 4;
    }```

== Global and Interprocedural Optimizations

These techniques analyze the flow of the entire program, looking across loops,
branches, and even different function calls.

/ Dead Code Elimination: The compiler completely deletes code that can never be
  reached or variables that are calculated but never used.
  / Before: ```c
    int x = 5;
    if (false)
      do_something();
    return x;```
  / After: ```c
    return 5;```

/ Function Inlining: Calling a function introduces overhead (saving registers,
  pushing arguments to a stack). For very small functions, the compiler simply pastes
  the function's code directly into the place where it was called.
  / Before: ```c
    int square(int x) {
      return x * x;
    }
    int a = square(5);```
  / After: ```c int a = 5 * 5;```

== Machine-Dependent Optimizations (Back-end)

Once the compiler starts generating assembly code for a specific CPU architecture
(like x86 or ARM), it performs lower-level tweaks.

/ Peephole Optimization: The compiler looks at a tiny sliding window ("peephole") of
  generated assembly instructions and looks for ways to swap them with shorter or
  faster instructions. For example, replacing a multiplication by 2 with a much
  faster left bit-shift (`x << 1`).
/ Register Allocation: CPUs have a limited number of incredibly fast storage
  locations called registers. The compiler uses complex algorithms (like graph
  coloring) to figure out which variables should live in registers versus slower RAM
  at any given moment.

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

Intermediate Code Generation is the fourth phase of a standard compiler. It takes the
deeply analyzed, tree-like structure of your source code (usually an Abstract Syntax
Tree) and translates it into a new, lower-level language called an Intermediate
Representation (IR).

Think of it as a universal translator or a "bridge" language. It is no longer the
high-level language you wrote (like C++, Java, or Python), but it isn't quite the raw
binary machine code that a specific CPU (like x86 or ARM) understands, either.

== Why do compilers use Intermediate Code?

You might wonder: If the ultimate goal is to get machine code, why not just translate
the source code directly to machine code and skip the middleman?

Compilers use intermediate code for two reasons:

/ The "M \* N" vs. "M + N" Problem: (Retargetability) Imagine you have 3 programming
  languages (C, Python, Rust) and you want them to run on 3 different computer
  architectures (x86, ARM, MIPS).
  - If you translate directly, you have to write a completely separate compiler for
    every combination: C-to-x86, C-to-ARM, Rust-to-MIPS, etc. ($3 * 3 = 9$
    compilers).
  - With an IR, you write one "Front-End" for each language that translates it to the
    universal IR, and one "Back-End" for each architecture that translates the IR
    into machine code. ($3 + 3 = 6$ components). This is the secret sauce behind
    modern compiler frameworks like LLVM. You can invent a brand new programming
    language, write a front-end that translates it to LLVM IR, and suddenly your
    language can run on almost any computer hardware in the world.

/ Universal Optimization: Remember the compiler optimizations we talked about (like
  constant folding and loop unrolling)? If you do those optimizations on the
  Intermediate Representation, you only have to write the optimization logic once.
  Every language that compiles down to that IR gets the performance boost for free!

== What does Intermediate Code look like?

IR can take several forms, including graph-based structures (like Directed Acyclic
Graphs), but the most famous and widely used form is Three-Address Code (TAC).

In TAC, complex mathematical expressions are broken down into a sequence of simple
instructions. The fundamental rule of TAC is that each instruction can have at most
three "addresses" (two operands and one result), and at most one operator. The
compiler generates temporary variables (usually named `t1`, `t2`, etc.) to hold the
intermediate steps.

Here is an example of how your source code transforms into TAC:

Your Source Code:

```c
x = a + b  c;
```

Three-Address Code (IR):

```js
t1 = b  c   // Calculate the multiplication first and store in temp 1
t2 = a + t1 // Add 'a' to the result of the multiplication
x = t2      // Assign the final result to x
```

It breaks everything down into bite-sized, sequential steps, making it incredibly
easy for the back-end of the compiler to map these temporary variables to actual CPU
registers and generate the final assembly code.

Since you've now looked at parsing, optimization, and intermediate code generation,
are you studying the full lifecycle of a compiler, or is there a specific phase you
are trying to implement yourself?

#pagebreak()

= LL PARSING TABLE

In a recursive­descent parser, the production information is embedded in the
individual parse functions for each nonterminal and the run­time execution stack is
keeping track of our progress through the parse. There is another method for
implementing a predictive parser that uses a table to store that production along
with an explicit stack to keep track of where we are in the parse.

#pagebreak()

= SYNTAX ANALYSIS

== Error

- Missing parenthesis
- extraneous-insertion error
- replacement errors
- transcription error
- insertion error

== Recovery

- / panic mode: discards inputs from beginning to hopefully remove error
- / exhaustive error recovery: examine every possibility then deciding appropriate
    recovery
- / systematic methods:
  - suspend normal parsing
  - try changing input buffer or stack contents
  - resume parsing from the new configuration

#pagebreak()
