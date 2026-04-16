#import "snippets/note.typ": *
#show: template.with("DAA")

#pagebreak()

= CHARACTERISTICS OF ALGORITHM

An algorithm is a step-by-step procedure or set of rules designed to perform a
specific task or solve a particular problem. In computer science, a set of
instructions must meet specific criteria to be considered a true algorithm.

The most widely accepted list of characteristics was defined by computer scientist
Donald Knuth. Below are the five essential characteristics, along with additional
properties commonly recognized in modern computing.

- input:
  - an algorithm should have zero or more well-defined inputs
  - provided to the algorithm before it begins
- output:
  - an algorithm must produce at least one well-defined output
  - this output is related to the input
- finiteness:
  - an algorithm must always terminate after a finite number of steps
  - it cannot run in an infinite loop or recursion
- definiteness (unambiguous):
  - every step of the algorithm must be precisely defined, clear and unambiguous
  - the instructions should lead to only one possible interpretation
- effectiveness:
  - each step must be sufficiently basic and feasible
  - steps should be executable by current resources

#pagebreak()

= TIME COMPLEXITIES

#align(center, img("assets/time.png", width: 50%))

== Summary of Notations
- / Best Case ($Omega$): The absolute minimum number of steps required
- / Average Case ($Theta$): The expected number of steps for a random set of inputs
- / Worst Case (O): The maximum number of steps required

== Common Algorithms

#let tscol = (26%, 35%, 35%)
#let timecol = (12%, 28%, 28%, 28%)

MISC:
#table(
  columns: timecol,
  [ALGO], [BEST], [AVG], [WORST],
  [Linear\ Search], [$Omega(1)$ \ item at the first index], $$, [$O(n)$ \ not found],
  [Bubble\ Sort], [$Omega(n)$ \ already sorted], $$, [$O(n^2)$],
  [Insertion\ Sort], [$Omega(n)$ \ already sorted], $$, [$O(n^2)$],
  [Selection\ Sort], [$Omega(n^2)$], [$Theta(n^2)$], [$O(n^2)$],
  [Heap\ Sort], [$Omega(n log n)$ \ stable], [$Theta(n log n)$], [$O(n log n)$],
)

#pagebreak()

DIVIDE AND CONQUER:
#table(
  columns: timecol,
  [ALGO], [BEST], [AVG], [WORST],
  [Binary\ Search],
  [$Omega(1)$ \ middle element is the target],
  [$Theta(log n)$],
  [$O(log n)$ \ not found],

  [Merge\ Sort], [$Omega(n log n)$ \ stable], [$Theta(n log n)$], [$O(n log n)$],

  [Quick\ Sort],
  [$Omega(n log n)$ \ pivot element divides the array into two equal halves],
  [$Theta(n log n)$ \ two non equal parts],
  [$O(n^2)$ \ smallest or largest element is always chosen as the pivot (sorted
    arrays)],
)

GREEDY:
#table(
  columns: tscol,
  [ALGO], [TIME], [SPACE],
  [Knapsack], [], [],
  [Kruskal], [$O(E log E)$ or $O(E log V)$], [$O(E+V)$],
  [Prim], [$O((E+V) log(V))$], [$O(E+V)$],
)

DYNAMIC:
#table(
  columns: tscol,
  [ALGO], [TIME], [SPACE],
  [0/1 Knapsack], [$O(n W)$], [$O(n W)$],
  [APSP], [$O(V^3)$], [$O(1)$],
  [TSP], [], [],
)

BACKTRACKING:
#table(
  columns: tscol,
  [ALGO], [TIME], [SPACE],
  [N-Queen], [$O(n!)$], [$O(n)$],
  [Sum Of Subset], [$O(2^n)$], [$O(n)$],
  [Graph Coloring], [], [],
)

BRANCH AND BOUND:
#table(
  columns: tscol,
  [ALGO], [TIME], [SPACE],
  [Job Sequencing], [$O(n^2 log n)$], [$O(n)$],
)

== Recurrence Relation

$
  T(n) & = cases(
           1 & "  " n = 1,
           2 T(n/2)+n & "  " n > 1
         ) \
  T(n) & <= 2 T(n/2)+n \
       & <= 4 T(n/4)+2n \
       & <= 8 T(n/8)+3n \
       & "       " dots.v \
       & <= 2^k T(n/2^k)+k n \
$

let us assume: $n/2^k = 1 => n = 2^k => k = log n$

$
  T(n) & <= 2^k T(n/2^k)+k n \
  T(n) & <= n T(1)+ n log n \
  T(n) & <= n + n log n \
  T(n) & = O(n log n) \
$

== Master Theorem

$
  T(n) & = a T(n/b) + f(n) \
  T(n) & = a T(n/b) + O(n^k) \
       & a > 0, b > 0, k >= 0 \
  T(n) & = cases(
           O(n^(k)) & a < 1,
           O(n^(k+1)) & a = 1,
           O(n^k a^(n/b)) "  " & a > 1
         )
$

#pagebreak()

= DIVIDE AND CONQUER

== Binary Search Tree

A Binary Search Tree (BST) is a type of binary tree data structure in which each node
contains a unique key and satisfies a specific ordering property:
- All nodes in the left subtree of a node contain values strictly less than the
  node’s value.
- All nodes in the right subtree of a node contain values strictly greater than the
  node’s value.
This structure enables efficient operations especially when the tree remains
balanced. Operations like search, insertion, and deletion work in $O(log n)$ time for
a balanced binary search tree. In the worst-case (unbalanced), these degrade to
$O(n)$. With self-balancing BSTs like AVL and Red Black Trees, we can ensure the
worst case as $O(log n)$.

total number of possible BST: $display(attach(C, tl: 2n, br: n) / (n + 1))$

formula for optimal binary search tree:
$display(C_(i,j) = min_(i<k<=j) { C_(i,k-1) + C_(k,j) } + w(i, j))$

#grid(
  columns: 2,
  gutter: 10pt,
  img("assets/bst1.webp"), img("assets/bst2.webp"),
)

== Binary Search

ALGORITHM:
+ Divide the array into two halves by finding the middle index.
+ Compare the middle element of the search space with the query.
+ If the query is found at middle element, the process is terminated.
+ If the query is not found at middle element, choose which half will be used as the
  next search space.
  - If the query is smaller than the middle element, then the left side is used for
  next search.
  - If the query is larger than the middle element, then the right side is used for
  next search.
+ This process is continued until the query is found or the total search space is
  exhausted.

#align(center, img("assets/binary_search.webp", width: 60%))

== Quick Sort

There are mainly three steps in the algorithm:

ALGORITHM:
+ / Choose a Pivot: Select an element from the array as the pivot. The choice of
    pivot can vary (first element, last element, random element, or median).
+ / Partition the Array: Re arrange the array around the pivot. After partitioning,
    all elements smaller than the pivot will be on its left, and all elements greater
    than the pivot will be on its right.
+ / Recursively Call: Recursively apply the same process to the two partitioned
    sub-arrays.
+ / Base Case: The recursion stops when there is only one element left in the
    sub-array, as a single element is already sorted.

#align(center, img("assets/quicksort.webp", width: 70%))

#pagebreak()

= GREEDY

Most of the problems where greedy algorithms work follow these two properties:

+ / Greedy Choice Property: This property states that choosing the best possible
    option at each step will lead to the best overall solution
+ / Optimal Substructure: This means that you can break the problem down into smaller
    parts, and these smaller parts can be solved by making greedy choices

== Fractional Knapsack

`w = [w1, w2, w3]` \
`p = [p1, p2, p3]` \
`lim = m`

GOAL:

#let sumin = $display(sum_(i=1)^n)$
$"maximize  " & sumin p_i x_i "      (optimal)" \
"such that  " & sumin w_i x_i <= m \
"and  " & 0 <= x <= 1,"  " 1 <= i <= n$

== Minimum Spanning Tree

- A MST connects all the vertices in the graph, ensuring that there is a path between
  any pair of nodes.
- An MST contains no cycles.
- An MST with $V$ vertices will have exactly $V-1$ edges.
- An MST is optimal for minimizing the total edge weight, but it may not necessarily
  be unique.
- The cut property states that if you take any cut (a partition of the vertices into
  two sets) in the original graph and consider the minimum-weight edge that crosses
  the cut, that edge is part of the MST.

== Kruskal's MST
Kruskal's MST algorithm is to connect all the vertices of a graph with the minimum
total edge weight while avoiding cycles. This algorithm employs a greedy approach,
meaning it makes locally optimal choices at each step to achieve a globally optimal
solution.

This algorithm can be implemented efficiently using a DSU (Disjoint-Set) data
structure to keep track of the connected components of the graph. This is used in a
variety of practical applications such as network design, clustering, and data
analysis.

ALGORITHM:
+ Sort all the edges of the graph by their weights,
+ Then start the iterations of finding the spanning tree.
+ At each iteration add the next lowest-weight edge one by one, such that the edges
  picked until now does not form a cycle.

#grid(
  columns: 2,
  gutter: 10pt,
  img("assets/kmst1.webp"), img("assets/kmst2.webp"),
  img("assets/kmst3.webp"), img("assets/kmst4.webp"),
)
#align(center, img("assets/kmst10.webp", width: 60%))

== Prim's MST

ALGORITHM:
+ Start with an empty spanning tree.
+ Determine an arbitrary vertex as the starting vertex of the MST.
+ Find all edges connected to the selected vertices.
+ Select the edge with the lowest weight and not forming a loop.
+ Select the vertex connected to this edge.
+ Repeat step 3-5 till we have $V-1$ edges.

#grid(
  columns: 2,
  gutter: 10pt,
  img("assets/prim1.webp"), img("assets/prim2.webp"),
  img("assets/prim3.webp"), img("assets/prim4.webp"),
)
#align(center, img("assets/prim11.webp", width: 60%))

#pagebreak()

= DYNAMIC
// https://www.geeksforgeeks.org/dsa/introduction-to-dynamic-programming-data-structures-and-algorithm-tutorials/

Dynamic Programming is a commonly used algorithmic technique used to optimize
recursive solutions when same subproblems are called again. The core idea behind DP
is to store solutions to subproblems so that each is solved only once. To make sure
that a recursive value is computed only once (to improve time taken by algorithm), we
store results of the recursive calls. There are two ways to store the results, one is
top down (memoization) and other is bottom up (tabulation). Some popular problems
solved using Dynamic Programming are Fibonacci Numbers, Longest Common Subsequence,
Bellman-Ford Shortest Path, Floyd Warshall, Edit Distance and Matrix Chain
Multiplication.

== 0/1 Knapsack

Given n items where each item has some weight ($w$) and profit ($p$) associated with
it and also given a bag with capacity `m`. The task is to put the items into the bag
such that the sum of profits associated with them is the maximum possible. The
constraint here is we can either put an item completely into the bag or cannot put it
at all

FORMULA:
$
  & K(i, j) = cases(
      max {K(i-1, j)\, p_i + K(i-1, j - w_i)},
      K(i-1, j) "          ," j - w_i < 0
    ) \
  & i: "current item"; i_1 = 1 \
  & j: "remaining weight"; j = m \
$

#align(center, img("assets/knapsack01.webp", width: 85%))

== All Pair Shortet Path

APSP finds the shortest distance between every possible pair of vertices in a graph.

If a graph has $V$ vertices, the output of an APSP algorithm is typically a
$V times V$ matrix where the entry at row $i$ and column $j$ represents the shortest
distance from vertex $i$ to vertex $j$. Given a weighted graph $G = (V , E)$, we need
to find the shortest path from $i -> j$ for all $i , j in V$.

Floyd-Warshall Algorithm is the most common algorithm for APSP. It uses Dynamic
Programming. It iteratively considers each vertex $k$ as an intermediate point. It
checks if going from $i -> k -> j$ is shorter than the currently known path from
$i -> j$. in $O(V^3)$ time.

By the time the algorithm finishes, it has considered every possible vertex as an
intermediate point for every possible pair. Because it builds on previous results, it
effectively explores all possible combinations of paths without needing to
re-calculate them from scratch.

FORMULA:
$
  & A^k (i, j) = min {
      A^(k-1)(i, j),
      A^(k-1)(i, k),
      A^(k-1)(k, j)
    }, k >= 1
$

ALGORITHM:
+ Create a $V times V$ matrix called $D^0$.
+ Fill the diagonals with 0.
+ Fill non rechable vertices with $infinity$.
+ Fill the rest of the cells with their respective weights.
+ For $k in {1, ..., V}$
+ For every pair of vertices $(i , j)$
+ Check if $i -> k -> j$ is shorter than $i -> j$
+ If yes update $D_(i j)^k$ to $D_(i k)^(k-1) + D_(k j)^(k-1)$

== Travelling Salesperson Problem

Given a list of vertices and the distances between every pair of them ($G = (V, E)$),
what is the shortest possible route that visits each vertex exactly once and returns
to the original vertex?

Classified as an NP-Hard problem, its complexity grows exponentially with the
addition of each new city, making it computationally intensive to solve perfectly for
large datasets. While simple to state, the TSP is foundational for real-world
applications in logistics, planning, and microchip manufacturing, where finding the
most efficient sequence of tasks or locations can significantly reduce costs and
time.

To solve the Traveling Salesperson Problem (TSP) using Dynamic Programming, we use
the Held-Karp Algorithm. This approach reduces the complexity from a brute-force
$O(n!)$ to a more manageable (though still exponential) $O(n^2 dot 2^n)$.

FORMULA:
$
  & g(i, S) = min_(k in S) C_(i,k) + g(k, S inter {k}) \
  & i: "current vertex" \
  & S: "unexplored nodes connected to i" \
$

ALGORITHM:
+ pick a starting vertex
+ pick the next adjacent vertex you haven't visited
+ add the cost of the path to total sum
+ repeat till you have visited all vertices
+ travel back the starting node
+ pick the path with the smallest sum

#align(center, img("assets/tsp.heic", width: 90%))

#pagebreak()

= BACKTRACKING

Backtracking algorithms are like problem-solving strategies that help explore
different options to find the best solution. They work by trying out different paths
and if one doesn't work, they backtrack and try another until they find the right
one. It's like solving a puzzle by testing different pieces until they fit together
perfectly.

== N-Queen

Given an integer $N$, place $N$ queens on an $N times N$ chessboard such that no two
queens attack each other. A queen can attack another queen if they are placed in the
same row, the same column, or on the same diagonal.

Find all possible distinct arrangements of the queens on the board that satisfy these
conditions.

The output should be an array of solutions, where each solution is represented as an
array of integers of size n, and the i-th integer denotes the column position of the
queen in the i-th row. If no solution exists, return an empty array.

ALGORITHM:
+ Create an $N times N$ matrix to represent the chessboard
+ Initialize all cells to `0`
+ Start with placing the queen on first leftmost column (0, 0)
+ Try Placing a Queen in the next row
+ Check if the Queen can be placed in the position
+ Backtrack if queen cannot be placed there
+ repeat these steps for every row and then for every column
+ If successfully placed $N$ queens, store the current position as valid answer

#align(center, img("assets/nqueen.heic", width: 63%))

== Sum of Subset

Given a set of positive numbers $w_i, 1 <= i <= n$ and a sum $m$, find all subsets of
$w_i$ such that the sums of the subset is equal to $m$

$
  s subset.eq w "  and  " sum_(i=0)^n s_i = m
$

BOUNDING FUNCTION:
$
  & sum_(i=1)^(k) w_i x_i + w_(k+1) <= m \
  & sum_(i=1)^(k) w_i x_i + sum_(i=k+1)^(n) w_i > m \
$

ALGORITHM:
+ First, take an empty subset.
+ Include the next element to the empty set.
+ If the subset is equal to the sum value, mark it as a part of the solution.
+ If the subset is not a solution and it is less than the sum value, add next element
  to the subset until a valid solution is found.
+ Now, move to the next element in the set and check for another solution until all
  combinations have been tried.

#align(center, img("assets/subsum.heic", width: auto))

== Graph Coloring

ALGORITHM:
+ / Order the Vertices: Pick an order for the vertices (e.g.,
  $V_1 , V_2 , dots.h , V_n$).
+ / Color the First Vertex: Assign the first color (e.g., Color 0) to the first
    vertex.
+ / Process Remaining Vertices: For each of the remaining $n - 1$ vertices:
  - / Check Neighbors: Look at all the vertices already colored that are connected to
    the current vertex.
  - / Find Used Colors: Make a list of the colors used by those neighbors.
  - / Assign Smallest Available Color: Assign the current vertex the smallest index
    color that has not been used by any of its neighbors.
+ / Repeat: Continue until all vertices have been assigned a color.

#align(center, img("assets/gcol.heic", width: auto))

#pagebreak()

= BRANCH AND BOUND

Branch and bound algorithms are used to find the optimal solution for combinatory,
discrete, and general mathematical optimization problems.

- / Branching: The main problem is broken into smaller subproblems, forming a
    tree-like structure where each node represents a partial solution.
- / Bounding: For each node, the algorithm computes an upper or lower bound on the
    best possible solution within that subproblem. If this bound is worse than the
    current best-known solution, the node is pruned (i.e., not explored further).
- / Pruning: By eliminating branches that cannot yield better solutions than the
    current best, the algorithm reduces the number of computations, enhancing
    efficiency.

This process continues until the best solution is found or all branches have been
explored.

Branch and bound is an effective solution to some problems, which we have already
discussed. We'll discuss all such cases where branching and binding are appropriate
in this section.

It is appropriate to use a branch and bound approach if the given problem is discrete
optimization. Discrete optimization refers to problems in which the variables belong
to the discrete set. Examples of such problems include 0-1 Integer Programming and
Network Flow problems. When it comes to combinatory optimization problems, branch and
bound work well. An optimization problem is optimized by combinatory optimization by
finding its maximum or minimum based on its objective function. The combinatory
optimization problems include Boolean Satisfiability and Integer Linear Programming.

#pagebreak()

== FIFO Approach (Queue)

#grid(
  columns: (45%, 5%, 45%),
  align: (auto, horizon, auto),
  gutter: 0pt,
  img("assets/fifo1.png"), sym.arrow, img("assets/fifo2.png"),
  [], sym.arrow.bl, [],
  img("assets/fifo3.png"), sym.arrow, img("assets/fifo4.png"),
  [], sym.arrow.bl, [],
  img("assets/fifo5.png"), sym.arrow, img("assets/fifo6.png"),
  [], sym.arrow.bl, [],
  img("assets/fifo7.png"),
)

== LIFO Approach (Stack)

#grid(
  columns: (45%, 5%, 45%),
  align: (auto, horizon, auto),
  gutter: 0pt,
  img("assets/lifo1.png"), sym.arrow, img("assets/lifo2.png"),
  [], sym.arrow.bl, [],
  img("assets/lifo3.png"), sym.arrow, img("assets/lifo4.png"),
  [], sym.arrow.bl, [],
  img("assets/lifo5.png"), sym.arrow, align(center + horizon, text(2em, sym.dots)),
)

== Least Cost Branch and Bound Approach (LCBB)

In this technique, nodes are explored based on their costs, the cost of the node can
be defined using the problem and with the help of the given problem, we can define
the cost function. Once the cost function is defined, we can define the cost of the
node.

Now, Consider a node whose cost has been determined. If this value is greater than
the upper bound ($U$), this node or its children will not be able to give a solution.
As a result, we can kill this node and not explore its further branches. As a result,
this method prevents us from exploring cases that are not worth it, which makes it
more efficient for us.

#grid(
  columns: (47%, 5%, 47%),
  align: (auto, horizon, auto),
  img("assets/lcbb1.png"), sym.arrow, img("assets/lcbb2.png"),
)

== Job Sequencing With Deadline

$
       k & = "currently selected job number" \
       U & = sum_(i=1)^n p_i - p_k \
  hat(c) & = sum_(i=1)^k p_i \
$




#pagebreak()

= COMPLEXITY CLASSES

#let reducible = $attach(lt.eq, br: P)$

- / P: The P in the P class stands for `Polynomial Time`. It is the collection of
    decision problems that can be solved by a deterministic machine in polynomial
    time.
    - Multiplication
- / NP: The NP in NP class stands for `Non-deterministic Polynomial Time`. It is the
    collection of decision problems that can be solved by a non-deterministic machine
    in polynomial time or can be verified in polynomial time.
- / NP-Hard: An NP-Hard problem is at least as hard as the hardest problem in NP and
    it is a class of problems such that every problem in NP reduces to NP-Hard.
    - Subset sum problem
    - Minimum vertex cover
    - Graph coloring
    - Halting Problem
- / NP-Complete: A problem is NP-complete if it is both NP and NP-Hard. NP-complete
    problems are the hard problems in NP.
    - Boolean satisfiability problem (SAT)
    - Knapsack problem
    - Subset sum problem
    - Graph coloring problem
    - Sudoku

#align(center, img("assets/complexity.svg", width: 70%))

== Deterministic vs Non-Deterministic Algorithm

```py
j = input()

if A[j] == x:
    write(j)
    success()

failure()
```

#table(
  columns: 2,
  align: (auto, auto),
  table.header([Deterministic Algorithm], [Non-deterministic Algorithm]),

  [A deterministic algorithm is one whose behavior is completely determined by its
    inputs and the sequence of its instructions],
  [A non-deterministic algorithm is one in which the outcome cannot be predicted with
    certainty, even if the inputs are known],

  [For a particular input, the computer will give always the same output],
  [For a particular input the computer may give different outputs on different
    execution],

  [Can determine the next step of execution],
  [Cannot determine the next step of execution due to more than one path the
    algorithm can take],

  [Operation are uniquely defined], [Operation are not uniquely defined],

  [Deterministic algorithms usually have a well-defined worst-case time complexity],
  [Time complexity of non-deterministic algorithms is often described in terms of
    expected running time],

  [Deterministic algorithms usually provide precise solutions to problems],
  [non-deterministic algorithms often provide approximate solutions to the problems],

  [Deterministic algorithms are commonly used in applications where precision is
    critical, such as in cryptography, numerical analysis, and computer graphics],
  [Non-deterministic algorithms are often used in applications where finding an exact
    solution is difficult or impractical, such as in artificial intelligence, machine
    learning, and optimization problems],

  [Examples of deterministic algorithms include sorting algorithms like bubble sort,
    insertion sort, and selection sort, as well as many numerical algorithms],
  [Examples of non-deterministic algorithms include probabilistic algorithms like
    Monte Carlo methods, genetic algorithms, and simulated annealing],
)
