#import "snippets/note.typ": *
#show: template.with("AI")

#pagebreak()

= LINEAR REGRESSION

The goal of linear regression is to find a straight line that minimizes the error
(the difference) between the observed data points and the predicted values. This line
helps us predict the dependent variable for new, unseen data.

== Line Function
$
  hat(y) & = m x + c                        &             "[2D]" \
  hat(y) & = w_0 + w_1 x_1 + w_2 x_2 + dots &            "[n-D]" \
         & = w_0 + sumin w_i x_i \
         & = w_0 + w^(T)x \
         & = w^(T)x                         & "assuming" x_0 = 1 \
$

== Objective Function
$
  "total loss" & = display(sumin (y - hat(y))^2) \
$
we need to minimize total loss to make the line fit better
$
  argmin & = sumin (y - hat(y))^2 \
         & = sumin (y - w^"T"x)^2        && "[SE]" \
         & = 1/"2n" sumin (y - w^"T"x)^2 && "[MSE]" \
$

#figure(img("assets/linear.svg", width: auto))

== Gradient Descent

$"weight" = w \ "loss" = L(w)$
$
  Delta L & = (delta L(w))/(delta w) \
          & = (delta sum (y - hat(y))^2)/(delta w) \
          & = sumin (delta (y - w^"T"x)^2)/(delta w) \
          & = sumin 2 (y - w^"T"x) (-x) \
          & = sumin -2x (y - w^"T"x) \
          & = 1/n sumin -x (y - w^"T"x) "    [MSE]" \
$$
  w^i_j & = w^(i-1)_j - limits(Delta)_w_j L \
  & = w^(i-1)_j - [ 1/n sumin -x (y - w_j ""^"T"x) ] \
  & = w^(i-1)_j - alpha [ 1/n sumin -x (y - w_j ""^"T"x) ] "  (with learning rate)" \
$

#figure(img("assets/linear.webp", width: 80%))

#pagebreak()

= LOGISTIC REGRESSION

distance of point $i$ from line: $display(d_i = (w^"T"x_i)/norm(w) approx w^"T"x_i)$

classification of point $i$: $y_i$

To maximize our result we will need $z_i = y_i w^"T"x_i$ to be +ve is most cases

OBJECTIVE FUNCTION:
$
  argmax & = sumin 1 / (1 + e^(- y_i w^"T"x_i)) \
  argmax & = sumin 1 / (1 + e^(-z_i)) \
  argmax & = - sumin log(1 + e^(-z_i)) \
  argmin & = sumin log(1 + e^(-z_i)) \
$

REGULARIZATION: \
to minimize loss $e^(-z) = 0 " " => " " -z = infinity$, this leads to overfittig \

we use Regularization to fix this
$ argmin & = sumin log(1 + e^(-z)) + lambda norm(w) $

TYPES:
- Binomial Logistic Regression
- Multinomial Logistic Regression
- Ordinal Logistic Regression

#pagebreak()

= SVM

Objective is to maximize the distance between classes
+ find convex polygon/convex hull of both classes
+ find shortest dist bw them
+ bisect it to find hyperplane

MARGIN MAXIMIZATION PROBLEM:

optimization equation when all points are on either side of margin \
i.e. $"  " y_1 (w^(T)x_i + b) >= 1 "  " forall i$
$
  argmax & = (m_1 - m_2) / sqrt(a^2 + b^2 + c^2) = (1-(-1)) / norm(w) & = 2 / norm(w) \
  argmin & = norm(w) / 2
$

optimization equation when some points are mixed
$ argmin & = norm(w) / 2 + C sumin zeta_i "  " forall i \ $

$C "or" 1/lambda$ is a regularization parameter that controls the trade-off between
margin maximization and penalty for misclassifications.

$zeta_i$ are slack variables that represent the degree of violation of the margin by
each data point.

== Stochastic Gradient Descent
The problem with GD is that converging to a local minimum takes extensive time and
determining a global minimum is not guaranteed.

SGD is an iterative method often used for machine learning, optimizing the gradient
descent. In SGD, the user initializes the weights and the process updates the weight,
during each search once a random weight vector is picked. The gradient descent is a
strategy that searches through a large or infinite hypothesis space whenever

SGD is a simple yet very efficient approach to fitting linear classifiers and
regressors such as SVM and Logistic Regression.

#grid(
  columns: 2,
  img("assets/gd.png"), img("assets/sgd.png"),
)

#pagebreak()

= NAIVE BAYES

Naive Bayes methods are a set of supervised learning algorithms based on applying
Bayes' theorem with the "naive" assumption of conditional independence between every
pair of features given the value of the class variable.

Naive assumption: $P(x_1, x_2, dots, x_n) = display(product_(i=1)^n P(x_i))$

FORMULA:
$
  P(Y|X_1, X_2, dots, X_n) & = (product_(i=1)^n P(X_i|Y)P(Y)) / P(X)
$

PROOF:
$
  P(Y|X) & = (P(X|Y)P(Y)) / P(X)
$
$
  "we know that:   " P(A|B) = P(A inter B) / P(B)
$
$
  "RHS" & = (P(X|Y)P(Y)) / P(X) \
        & = ((P(X inter Y)/cancel(P(Y)))cancel(P(Y))) / P(X) \
        & = P(X inter Y) / P(X) \
        & = P(Y|X) \
        & = "LHS"
$

#pagebreak()

= ANN

== Activation Functions:
$
       "ReLu"(x) & = cases(x "  " x>0, 0 "  " x≤0) \
        sigma(x) & = display(1/(1+e^(-x))) \
       "tanh"(x) & = (e^x - e^(-x))/(e^x + e^(-x)) \
  "softmax"(x_i) & = (e^(x_i))/(sum_j e^(x_j))
$

LOSS:
$
  L & = sumin (y_i - hat(y_i))^2 \
  limits(Delta)_w L & = [(delta L)/(delta w_1), (delta L)/(delta w_2)]^T \
  (delta L)/(delta w_1) & = (delta L)/(delta f) dot (delta f)/(delta w_1) \
  & = sumin -2(y_i - f(w^"T" x_1)) dot (delta w^"T" x_i)/(delta w_i) \
  & = sumin -2(y_i - f(w^"T" x_1)) dot (1 times x_i + 0 times x_i) \
  & = sumin -2 x_i (y_i - f(w^"T" x_1)) \
  limits(Delta)_w L & = [sumin -2 x_i (y_i - f(w^"T" x_1)) ,0]^T \
$

BACK PROPAGATION:
#let w111 = $w^1_(1 1)$
$
                  "loss" & = (y-hat(y))^2 \
               w^1_(1 1) & = w^1_(1 1) - eta((delta L)/(delta w111)) \
  (delta L)/(delta w111) & = (delta L)/(delta f_31) dot (delta f_31)/(delta w111) \
                         & = -2(y-f_31) dot (delta f_31)/(delta w111) \
                         & = -2(y-f_31) dot [
                             ((delta f_31)/(delta f_21) dot (delta f_21)/(delta f_11) dot (delta f_11)/(delta w111)) +
                             ((delta f_31)/(delta f_22) dot (delta f_22)/(delta f_11) dot (delta f_11)/(delta w111))
                           ] \
                         & = -2(y-f_31) dot (delta f_11)/(delta w111) dot [
                             ((delta f_31)/(delta f_21) dot (delta f_21)/(delta f_11)) +
                             ((delta f_31)/(delta f_22) dot (delta f_22)/(delta f_11))
                           ] \
                         & = dots
$

#pagebreak()

= KNN

STEPS:
+ define $k$ (usually odd)
+ find $k$ number of nearest neighbours
+ take weighted voting of the neighbours
+ assign that class to the data point

#figure(img("assets/knn.webp", width: 80%))
#figure(img("assets/knn_frame.png", width: auto))

#pagebreak()

= DECISION TREE

/ entropy:
$ E_D_i = - display(sumin P_i log_2(P_i)) $

/ information gain:
$ I G(X) & = display(sum_(i=1)^k (abs(D_i)/abs(D) E_D_i) - E_D) $


= NODE CLUSTERING

#pagebreak()

= SCORE

== Confusion Matrix

/ False Positive (FP): The actual outcome was negative but predicted as positive.
/ False Negative (FN): The actual outcome was positive but predicted as negative.

#align(center, grid(
  columns: 2,
  column-gutter: 60pt,
  row-gutter: 10pt,
  align: auto,
  [BINARY TRUTH TABLE:], [MULTI CLASS TRUTH TABLE:],
  table(
    columns: 3,
    inset: 12pt,
    table.header([], table.cell(colspan: 2, align: center, [Predicted])),
    table.cell(rowspan: 2, align: horizon, rotate(-90deg, reflow: true)[Actual]),
    table.cell(fill: green.lighten(60%))[TP],
    table.cell(fill: red.lighten(60%))[FN],
    table.cell(fill: red.lighten(60%))[FP],
    table.cell(fill: green.lighten(60%))[TN],
  ),
  table(
    columns: 5,
    inset: 8pt,
    table.header([], table.cell(colspan: 4, align: center, [Predicted])),
    table.cell(rowspan: 4, align: horizon, rotate(-90deg, reflow: true)[Actual]),
    table.cell(fill: green.lighten(60%))[TP],
    table.cell(fill: red.lighten(60%))[FN],
    table.cell(fill: red.lighten(60%))[FN],
    table.cell(fill: red.lighten(60%))[FN],
    table.cell(fill: red.lighten(60%))[FP], [TP], [TP], [TP],
    table.cell(fill: red.lighten(60%))[FP], [TP], [TP], [TP],
    table.cell(fill: red.lighten(60%))[FP], [TP], [TP], [TP],
  ),
))

$
   "Accuracy" & = (T P + T N)/(T P + T N + F P + F N) \
  "Precision" & = (T P)/(T P + F P) \
     "Recall" & = (T P)/(T P + F N) \
         "F1" & = 2 slash.big (1/"Precision" + 1/"Recall") \
$

#pagebreak()

= GENETIC ALGORITHM

// #img("assets/genetic.svg", height: 50%)

== 1. Population Initialization
== 2. Fitness Assessment
== 3. Parent Selection

- / Roulette Wheel: $P(x_i) = display(f(x_i)/(sum f(x_i)))$
- / Stochastic Universal Sampling: multiple equally spaced pointers to select
    individuals from the population
- / rank:
- / tournament: randomly select `k` chromosomes -> select best chromosomes

== 4. Crossover

- / One-point crossover: A point on both parents' chromosomes is picked randomly, and
    designated a 'crossover point'. Bits to the right of that point are swapped
    between the two parent chromosomes. This results in two offspring, each carrying
    some genetic information from both parents.
- / Two-point and k-point crossover: In two-point crossover, two crossover points are
    picked randomly from the parent chromosomes. The bits in between the two points
    are swapped between the parent organisms.
- / Uniform crossover: In uniform crossover, typically, each bit is chosen from
    either parent with equal probability. Other mixing ratios are sometimes used,
    resulting in offspring which inherit more genetic information from one parent
    than the other. In a uniform crossover, we don’t divide the chromosome into
    segments, rather we treat each gene separately. In this, we essentially flip a
    coin for each chromosome to decide whether or not it will be included in the
    off-spring.

#align(center, grid(
  columns: 2,
  gutter: 0pt,
  img("assets/OnePointCrossover.svg", width: 75%),
  img("assets/TwoPointCrossover.svg", width: 75%),
))


== 5. Mutation
== 6. Terminate?

// #grid(
//   columns: 2,
//   img("assets/singleCrossover.png", width: auto),
//   img("assets/twopointCrossover.png", width: auto),
// )
//
// #align(center, img("assets/unifromCrossover.png", width: 60%))

#pagebreak()

= SIMULATED ANNEALING

Simulated annealing (SA) is a probabilistic optimization algorithm inspired by the
metallurgical annealing process, which reduces defects in a material by controlling
the cooling rate to achieve a stable state. The core concept of SA is to allow
algorithms to escape the constraints of local optima by occasionally accepting
suboptimal solutions. This characteristic enables SA to find near-global optima in
large and complex search spaces. During the convergence process, the probability of
accepting a suboptimal solution diminishes over time.

SA is widely applied in diverse fields such as scheduling, machine learning, and
engineering design, and is particularly effective for combinatorial optimization
problems that are challenging for deterministic methods. Today, it remains a powerful
heuristic often combined with other optimization techniques to enhance performance in
challenging problem spaces.

The basic steps of the SA algorithm are as follows:

- Begin with an initial solution $C = C_"init"$ and an initial temperature $T_"max"$
- Generate a new solution $N$ in the neighborhood of the current solution $C$.
- Calculate the difference in objective values $Delta E = f(N) - f(C)$, where $f(x)$
  is the objective function.
- If $0 < Delta E$ (i.e., $N$ is a better solution), accept $N$ as the current
  solution.
- If $Delta E < 0$, accept $N$ with a probability $P = e^(-Delta E slash T)$.
- Update the temperature $T$ (typically $T = alpha dot T$)
- Stop the process when the temperature falls below a minimum threshold, or after a
  predefined number of iterations. The best solution encountered is returned as the
  approximate optimum.

ALGORITHM:

$\
"  "C = C_"init" \
"  ""for" T = T_max " to " T_min \
"       "N = "Next"(C) \
"       "Delta E = f(N) - f(C) \
"       ""if" 0 < Delta E "then" \
"             "C = N \
"       ""else" "if" "rand"(0, 1) < e^(-Delta E slash T) "then" \
"             "C = N$

#figure(img("assets/sa.jpg", width: 60%))

#pagebreak()

= ANT COLONY OPTIMIZATION

ALGORITHM:
- Ants navigate from nest to food source. Ants are blind!
- Shortest path is discovered via pheromone trails.
- Each ant moves at random
- Pheromone is deposited on path
- More pheromone on path increases probability of path being followed

#pagebreak()

= PARTICLE SWARM OPTIMIZATION

Particle Swarm Optimization (PSO) is inspired by nature and groups or swarms of
natural creatures. It uses multiple "particles" distributed across a solution space
to slowly converge upon a global, optimized solution. This algorithm does not require
calculation of the function’s gradient or slope, instead using simple weights and the
contribution of the rest of the swarm to provide a fitness value to leading to a
technique dependent only on simple calculations and a number of starting points.

The biological analogy for a PSO algorithm is a flock of birds, a school of fish, or
a colony of ants trying to find a food resource. Each animal, or particle, is an
independent entity that is conducting its own search routine for an optimal result.
However, the particles will also be influenced and guided by motions of the larger
swarm. The results any particle has already seen, as well as the influence of the
larger swarm helps all the particles converge to an optimal solution.

$
             X_i^t & = [x_i^t, y_i^t, z_i^t, ...] \
  arrow(X)_i^(t+1) & = arrow(X)_i^t + arrow(V)_i^(t+1) \
  arrow(V)_i^(t+1) & = w arrow(V)_i^t +
                     C_1 r_1 (arrow(P)_i^t - arrow(X)_i^t) +
                     C_2 r_2 (arrow(G)^t - arrow(X)_i^t) \
$

$
               w arrow(V)_i^t: & "inertia" \
  arrow(P)_i^t - arrow(X)_i^t: & "cognitive" \
  arrow(G)_i^t - arrow(X)_i^t: & "social" \
                     C_1, C_2: & "constants" \
                     r_1, r_2: & "random" \
$

#figure(img("assets/pso_flow.png", width: 60%))

ALGORITHM:
```hs
INITIALIZE all control parameters
INITIALIZE population
WHILE NOT converged
    FOR EACH particle
        CLACULATE fitness
        UPDATE pbest
        UPDATE gbest
    UPDATE inertia
    FOR EACH particle
        UPDATE velocity (v)
        UPDATE position (x)
RETURN gbest
```

#grid(
  columns: 3,
  img("assets/pso_0.png"), img("assets/pso_1.png"), img("assets/pso_2.png"),

  img("assets/pso_3.png"), img("assets/pso_4.png"), img("assets/pso_5.png"),
  // align(horizon + center, text(2em, math.dots)),
  // align(horizon + center, text(2em, math.dots)),
  // img("assets/pso_25.png"),

  [],
)

#pagebreak()

= FUZZY SET

MEMBERSHIP FUNCTION:
$
        mu(x) & in [0, 1] \
              \
  "fuzzy set" & = {(x, mu(x)) | x in U and 0 <= mu(x) <= 1} \
              & = sum_(x in U) mu(x)/x \
              & = { mu(x_1)/x_1 + mu(x_2)/x_2 + mu(x_3)/x_3 + dots + mu(x_n)/x_n } \
$

OPERATIONS:
$
  A union B & = max" "{" "mu_A (x)," "mu_B (x)" "} \
  A inter B & = min" "{" "mu_A (x)," "mu_B (x)" "} \
      not A & = { 1 - mu_A (x) } \
$

PREDEFINED MEMBERSHIP FUNCTIONS:
#grid(
  columns: 2,
  column-gutter: 60pt,
  row-gutter: 10pt,
  align: left,
  [Triangular:], [Trapezoidal:],
  $
    mu(x) = cases(
      gap: #12pt,
      0 & "  " x<a,
      display((x-a)/(m-a)) & "  " a<=x<=m,
      display((b-x)/(b-m)) & "  " m<=x<=b,
      0 & "  " b<=x,
    )
  $,
  $
    mu(x) = cases(
      gap: #12pt,
      0 & "  " x<a,
      display((x-a)/(m-a)) & "  " a<=x<=m,
      1 & "  " m<x<n,
      display((b-x)/(b-n)) & "  " m<=x<=b,
      0 & "  " b<x,
    )
  $,
)


== Fuzzy Relation

$
     A times B & = { (x, y), mu_(A times B) (x, y ) | (x, y ) in A times B } \
             R & = { (mu_R (x, y )) / (x times y) | (x, y ) in A times B } \
  mu_R (x, y ) & = min {" "mu_A (x)," "mu_B (y)" "} \
$

EXAMPLE:
$
          A & = {0.3/m + 0.7/n} \
          B & = {0.5/p + 0.1/q + 0.8/r} \
  A times B & = mat(
                0.3/(p times m) + 0.1/(q times m) + 0.3/(r times m);
                0.5/(p times n) + 0.1/(q times n) + 0.7/(r times n);
              ) \
$

OPERATIONS:
$
   R_1 union R_2 & = max {" "mu_R_1 (x,y)," "mu_R_2 (x,y)" "} \
   R_1 inter R_2 & = min {" "mu_R_1 (x,y)," "mu_R_2 (x,y)" "} \
           not R & = 1 - mu_R (x,y) \
  R_1 subset R_2 & = mu_R_1 (x,y) <= mu_R_2 (x,y) \
$

INFERENCE:
$
  C & = (A times B) union (dash(A) times B) \
  C & = max {" "min{ mu_A (x), mu_B (y) }, " " 1 - mu_A (x) " "} \
$

#figure(img("assets/mamdani.png", width: 80%))

#figure(img("assets/fuzzy_inference.png", width: auto))

#pagebreak()

= FUZZY LOGIC

- AND
- OR
- NOT
- Implies: $not a or b$

== Well Formed Formula

- / Tautology: always true \
    $a b + not a + not b$
- / Contradiction: always false \
    $not a b (a + b)$
- / Consistent: all elements are same

== Defuzzyfication
- #math.alpha / #math.lambda cut: $A_lambda & = { x | mu_A (x) >= lambda }$
- maximum effort
- weighted average
