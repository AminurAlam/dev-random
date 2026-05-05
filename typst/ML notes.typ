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

+ find euclidian dist \
  $x = sqrt((x - x_i)^2 + (y - y_i)^2)$
+ sort by dist
+ select K classes
+ take their weighted avg
+ assign that class

== Naive Bayes
$
  P(Y|X_1, X_2, dots, X_n) & = P(Y) product_(i=1)^n P(X_i|Y)/P(X_i) \
  P(Y|X_1, X_2, dots, X_n) & prop P(Y) product_(i=1)^n P(X_i|Y) \
                  P(X_i|Y) & = (P(Y|X_i) P(X_i)) / P(Y) \
$

+ find $P(Y="Yes")$ and $P(Y="No")$
+ find conditional prob of $X_1, X_2, dots$
+ put values in the above formula

== Decision Tree [TODO]

ENTROPY:
$ E_D_i = - display(sumin P_i log_2(P_i)) $

INFORMATION GAIN:
$ I G(X) & = display(sum_(i=1)^k (abs(D_i)/abs(D) E_D_i) - E_D) $

#box(stroke: 10pt, inset: 10pt, radius: 10pt, image("assets/DT1.png"))

#pagebreak()

= CLUSTERING

== K-Means Clustering [TODO]

#pagebreak()

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

3. eigenvalues

$
  0 & = "det"(S - lambda I) \
  0 & = det(
        "Cov"(x_1, x_1) - lambda, "Cov"(x_1, x_2);
        "Cov"(x_2, x_1), "Cov"(x_2, x_2) - lambda
      ) \
  0 & = a lambda^2 + b lambda + c
$

calculate roots of the equation above to get $lambda_1$ and $lambda_2$

4. find eigenvectors

$
          U & = mat(u_1; u_2) \
  mat(0; 0) & = (S - lambda I) U \
            & = mat(
                align: #left,
                a - lambda, b;
                b, c - lambda
              ) mat(u_1; u_2) \
            & = mat(
                align: #left,
                (a - lambda) u_1, b u_2;
                b u_1, (c - lambda) u_2
              ) \
$

we will get two equations and can use any one of them to get the eigenvectors

$
  a u_1 - b u_2 & = 0 \
          a u_1 & = b u_2 \
          u_1/b & = u_2 / a
$

let, $u_1/b & = u_2 / a = t$

$
          u_1 & = a t, u_2 = b t \
          u_1 & = a, u_2 = b "  " ("assuming" t = 0) \
  therefore U & = mat(a; b)
$

5. find unit eigenvector

substitute the value of lambda with the bigger one between $lambda_1$ and $lambda_2$

$
  norm(U) & = sqrt(a^2 + b^2) \
      e_1 & = mat(a / norm(U); b / norm(U)) \
$

6. find first principal of components

$
  e_1^T mat(X_(1k) - dash(X_1); X_(2k) - dash(X_2))
$

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

#pagebreak()

= CORRELATION BASED FILTER METHOD

In machine learning, having too many features (variables) can make your model slow,
prone to overfitting, and difficult to interpret. Feature selection is the process of
choosing the most useful features and discarding the rest. The correlation-based
filter method is a technique that evaluates the statistical relationship between
features and the target variable, as well as between the features themselves,
completely independently of any specific machine learning algorithm.

It relies primarily on the Pearson Correlation Coefficient ($r$), which measures the
linear relationship between two continuous variables. The value of $r$ ranges from -1
to 1:

- $r = 1$: Perfect positive correlation.
- $r = - 1$: Perfect negative correlation.
- $r = 0$: No linear correlation.

== Feature-Target Correlation (Relevance)

You want features that have a strong relationship with the target variable you are
trying to predict. If a feature\'s absolute correlation with the target is close to
0, it likely won\'t help the model much and can be filtered out.

== Feature-Feature Correlation (Redundancy/Collinearity)

You do not want features that are highly correlated with each other. If two features
are highly correlated, they contain essentially the same information. Keeping both
doesn\'t add new predictive power and can destabilize some models.

== Example: Predicting House Prices

Imagine we want to build a model to predict House Price (our Target variable) using
four features:

- Square Footage vs. Price: 0.85 (Very Strong)
- Distance to Center vs. Price: 0.80 (Very Strong)
- Number of Bedrooms vs. Price: 0.75 (Strong)
- Age of House vs. Price: 0.60 (Moderate)

Redundancy (Feature Correlation):

- Square Footage vs. Number of Bedrooms: 0.90 (Highly Correlated)

Because "Square Footage" and "Number of Bedrooms" move together so closely (bigger
houses almost always have more bedrooms), they are redundant. If we set a
collinearity threshold of 0.85, we must drop one. Since Square Footage has a higher
correlation with Price (0.85 vs 0.75), we keep Square Footage and drop Number of
Bedrooms.

Final Selected Features: Square Footage and Distance to City Center.
