#import "snippets/note.typ": *
#import "snippets/infobox.typ": infobox
#show: template.with("Machine Learning")

#pagebreak()

#let det = math.mat.with(delim: "|", align: left)
#let datatable = table(
  columns: (10%, 10%, auto, auto, auto),
  $x_1$,
  $x_2$,
  $x_1 - dash(x_1)$,
  $x_2 - dash(x_2)$,
  $(x_1 - dash(x_1))(x_2 - dash(x_2))$,

  $a$, $p$, $a - dash(x_1)$, $p - dash(x_2)$, $dots$,
  $b$, $q$, $b - dash(x_1)$, $q - dash(x_2)$, $dots$,
  $c$, $r$, $c - dash(x_1)$, $r - dash(x_2)$, $dots$,
  $dots$, $dots$, $dots$, $dots$, $dots$,
)



= INFO

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

= CLASSIFIERS

== KNN
== Naive Bayes
== Decision Tree

= CLUSTERING

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

4. TODO

#pagebreak()

= REGRESSION

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

#pagebreak()

= FEATURE SELECTION

== Filter Methods
Filter methods evaluate the relevance of features based only on their intrinsic
properties (like statistical characteristics), completely independent of any machine
learning algorithm.

You apply a statistical measure to assign a score to each feature. Features are
ranked, and you select the top-performing ones or remove those that fall below a
certain threshold before you ever touch a predictive model.

eg: Pearson correlation, Chi-square test, ANOVA, Information Gain, Variance
threshold.

PROS:
- / Fast and scalable: Because they don\'t involve training iterative models, they
    are computationally very cheap.
- / Algorithm agnostic: The selected features can be used with any machine learning
    model down the line.
- / Low risk of overfitting: They act strictly on the data\'s raw properties.

CONS:
- / Ignores feature interactions: A feature might seem useless on its own but be
    highly predictive when combined with another feature. Filter methods usually
    evaluate features in isolation and will miss this.
- / Not model-optimized: The selected features aren\'t tailored to get the absolute
    best performance out of the specific model you eventually plan to use.

== Wrapper Methods

Wrapper methods evaluate subsets of features by actually training and testing a
specific machine learning model on them. The model\'s resulting performance (e.g.,
accuracy or error rate) dictates which features are kept.

It treats feature selection as a search problem. It generates a subset of features,
trains your chosen model on them, evaluates the performance, and then decides whether
to add or remove features before training again to see if the score improves.

eg: Forward Selection (starting with 0 features and adding the best ones
iteratively), Backward Elimination (starting with all features and removing the worst
ones iteratively), Recursive Feature Elimination (RFE).

PROS:
- / Captures feature interactions: Because it tests features together inside an
    actual model, it recognizes when variables work well as a team.
- / Highly accurate: It is explicitly optimized for the specific algorithm you are
    using, usually resulting in better final model performance.

CONS:
- / Computationally expensive: Training a new model for hundreds or thousands of
    different feature combinations is incredibly slow and resource-heavy, making it
    impractical for massive datasets.
- / High risk of overfitting: Because it fine-tunes the feature subset so closely to
    the training data and a specific model, it might capture noise and fail to
    generalize well to unseen data.

== Difference

#table(
  columns: 3,
  [Characteristic], [Filter Methods], [Wrapper Methods],

  [Evaluation basis],
  [Statistical properties of the data],
  [Predictive model performance],

  [Model Dependence],
  [Independent (Algorithm agnostic)],
  [Dependent (Tied to a specific model)],

  [Speed / Cost],
  [Very fast / Computationally cheap],
  [Very slow / Computationally expensive],

  [Best used for...],
  [High-dimensional data, initial screening],
  [Manageable datasets, maximizing accuracy],

  [Feature Interactions], [Usually ignored], [Captured effectively],
  [Risk of Overfitting], [Low], [High],
)
