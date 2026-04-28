#import "snippets/note.typ": *
#import "snippets/infobox.typ": infobox
#show: template.with("Machine Learning")

#pagebreak()

= PCA

// https://www.youtube.com/watch?v=ZtS6sQUAh0c

1. Standardize the Data

$display(x - mu)$

#table(
  columns: (10%, 10%, auto, auto),
  $x_1$, $x_2$, $x_1 - dash(x_1)$, $x_2 - dash(x_2)$,
  $a$, $p$, $a - dash(x_1)$, $p - dash(x_2)$,
  $b$, $q$, $b - dash(x_1)$, $q - dash(x_2)$,
  $c$, $r$, $c - dash(x_1)$, $r - dash(x_2)$,
  $dots$, $dots$, $$, $$,
)

2. Calculate Covariance Matrix

$"Cov"(x_1, x_2) = 1 / (n - 1) sumin (x_(1i) - dash(x_1))(x_(2i) - dash(x_2))$

$
  S = mat(
    "Cov"(x_1, x_1), "Cov"(x_1, x_2);
    "Cov"(x_2, x_1), "Cov"(x_2, x_2)
  )
$

3. Eigen values

#let det = math.mat.with(delim: "|", align: left)

$
  0 & = "det"(S - lambda I) \
  0 & = det(
        "Cov"(x_1, x_1) - lambda, "Cov"(x_1, x_2);
        "Cov"(x_2, x_1), "Cov"(x_2, x_2) - lambda
      ) \
$

#infobox(
  title: "determinants:",
  $
    det(a, b; c, d) & = a d - b c \
    det(a, b, c; d, e, f; g, h, i) & = a det(e, f; h, i) - b det(d, f; g, i) + c det(d, e; g, h)
  $,
)

#infobox(
  title: "quadratic roots:",
  $x = display((- b plus.minus sqrt(b^2 - 4 a c)) / (2 a))$,
)
