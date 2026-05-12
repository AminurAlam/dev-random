#import "snippets/note.typ": *
#import "snippets/infobox.typ": infobox
#show: template.with("Machine Learning")

#pagebreak()

#let det = math.mat.with(delim: "|", align: left)
#let datatable(a, b) = table(
  columns: (10%, 10%, auto, auto, auto, auto),
  $#a$,
  $#b$,
  $#a - dash(#a)$,
  $#b - dash(#b)$,
  $(#a - dash(#a))^2$,
  $(#a - dash(#a))(#b - dash(#b))$,

  $a$, $p$, $a - dash(#a)$, $p - dash(#b)$, $dots$, $dots$,
  $b$, $q$, $b - dash(#a)$, $q - dash(#b)$, $dots$, $dots$,
  $c$, $r$, $c - dash(#a)$, $r - dash(#b)$, $dots$, $dots$,
  $dots$, $dots$, $dots$, $dots$, $dots$, $dots$,
  $sum$, $sum$, $$, $$, $sum$, $sum$,
)

= INFO

== Variance and Covariance

#datatable($x_1$, $x_2$)

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

== Mean of Grouped data

1. Direct Method

#table(
  columns: (auto, auto, 10%, auto),
  align: center,
  [Class Interval], $f_i$, $x_i$, $f_i x_i$,
  [00-10], [12], [5], [60],
  [10-20], [16], [15], [240],
  [20-30], [6], [25], [150],
  [30-40], [7], [35], [245],
  [40-50], [9], [45], [405],
  [], $sum = 50$, [], $sum = 1100$,
)

$ mu = (sum f_i x_i)/(sum f_i) $

2. Assumed - Mean Method

#table(
  columns: (auto, auto, 10%, auto, auto),
  align: center,
  [Class Interval], $f_i$, $x_i$, $d_i = x_i - a$, $f_i d_i$,
  [0-10], [7], [5], [-20], [-140],
  [10-20], [8], [15], [-10], [-80],
  [20-30], [12], [25], [0], [0],
  [30-40], [13], [35], [10], [130],
  [40-50], [10], [45], [20], [200],
  [], $sum = 50$, [], [], $sum = 100$,
)

$
  d_i & = x_i - a \
   mu & = (sum f_i d_i)/n + a \
$

3. Step deviation method

#table(
  columns: (auto, auto, 10%, auto, auto),
  align: center,
  [Class Interval], $f_i$, $x_i$, $u_i = (x_i - a) / h$, $f_i u_i$,
  [50-70], [18], [60], [-2], [-36],
  [70-90], [12], [80], [-1], [-12],
  [90-110], [13], [100], [0], [0],
  [110-130], [27], [120], [1], [27],
  [130-150], [8], [140], [2], [16],
  [150-170], [22], [160], [3], [66],
  [], $sum = 100$, [], [], $sum = 61$,
)

$
  u_i & = (x_i - a)/h \
   mu & = (sum f_i u_i)/n h + a \
$

#pagebreak()

= LINEAR REGRESSION

The goal of linear regression is to find a straight line that minimizes the error
(the difference) between the observed data points and the predicted values. This line
helps us predict the dependent variable for new, unseen data.

Linear Regression is a fundamental statistical and machine learning algorithm used to
model the relationship between a dependent variable (the target you want to predict)
and one or more independent variables (the features or predictors).

It works by fitting a straight "line of best fit" through the data points that
minimizes the distance between the line and the actual data (usually by minimizing
the sum of the squared residuals).

Simple Linear Regression uses one independent variable:
$y = beta_0 + beta_1 x + epsilon$ Multiple Linear Regression uses two or more
independent variables:
$y = beta_0 + beta_1 x_1 + beta_2 x_2 + dots + beta_n x_n + epsilon$

(Where $y$ is the predicted value, $beta_0$ is the y-intercept, $beta_1 dots beta_n$
are the coefficients, $x$ represents the independent variables, and $epsilon$ is the
error term).

#figure(image("assets/linear.png", width: 70%))

== Applications

- / Treand Line: A trend line represents a trend, the long-term movement in time
    series data after other components have been accounted for. It tells whether a
    particular data set (say GDP, oil prices or stock prices) have increased or
    decreased over the period of time.
- / Finance: The capital asset pricing model uses linear regression for analyzing
    risk of an investment and predicting future stock prices based on historical
    trends
- / Economics: it is used to predict consumption spending, investments, spending on
    imports, labor demand, and labor supply.
- / Environmental science: land use, infectious diseases, and air pollution. For
    example, linear regression can be used to predict the changing effects of car
    pollution.
- / Real Estate: Estimating the price of a house based on features like square
    footage, number of bedrooms, and age of the property.
- / Retail & Marketing: Forecasting future sales based on advertising spend,
    seasonality, and pricing changes.
- / Healthcare: Predicting the length of a hospital stay based on patient age,
    weight, and blood pressure, or understanding how the dosage of a medication
    affects recovery time.
- / Sports Analytics: Predicting a player's future performance based on their
    historical statistics and physical metrics.

== Advantages

- / Simplicity and Interpretability: It is highly transparent. The mathematical
    equation clearly shows how each independent variable affects the dependent
    variable (via the coefficients).
- / Efficiency: It is computationally inexpensive and fast to train, even on massive
    datasets.
- / Good Baseline: It serves as an excellent baseline model. If a simple linear
    regression solves your problem, you don't need a complex, resource-heavy neural
    network.
- / Less Overfitting: On smaller datasets with fewer dimensions, it is generally less
    prone to overfitting compared to complex, non-linear models (especially when
    combined with regularization techniques like Ridge or Lasso).
- / Wide Availability: in ML libraries and software.

== Disadvantages

- / The Linearity Assumption: Its biggest flaw is that it assumes a straight-line
    relationship between variables. If the underlying data pattern is curved or
    highly complex, linear regression will perform poorly (underfitting).
- / Sensitivity to Outliers: Because it relies on minimizing squared errors, a single
    extreme outlier can drastically pull the line of best fit in the wrong direction,
    ruining the model's accuracy.
- / Sensitive to multicollinearity: If your independent variables are highly
    correlated with each other (e.g., trying to predict house prices using both
    "square footage" and "number of rooms"), it confuses the model and makes the
    coefficients unstable and hard to interpret.
- / Assumes Independence: It assumes that the data points are independent of each
    other, making it less effective for sequential data like time-series (without
    specific modifications).
- / Complex Relationships: are hard to model in LR.

== Numerical

$y = a x + b$
- / x: independent var
- / y: dependent var
- / a: slope
- / b: intercept

STEPS:

#datatable($x_1$, $y_1$)

$
   dash(x) & = 1/n sumin x_i \
   dash(y) & = 1/n sumin y_i \
  "Var"(x) & = 1 / (n - 1) sumin (x_(i) - dash(x))^2 \
  "Cov"(x) & = 1 / (n - 1) sumin (x_i - dash(x))(y_i - dash(y)) \
         b & = "Cov"(x,y) / "Var"(x) \
         a & = dash(y) - b dash(x) \
$

#pagebreak()

= CLASSIFICATION: KNN

K-Nearest Neighbors (KNN) is a simple, supervised machine learning algorithm that can
be used for both classification (predicting a category) and regression (predicting a
continuous value).

Unlike algorithms that build a mathematical model, KNN is a "lazy learner." It
doesn't actually "learn" during a training phase; instead, it stores all the training
data. When it needs to make a prediction for a new, unseen data point, it calculates
its closest neighbors to make prediction.

== Applications

/ Recommendation Systems: Suggesting products, movies, or music based on what similar
  users (your "neighbors") have liked or purchased.
/ Spam Detection: Identifies spam emails by comparing new emails to known spam and
  non-spam examples.
/ Customer Segmentation: Grouping customers into distinct categories for targeted
  marketing based on similar purchasing behaviors.
/ Healthcare & Medicine: Predicting the likelihood of a patient having a specific
  disease by comparing their symptoms, age, and test results to historical records of
  similar patients.
/ Finance: Assessing credit risk or predicting loan defaults by comparing a new
  applicant's financial profile to past customers with similar profiles.
/ Pattern/Image Recognition: Identifying handwriting or classifying images by
  comparing the pixel data of a new image to a database of known images.
/ Speech Recognition: Matches spoken words to known patterns to convert them into
  text.

== Advantages

/ Simple and Intuitive: The core concept is incredibly easy to understand and
  implement. There is no complex mathematical model to interpret.
/ No Training Period: Because it is a lazy learner, there is zero computation time
  spent "training" the model. You just load the data and are ready to predict.
/ Naturally Handles Multi-Class Data: Unlike some algorithms that are strictly binary
  and need modifications to handle multiple categories, KNN can classify data into
  any number of classes effortlessly.
/ Non-Parametric: It makes no underlying assumptions about how the data is
  distributed (unlike Linear Regression, which assumes a straight line). This makes
  it highly adaptable to real-world data that doesn't follow strict mathematical
  rules.

== Disadvantages

/ Slow Prediction Phase: While training is instant, making a prediction is
  computationally expensive and slow. The algorithm must calculate the distance to
  every single point in the dataset for every new prediction.
/ High Memory Requirement: Because the model is the dataset, you have to store all
  your training data in memory. This becomes impractical with massive datasets.
/ Sensitive to the Scale of Data: If one feature is measured in millions (like
  income) and another in single digits (like age), the larger feature will completely
  dominate the distance calculation. Data must be normalized or standardized before
  using KNN.
/ The Curse of Dimensionality: KNN performs terribly when you have a high number of
  features (dimensions). As dimensions increase, the concept of "distance" breaks
  down, and data points become uniformly far away from each other.
/ Sensitive to Outliers and Noise: A few anomalous data points or mislabeled examples
  can easily throw off the "majority vote" if they happen to be near the new data
  point.

== Numerical

#table(
  inset: 10pt,
  columns: (10%, 10%, 15%, auto, 15%),
  $X_1$, $X_2$, [CLASS], $sqrt((dots)^2 + (dots)^2)$, [RANK],
  $5.3$, $3.7$, $A$, $0.608$, $1$,
  $7.2$, $3.0$, $B$, $2.02$, $3$,
  $5.1$, $3.8$, $A$, $0.707$, $2$,
  $dots$, $dots$, $dots$, $dots$, $dots$,
)

STEPS:
+ find euclidian dist \
  $d = sqrt((x - X_(1i))^2 + (y - X_(2i))^2)$
+ sort by dist
+ define $k$ (usually odd)
+ find $k$ number of nearest neighbours
+ take weighted voting of the neighbours
+ assign that class to the data point

#figure(image("assets/knn.webp", width: 80%))

#pagebreak()

= CLASSIFICATION: NAIVE BAYES

Naive Bayes methods are a set of supervised learning algorithms based on applying
Bayes' theorem with the "naive" assumption of conditional independence between every
pair of features given the value of the class variable.

The algorithm is called "naive" because it makes a massive assumption: it assumes
that every feature (independent variable) being used to predict the target class is
completely independent of all other features. In real life, features are rarely
completely independent, but the algorithm still performs surprisingly well despite
this naive assumption.

It calculates the probability of a data point belonging to a certain class based on
the combined probabilities of its features. The foundational formula (Bayes' Theorem)
is:

$ P(A|B) = display((P(B|A) dot P(A)) / P(B)) $

(Where $P(A|B)$ is the probability of class A given feature B, $P(B|A)$ is the
probability of feature B given class A, $P(A)$ is the prior probability of class A,
and $P(B)$ is the prior probability of feature B).

== Applications

/ Spam Filtering: The most classic use case. It calculates the probability that an
  email is "Spam" or "Not Spam" based on the frequency of certain trigger words
  (e.g., "lottery," "free," "urgent").
/ Sentiment Analysis: Analyzing social media posts, product reviews, or customer
  feedback to automatically classify the text as positive, negative, or neutral.
/ Document Categorization: Automatically sorting news articles, support tickets, or
  web pages into categories (e.g., Technology, Sports, Politics) based on the words
  they contain.
/ Medical Diagnosis: Calculating the probability of a patient having a specific
  disease given a set of independent symptoms.
/ Real-Time Prediction: Because the model evaluates probabilities using simple math
  rather than complex iterations, it is fast enough to make predictions on the fly in
  real-time systems.

== Advantages

/ Highly Scalable and Fast: It requires very little computational power. Both
  training the model and making predictions are incredibly fast, even with massive
  datasets.
/ Great for High-Dimensional Data: It excels when dealing with thousands of features,
  which is why it is the go-to baseline model for text classification.
/ Works Well with Less Data: If the assumption of independent features actually holds
  true (or is close enough), Naive Bayes needs less training data to perform well
  compared to models like Logistic Regression.
/ Handles Multi-Class Prediction easily: Like KNN, it can easily predict outcomes
  across multiple different classes, not just binary (Yes/No) outcomes.
/ Resilient to Irrelevant Features: If a feature has no correlation with the outcome,
  the probabilistic math naturally minimizes its impact.

== Disadvantages

/ The "Naive" Assumption: Its biggest flaw is assuming all features are independent.
  If you are predicting the price of a house, "number of bedrooms" and "square
  footage" are highly correlated, but Naive Bayes treats them as entirely unrelated.
/ The "Zero Frequency" Problem: If the model encounters a categorical feature in the
  testing data that it never saw during training (e.g., a new word in a spam email),
  it assigns a 0% probability to it. This zeroes out the entire calculation. (This is
  usually fixed using a mathematical tweak called Laplace Smoothing).
/ Poor Estimator of Exact Probabilities: While Naive Bayes is great at categorizing
  things (e.g., it correctly chooses Class A over Class B), the actual percentage
  probability it outputs (e.g., "I am 99.9% sure this is Class A") shouldn't be taken
  too seriously.
/ Continuous Variable Assumption: If you are using continuous data (like height,
  weight, or price), standard Naive Bayes (Gaussian) assumes that the data is
  distributed in a perfect bell curve (normal distribution). If your data is heavily
  skewed, the model's accuracy drops.

== Numerical

$
  P(Y|X_1, X_2, dots, X_n) & = P(Y) product_(i=1)^n P(X_i|Y)/P(X_i) \
  P(Y|X_1, X_2, dots, X_n) & prop P(Y) product_(i=1)^n P(X_i|Y) \
$

+ find $P(Y="Yes")$ and $P(Y="No")$
+ find conditional prob of $X_1, X_2, dots$
  #table(
    columns: 3,
    [Feature], $P(X_i|"Yes")$, $P(X_i|"No")$,
    $X_1 = dots$, $1 slash 4$, $2 slash 6$,
    $X_2 = dots$, $3 slash 4$, $1 slash 6$,
    $dots$, $dots$, $dots$,
  )
+ put values in the given formula
  $
    P("Yes"|X_1, X_2, dots) & = P("Yes") P(X_1|"Yes") P(X_2|"Yes") dots \
                            & = 4/10 times 1/4 times 3/4 times dots \
                            & = dots \
     P("No"|X_1, X_2, dots) & = P("No") P(X_1|"No") P(X_2|"No") dots \
                            & = 6/10 times 2/6 times 1/6 times dots \
                            & = dots \
  $
+ Compare $P("Yes"|X_1, X_2, dots)$ with $P("Yes"|X_1, X_2, dots)$ \
  and the bigger value wins

#pagebreak()

= CLASSIFICATION: DECISION TREE

A Decision Tree is a supervised machine learning algorithm used for both
classification and regression.

It builds a model in the shape of a flowchart or a tree. It works by continually
splitting the dataset into smaller and smaller subsets based on the most significant
features until it reaches a conclusion.

The structure consists of:

== Applications

Because they mimic human decision-making, Decision Trees are heavily used in fields
where transparency and logic are just as important as the prediction itself:

/ Credit Scoring & Loan Approval: Banks use them to determine if an applicant is
  high, medium, or low risk based on features like income, credit history, and
  employment status.
/ Healthcare & Triage: Assisting doctors in diagnosing a disease by walking through a
  series of symptoms (e.g., "Does the patient have a fever?" -\> "Is there a
  cough?").
/ Customer Churn Prediction: Identifying which customers are likely to cancel a
  subscription based on usage patterns, customer service interactions, and billing
  history.
/ Manufacturing: Diagnosing equipment failures by answering a sequence of questions
  about temperature readings, vibration levels, and operating hours.
/ Marketing: Determining which demographic segments are most likely to respond to a
  specific advertising campaign.

== Advantages

/ Highly Interpretable: It is one of the few "white box" algorithms. You can visually
  print out the tree and easily explain exactly why the model made a specific
  prediction to non-technical stakeholders.
/ Requires Minimal Data Prep: Unlike KNN or Linear Regression, Decision Trees do not
  require you to normalize or scale your data. They also naturally handle a mix of
  both numerical (e.g., age) and categorical (e.g., color) data.
/ Feature Selection is Built-in: The algorithm automatically places the most
  important features at the top of the tree, effectively ignoring useless or
  irrelevant data.
/ Non-Parametric: It makes no assumptions about the underlying distribution or
  structure of the data, making it highly flexible.

== Disadvantages

/ Highly Prone to Overfitting: This is its biggest weakness. If left unchecked, a
  decision tree will keep growing until it perfectly memorizes the training data
  (creating a leaf for almost every single data point), which makes it perform
  terribly on new, unseen data. (This is usually managed by "pruning" the tree or
  limiting its maximum depth).
/ Instability (High Variance): A tiny change in the training data can cause the
  algorithm to pick a different feature for the very first split at the root node.
  This completely changes the entire structure of the tree.
/ Bias Toward Dominant Classes: If some classes dominate the dataset, the tree will
  be biased toward predicting those classes. The dataset usually needs to be balanced
  beforehand.
/ Suboptimal for Complex Relationships: While great for simple, step-by-step logic, a
  single Decision Tree often struggles to capture smooth, continuous relationships
  compared to Linear Regression, and is almost always outperformed by "ensemble"
  methods (like Random Forest or XGBoost) which combine hundreds of decision trees
  together to fix these exact disadvantages.

== Numerical

ENTROPY:
$ E_D_i = - display(sumin P_i log_2(P_i)) $

INFORMATION GAIN:
$ I G(X) & = display(sum_(i=1)^k (abs(D_i)/abs(D) E_D_i) - E_D) $

#box(stroke: 10pt, inset: 10pt, radius: 10pt, image("assets/DT1.png"))

#pagebreak()

= CLUSTERING: HIERARCHICAL

Hierarchical Clustering is an unsupervised machine learning algorithm used to group
similar unlabeled data points together. Unlike K-Means clustering, you do not need to
tell the algorithm how many clusters to create beforehand.

Instead, it builds a hierarchy (a tree-like structure called a Dendrogram) of
clusters. There are two main approaches:

/ Agglomerative (Bottom-Up): This is the most common method. It starts by treating
  every single data point as its own individual cluster. It then finds the two
  closest clusters, merges them together, and repeats this process step-by-step until
  all points are merged into one giant, single cluster.
/ Divisive (Top-Down): The exact opposite. It starts with all data points in one
  giant cluster and continually splits them apart until every point is on its own.

You then use the resulting dendrogram to visually decide exactly where to "cut" the
tree to get the number of clusters that makes the most sense for your problem.

#image("assets/hierarchical.webp")

== Applications

Because it naturally finds nested relationships (groups within groups), it is
incredibly useful for taxonomy and exploratory data analysis:

/ Bioinformatics & Genomics: Building evolutionary trees (phylogeny) to show how
  different species are related based on genetic similarity, or grouping genes with
  similar expression patterns.
/ Customer Segmentation: Finding broad categories of shoppers, and then sub-dividing
  those categories into smaller, highly specific niches (e.g., splitting "Budget
  Shoppers" into "Coupon Users" and "Bulk Buyers").
/ Document Categorization: Grouping millions of documents into a hierarchy. (e.g., A
  broad cluster for "Science", which splits into "Physics" and "Biology", which split
  further into specific sub-topics).
/ Social Network Analysis: Identifying broad communities within a social network, and
  then finding tighter-knit sub-groups (cliques) within those communities.
/ Fraud Detection: Grouping financial transactions to find tight clusters of
  anomalous or suspicious behavior that stray from normal spending branches.

== Advantages

/ No Need to Guess "K": You don't have to pre-define the number of clusters before
  running the algorithm. You can look at the dendrogram afterward and make an
  informed decision on how many clusters you want.
/ Highly Interpretable Output: The dendrogram provides a brilliant visual summary of
  your entire dataset, showing exactly how closely related different groups are to
  one another.
/ Reveals Granular Structure: It captures nested relationships in data (clusters
  within clusters) that flat clustering algorithms (like K-Means) completely miss.
/ Flexible: It works with nearly any distance metric (Euclidean, Manhattan, etc.) and
  gives you different "linkage" options (how distance between clusters is measured),
  making it adaptable to different data shapes.

== Disadvantages

/ Terrible Scalability: This is its fatal flaw. The algorithm requires massive
  computing power and memory. Its time complexity is often $O (n^3)$ and space
  complexity is $O (n^2)$. It works beautifully on thousands of rows, but becomes
  impossibly slow on millions of rows.
/ No Undoing Mistakes: The algorithm is "greedy." Once it merges two data points
  together (or splits them apart), that decision is final. If it makes a bad merge
  early on, it cannot go back and fix it later.
/ Sensitive to Outliers: Depending on the linkage method used, a single extreme
  outlier can drastically distort the shape of the clusters (especially when using
  "Single Linkage," which often creates long, unnatural chains of data).
/ Subjectivity in Cutting the Tree: While the dendrogram is helpful, deciding exactly
  where to "cut" it to form your final clusters is ultimately a subjective human
  decision.

#pagebreak()

= CLUSTERING: K-MEANS CLUSTERING [TODO]

K-Means Clustering is an unsupervised machine learning algorithm used to group
unlabeled data into a specific number of distinct, non-overlapping subgroups
(clusters).

The "K" refers to the number of clusters you want the algorithm to find. The
algorithm works through an iterative process:

+ / Initialization: It randomly places $k$ points, called "centroids," into the data
    space.
+ / Assignment: Every single data point is measured against these centroids and
    assigned to the one it is closest to (usually using Euclidean distance).
+ / Update: The algorithm calculates the actual center of all the data points in each
    newly formed cluster and moves the centroid to that exact center point.
+ / Repeat: Steps 2 and 3 are repeated over and over until the centroids stop moving,
    meaning the clusters have stabilized.

== Applications

/ Customer Segmentation: Grouping customers based on purchasing history, browsing
  behavior, or demographics to target them with personalized marketing campaigns.
/ Image Compression: Reducing the size of an image file by clustering similar pixel
  colors together and replacing them with a single representative color (the
  centroid).
/ Document Clustering: Automatically organizing thousands of news articles, emails,
  or web pages into distinct topics without needing human labels.
/ Inventory Categorization: Helping retailers group products with similar sales
  metrics to optimize supply chain management and shelf space.
/ Anomaly Detection: By defining what "normal" clusters look like, anything that
  falls unusually far away from any centroid can be flagged as anomalous (e.g., fraud
  detection or network security).

== Advantages

/ Highly Scalable and Fast: It is computationally very efficient, with a time
  complexity of generally $O (n)$. It can handle massive datasets much faster than
  algorithms like Hierarchical Clustering.
/ Simple to Understand and Implement: The logic is straightforward, making the
  results very easy to interpret and explain to stakeholders.
/ Guaranteed Convergence: The algorithm is mathematically guaranteed to stop and find
  a result; it won't run infinitely.
/ Great for Spherical Data: When the distinct groups in your data naturally form
  circular, equally sized clusters, K-Means performs exceptionally well.

== Disadvantages

/ You Must Guess "K": Its biggest drawback is that it forces you to specify the
  number of clusters ($k$) upfront. If you choose the wrong $k$, the results will be
  forced and unnatural. (You often have to run separate analyses, like the "Elbow
  Method," just to figure out what $k$ should be).
/ Assumes Spherical Clusters: It assumes all clusters are perfectly round and roughly
  the same size. It fails completely if your data forms complex shapes (like moons or
  rings) or if one cluster is vastly more dense than another.
/ Sensitive to Initialization: Because it starts by placing centroids randomly,
  running the algorithm twice on the exact same data might give you two different
  results if it gets stuck in a "local optimum." (Modern versions use a tweak called
  K-Means++ to fix this).
/ Sensitive to Outliers: Because it calculates the mathematical average (mean) to
  move the centroids, a single extreme outlier can drag the centroid way off course,
  distorting the entire cluster.

== Numerical

+ / Initialization: We begin by randomly selecting k cluster centroids.
+ / Assignment Step: Each data point is assigned to the nearest centroid, forming
    clusters.
+ / Update Step: After the assignment, we recalculate the centroid of each cluster by
    averaging the points within it.
+ / Repeat: This process repeats until the centroids no longer change or the maximum
    number of iterations is reached.

FIRST ITERATION:

calculate distance from each point to every centroid you picked

then assign the centroid with the shortest distance as the closest point

#table(
  columns: 5,
  [POINT], [Cen(2,10)], [Cen(5,8)], [Cen(1,2)], [New Cluster],

  $A(2,10)$, $dots$, $dots$, $dots$, $1$,
  $A(2,5)$, $dots$, $dots$, $dots$, $3$,
  $A(8,4)$, $dots$, $dots$, $dots$, $2$,
  $B(5,8)$, $dots$, $dots$, $dots$, $2$,
  $B(7,5)$, $dots$, $dots$, $dots$, $2$,
  $B(6,4)$, $dots$, $dots$, $dots$, $2$,
  $C(1,2)$, $dots$, $dots$, $dots$, $3$,
  $C(4,9)$, $dots$, $dots$, $dots$, $2$,
)

find new centeroids by taking average of $x_i$ and $y_i$ from new clusters

$
  C_1 & = (2, 10) \
  C_2 & = ((8+5+7+6+4)/5, (4+8+5+4+9)/5) \
  C_2 & = (6, 6) \
  C_3 & = ((2+1)/2, (5+2)/2) \
  C_3 & = (1.5, 3.5) \
$

SECOND ITERATION with new centroids:

#table(
  columns: 5,
  [POINT], [Cen(2,10)], [Cen(6,6)], [Cen(1.5,3.5)], [New Cluster],

  $A(2,10)$, $dots$, $dots$, $dots$, $1$,
  $A(2,5)$, $dots$, $dots$, $dots$, $3$,
  $A(8,4)$, $dots$, $dots$, $dots$, $2$,
  $B(5,8)$, $dots$, $dots$, $dots$, $2$,
  $B(7,5)$, $dots$, $dots$, $dots$, $2$,
  $B(6,4)$, $dots$, $dots$, $dots$, $2$,
  $C(1,2)$, $dots$, $dots$, $dots$, $3$,
  $C(4,9)$, $dots$, $dots$, $dots$, $1$,
)

repeat till needed or new centroids are same as old centroids

#pagebreak()

= PCA

Principal Component Analysis (PCA) is an unsupervised, linear dimensionality
reduction technique. It is used to take a dataset with a massive number of variables
(dimensions) and shrink it down to a much smaller set of variables, while still
retaining as much of the original, important information as possible.

It does this by transforming the original data into a new set of mathematically
constructed, artificial variables called Principal Components.

- / Principal Component 1 (PC1): Captures the absolute most variance
    (spread/information) in the data.
- / Principal Component 2 (PC2): Captures the second most variance, and is completely
    uncorrelated (perpendicular/orthogonal) to PC1.
- This continues until you have as many components as original features, but most of
  the "noise" and redundant information is pushed to the final few components, which
  you simply throw away.

== Applications

PCA is primarily used as an essential preprocessing step before feeding data into
other machine learning algorithms, or for data exploration:

/ High-Dimensional Data Visualization: Human brains cannot visualize data with 10 or
  100 dimensions. PCA compresses this data down to 2 or 3 Principal Components so we
  can plot it on a standard graph to look for clusters or patterns.
/ Image Compression: In computer vision (like the famous "Eigenfaces" used in early
  facial recognition), PCA reduces the millions of pixels in an image down to a
  smaller set of core features, saving massive amounts of storage and memory.
/ Speeding up Machine Learning: Algorithms like KNN or Hierarchical Clustering are
  incredibly slow on datasets with thousands of columns. PCA shrinks the dataset,
  making these algorithms run significantly faster without losing predictive power.
/ Quantitative Finance: Identifying the hidden, underlying mathematical factors that
  drive the returns of thousands of different stocks across the market.
/ Genomics and Bioinformatics: Analyzing genetic data where there are tens of
  thousands of genes (features) but only a few dozen patients (samples) to find
  underlying genetic structures.

== Advantages

/ Eliminates Multicollinearity: Because every Principal Component is strictly
  orthogonal (at a 90-degree angle mathematically) to the others, they are completely
  uncorrelated. This fixes major issues for algorithms like Linear Regression that
  break when features overlap.
/ Reduces Overfitting: By throwing away the final Principal Components (which mostly
  contain "noise" or random data fluctuations), the resulting dataset is cleaner,
  helping models generalize better to new data.
/ Improves Algorithm Performance: Less data means faster training times and less
  memory usage for downstream machine learning models.
/ Excellent for Data Compression: It provides a highly efficient way to store massive
  datasets while preserving the core underlying structure of the data.

== Disadvantages

/ Severe Loss of Interpretability: This is its biggest drawback. If your original
  features were "Age," "Income," and "Height," your new PC1 might be a complex
  mathematical mix of $0.4 times "Age" - 0.2 times "Income" + 0.8 times "Height"$.
  You can no longer easily explain what PC1 represents in plain English.
/ Requires Strict Standardization: PCA is incredibly sensitive to the scale of your
  data. If one feature is measured in millions (like budget) and another in decimals
  (like percentages), the larger feature will completely dominate the Principal
  Components. You must scale your data (usually to a mean of 0 and standard deviation
  of 1) before running PCA.
/ Information Loss: If you drop too many Principal Components to shrink your data,
  you will inevitably throw away useful information, which will reduce the accuracy
  of your final predictive models.
/ Assumes Linear Relationships: PCA can only find linear patterns in data. If the
  underlying structure of your data is highly complex and non-linear (like data
  wrapped in a spiral), PCA will perform terribly. (In these cases, non-linear
  techniques like t-SNE or UMAP are used instead).

== Numerical 1

// https://www.youtube.com/watch?v=ZtS6sQUAh0c

1. Standardize the Data

$display(x_i - dash(x_i))$

#datatable($x_1$, $x_2$)

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

== Numerical 2

// https://www.youtube.com/watch?v=ZtS6sQUAh0c

1. Standardize the Data

$display(x_i - dash(x_i))$

#datatable($x_1$, $x_2$)

2. Calculate Covariance Matrix

$
  C = mat(
    "Cov"(x_1, x_1), "Cov"(x_1, x_2);
    "Cov"(x_2, x_1), "Cov"(x_2, x_2)
  )
$

3. eigenvalues

$
  0 & = "det"(C - lambda I) \
  0 & = det(
        "Cov"(x_1, x_1) - lambda, "Cov"(x_1, x_2);
        "Cov"(x_2, x_1), "Cov"(x_2, x_2) - lambda
      ) \
  0 & = a lambda^2 + b lambda + c
$

calculate roots of the equation above to get $lambda_1$ and $lambda_2$

4. find eigenvectors for ($lambda_1$, $v_1$) and ($lambda_2$, $v_2$)

$
                                      C v_i & = lambda_i v_i \
        mat(
          "Cov"(x_1, x_1), "Cov"(x_1, x_2);
          "Cov"(x_2, x_1), "Cov"(x_2, x_2)
        ) mat(x_i; y_i)                     & = lambda_i mat(x_i; y_i) \
  "Cov"(x_1, x_1) x_i + "Cov"(x_1, x_2) y_i & = lambda_i x_i "(1)" \
  "Cov"(x_1, x_2) x_i + "Cov"(x_2, x_2) y_i & = lambda_i x_i "(2)" \
$

we will get two equations and can solve either of them to get $x_1$ or $y_1$,
assuming $y_i$ to be 1

5. find unit eigenvector

$
  v_1 & = mat(x_1; 1) \
  v_1 & := mat(x_1 / sqrt((x_1)^2 + 1^2); 1 / sqrt((x_1)^2 + 1^2)) \
$

6. find first principal of components

$ e_1^T mat(X_(1k) - dash(X_1); X_(2k) - dash(X_2)) $

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
  [CHARACTERISTIC], [FILTER METHODS], [WRAPPER METHODS],

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
