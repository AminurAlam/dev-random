#import "snippets/note.typ": *
#import "snippets/infobox.typ": infobox
#show: template.with("Machine Learning")

#pagebreak()

#let det = math.mat.with(delim: "|", align: left)
#let datatable = table(
  columns: (10%, 10%, auto, auto),
  $x_1$, $x_2$, $x_1 - dash(x_1)$, $x_2 - dash(x_2)$,
  $a$, $p$, $a - dash(x_1)$, $p - dash(x_2)$,
  $b$, $q$, $b - dash(x_1)$, $q - dash(x_2)$,
  $c$, $r$, $c - dash(x_1)$, $r - dash(x_2)$,
  $dots$, $dots$, $$, $$,
)



= Info
== Variance and Covariance

#datatable

$
         "Var"(x) & = 1 / (n - 1) sumin (x_(i) - dash(x))^2 \
  "Cov"(x_1, x_2) & = 1 / (n - 1) sumin (x_(1i) - dash(x_1))(x_(2i) - dash(x_2)) \
$

== Determinants

$
  det(a, b; c, d) & = a d - b c \
  det(a, b, c; d, e, f; g, h, i) & = a det(e, f; h, i) - b det(d, f; g, i) + c det(d, e; g, h)
$

== Quadratic Roots

$ x = display((- b plus.minus sqrt(b^2 - 4 a c)) / (2 a)) $

#pagebreak()

= Classifiers

== KNN
== Naive Bayes
== Decision Tree

= Clustering
== K-Means Clustering

= PCA

// https://www.youtube.com/watch?v=ZtS6sQUAh0c

1. Standardize the Data

$display(x_i - dash(x_i))$

#datatable

2. Calculate Covariance Matrix

$
  S = mat(
    "Cov"(x_1, x_1), "Cov"(x_1, x_2);
    "Cov"(x_2, x_1), "Cov"(x_2, x_2)
  )
$

3. Eigen values


$
  0 & = "det"(S - lambda I) \
  0 & = det(
        "Cov"(x_1, x_1) - lambda, "Cov"(x_1, x_2);
        "Cov"(x_2, x_1), "Cov"(x_2, x_2) - lambda
      ) \
$

#pagebreak()

= Regression
== Linear Regression

$y = a x + b$
- / x: independent var
- / y: dependent var
- / a: slope
- / b: intercept

STEPS:

$
   dash(x) & = 1/n sumin x_i \
   dash(y) & = 1/n sumin y_i \
  "Var"(x) & = 1 / (n - 1) sumin (x_(i) - dash(x))^2 \
  "Cov"(x) & = 1 / (n - 1) sumin (x_i - dash(x))(y_i - dash(y)) \
         b & = "Cov"(x,y) / "Var"(x) \
         a & = dash(y) - b dash(x) \
$
