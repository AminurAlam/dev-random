#import "snippets/frontpage.typ": index, starter

#starter[
  Comparison of different \
  regression models on \
  "Youth Tobacco Usage" data
]

#text(1.2em)[#align(center)[#outline()]]
#pagebreak()

#let img(path, ..args) = context {
  let path-label = label(path)
  let first-time = query((context {}).func()).len() == 0
  if first-time or query(path-label).len() > 0 {
    [#image(path, ..args)#path-label]
  } else {
    rect(
      stroke: 1pt,
      width: args.at("width", default: 50%),
      height: args.at("height", default: 30%),
      args.at("alt", default: align(center + horizon, "404 not found")),
    )
  }
}

#set par(justify: true)
#set text(size: 1.2em)
#set heading(numbering: "1.1")
#set terms(separator: ":  ")
#set page(margin: 50pt, numbering: "1", columns: 1)
#[
  #set par(justify: false)
  #set align(center)
  #text(1.8em, weight: "bold")[
    Comparison of different regression models on "Youth Tobacco Usage" data
  ]
]

#line(length: 100%)

#heading(numbering: none)[Abstract]
This paper provides comparisons of linear regression models for predicting tobacco
usage habits in youth of India. The target of this study is to understand which
factors contribute the most to people quitting tobacco. The dataset used in this
project is derived from the Global Youth Tobacco Survey (GYTS-4), conducted across
India to measure tobacco use, exposure, and awareness among school-going children.
The models used here range from linear regression to decision trees. By examining
these various models, this paper aims to provide a clear understanding of their
distinct characteristics

= Introduction
The dataset “Youth Tobacco Usage” provides a detailed cross-section of tobacco use
behaviours among young individuals, capturing patterns of smoking, smokeless tobacco
consumption, exposures to second-hand smoke, and related demographic factors.
Leveraging a school-based survey framework, the data spans multiple regions and age
groups, enabling analysis by gender, product type, and geographic location. The
primary objectives are to:
- estimate prevalence rates of tobacco experimentation and regular use among youth
- identify associations between usage and socio-demographic factors, and
- inform targeted public health interventions.
Methodologically, the dataset is structured for statistical analysis of prevalence,
trend detection, and subgroup comparisons. Key findings highlight that while overall
youth tobacco use has shown signs of decline, significant variation persists across
states/regions and between product types (e.g., cigarettes versus smokeless tobacco).
These insights underscore the need for region-specific prevention strategies,
increased educational efforts in high-risk demographics, and continual monitoring of
emerging tobacco use patterns among adolescents. The dataset thus serves as a
valuable resource for researchers, policymakers, and educators aiming to curb youth
tobacco initiation and progression.

== Source of Data

The data comes from the Open Government Data (OGD) Platform of India, published by
the Ministry of Health and Family Welfare (MoHFW) and conducted by the International
Institute for Population Sciences (IIPS). This ensures that the dataset is authentic,
government-verified, and publicly accessible.

#pagebreak()

== Scope of the Data

The dataset covers tobacco-related behavior of school students aged 13–15 years
across all Indian States and Union Territories.

It contains information on:
- Ever and current tobacco users
- Exposure to tobacco smoke (home, school, public places)
- Access to cigarettes, bidis, and smokeless tobacco
- Awareness of laws, school policies, warning labels
- Anti-tobacco messages in media
- Quit attempts and willingness to quit
- Sources of purchase (paan shops, stores, vendors)

The scope is national and state-level, making it suitable for comparative analysis,
trend analysis, and policy evaluation.

== Time of Data Recording

The dataset represents the 4th round (GYTS-4) conducted in 2019. Official publication
occurred in 2022 on the OGD platform. Thus, it reflects recent pre-pandemic youth
tobacco patterns.

== Datatypes of Columns

The dataset contains the following major datatypes:
- Categorical Columns
  - State/UT name
  - Area (Urban, Rural, Total)
- Numerical Columns (Percentage values)
  - Current tobacco users
  - Students exposed to smoke
  - Students who noticed warnings
  - Ever users of different tobacco products
- Numerical Columns (Integer values)
  - Median age of initiation of Cigarette
  - Median age of initiation of Bidi
  - Median age of initiation of smokeless tobacco

All these numerical values are stored as float type after data cleanup.

= Missing Values and Data correction
To ensure the dataset is accurate and ready for modeling, several steps were taken to
remove noise and correct inconsistencies. The dataset did not contain NaN values, but
it did contain irrelevant columns and wrong entries that required correction. The
details are explained in the section below.

== Removal of Irrelevant Columns (Discard Method)

Three columns related to the median age of tobacco initiation were removed because of
high ammounts of errors and unusable data: Median age of initiation of Cigarette (in
years)

Median age of initiation of Bidi (in years)

Median age of initiation of smokeless tobacco (in years)

== Manual Correction of Incorrect Values

Two attributes contained invalid values at specific rows. Instead of statistical
prdiction, correct values were manually inserted:
- Bought Cigarette as individual sticks in past 30 days: 35,2 → 35.2
- Students who saw anyone using tobacco on mass media in past 30 days: 63..4 → 63.4

= Data Analysis
The Youth Tobacco Survey dataset was explored through visual and statistical
techniques to understand patterns in tobacco usage, exposure, awareness, and quitting
behavior among students. This section presents the complete analysis using top-lists,
source comparisons, distribution plots, linear trends, and quit-related attribute
evaluation.

== Top 10 States/UTs Analysis
To identify regions with high or low tobacco-related behaviors, four “Top 10”
horizontal bar graphs were created using key survey attributes. These graphs allow
easy comparison across states and show clear geographic differences.

#grid(
  columns: (auto, auto),
  gutter: 10pt,
  figure(
    img("svg/01.svg", height: auto),
    caption: [Lifetime usage varies significantly between states],
  ),
  figure(
    img("svg/02.svg", height: auto),
    caption: [Current trends suggest stable habits],
  ),

  figure(
    img("svg/03.svg", height: auto),
    caption: [
      Chandigarh has a high quitting rate
    ],
  ),
  figure(
    img("svg/04.svg", height: auto),
    caption: [Shows desire for people to quit],
  ),
)


== Popular Sources of Tobacco

// #figure(
//   img("svg/05.svg", height: 26%),
//   caption: [Cigarettes and smokeless tobacco appear as the most commonly used products historically],
// )
// #figure(
//   img("svg/06.svg", height: 26%),
//   caption: [Present-day trends are similar to all-time trends, suggesting stable consumption habits],
// )

#figure(
  img("svg/07.svg", height: 26%),
  caption: [Bidi stores remain the primary source for all tobacco],
)


== Data Distribution Analysis

Data distribution analysis was performed to understand how each numerical attribute
in the Youth Tobacco Survey varies across states and union territories. Instead of
only looking at raw values, distribution graphs help identify patterns such as which
attributes show high variation, which remain consistent, and where extreme values
exist.

Since the dataset contains too many numerical columns, the attributes were divided
into three parts. For every group, a plot was created to visualize the minimum,
maximum, and mean values of each attribute.

#figure(img("svg/08.svg", height: 31%))
#figure(img("svg/09.svg", height: 31%))
#figure(img("svg/10.svg", height: 31%))

The three distribution graphs reveal:
- Attributes like people who tried to quit show large variation between states.
- Awareness-related attributes tend to be more stable, with smaller ranges.


== Linear Trend Analysis

The linear trend graph is used to understand how one tobacco-related factor changes
in relation to another. It helps identify whether the relationship between two
variables is increasing, decreasing, or neutral. A straight line is fitted across the
data points, showing the overall direction of the relationship.

In this project, trend lines were drawn using pairs of numerical attributes such as:
- Anti-tobacco awareness vs. current tobacco users
- Exposure to tobacco smoke vs. quit attempts
- School tobacco-free policy vs. cigarette usage

The linear trend graph helps visually identify which factors contribute to tobacco
use and which factors support quitting behavior.

#grid(
  columns: (auto, auto),
  gutter: 20pt,
  figure(img("svg/11.svg", height: auto)), figure(img("svg/12.svg", height: auto)),

  figure(img("svg/13.svg", height: auto)), figure(img("svg/14.svg", height: auto)),
)

#pagebreak()

== Positive and Negative Attributes for Quitters

To understand what influences students to quit smoking, the dataset was analyzed to
identify attributes that show positive or negative relationships with quit attempts
and quit success.

#figure(
  img("svg/17.svg", height: auto),
  caption: [Positive Attributes (Help in Quitting)],
)
#figure(
  img("svg/18.svg", height: auto),
  caption: [Negative Attributes (Make Quitting Difficult)],
)

#pagebreak()
= Correlation and Covariance Analysis

Correlation and covariance analysis were done to understand how various factors
influence each other. These statistical tools help identify relationships between
awareness, exposure, school policies, and actual tobacco usage among students.

/ Correlation: Shows how strongly two variables are related, with values ranging from
  –1 to +1. A positive value indicates that as one variable increases, the other also
  increases. A negative value indicates an inverse relationship.
/ Covariance: Shows whether two variables move together. Positive covariance means
  they increase or decrease together, while negative covariance means they move in
  opposite directions.

#align(center)[
  #v(20pt)
  #figure(
    caption: [Table of correlations (first 10x10)],
    table(
      columns: 10,
      inset: (x: 8pt, y: 7pt),
      [1.00], [1.00], [1.00], [0.99], [0.99], [1.00], [0.99], [0.93], [0.99], [0.78],
      [1.00], [1.00], [1.00], [0.99], [0.99], [0.99], [0.99], [0.95], [0.99], [0.81],
      [1.00], [1.00], [1.00], [1.00], [0.99], [1.00], [0.99], [0.93], [0.99], [0.78],
      [0.99], [0.99], [1.00], [1.00], [1.00], [1.00], [1.00], [0.94], [0.99], [0.77],
      [0.99], [0.99], [0.99], [1.00], [1.00], [1.00], [1.00], [0.93], [1.00], [0.75],
      [1.00], [0.99], [1.00], [1.00], [1.00], [1.00], [1.00], [0.93], [0.99], [0.76],
      [0.99], [0.99], [0.99], [1.00], [1.00], [1.00], [1.00], [0.93], [1.00], [0.75],
      [0.93], [0.95], [0.93], [0.94], [0.93], [0.93], [0.93], [1.00], [0.93], [0.93],
      [0.99], [0.99], [0.99], [0.99], [1.00], [0.99], [1.00], [0.93], [1.00], [0.75],
      [0.78], [0.81], [0.78], [0.77], [0.75], [0.76], [0.75], [0.93], [0.75], [1.00],
    ),
  )
  #v(20pt)
  #figure(
    caption: [Table of covariances (first 10x10)],
    table(
      columns: 10,
      inset: (x: 10pt, y: 7pt),
      [415], [410], [397], [362], [370], [374], [371], [286], [346], [70],
      [410], [406], [392], [359], [366], [369], [367], [289], [342], [72],
      [397], [392], [379], [347], [355], [358], [356], [275], [332], [67],
      [362], [359], [347], [320], [327], [329], [328], [253], [306], [61],
      [370], [366], [355], [327], [336], [338], [337], [257], [315], [61],
      [374], [369], [358], [329], [338], [340], [339], [259], [316], [62],
      [371], [367], [356], [328], [337], [339], [338], [258], [315], [61],
      [286], [289], [275], [253], [257], [259], [258], [229], [243], [63],
      [346], [342], [332], [306], [315], [316], [315], [243], [297], [57],
      [70], [72], [67], [61], [61], [62], [61], [63], [57], [20],
    ),
  )
]

To visualize how variables interact at a broader scale, heatmaps were generated for
selected important attributes. These heatmaps make it easy to identify clusters of
variables that behave similarly.

#figure(img("svg/15.svg", height: 37%))
#figure(img("svg/16.svg", height: 37%))

== Possible Causes for These Relationships

The observed relationships can be explained by behavioral and environmental factors.
These patterns highlight how environmental exposure, education, and enforcement shape
youth tobacco behavior.

For example:
- Higher awareness and stronger school policies show negative correlation with
  current tobacco use because education reduces curiosity and access.
- Higher exposure at home or public places shows positive correlation with tobacco
  use because frequent exposure normalizes smoking behavior.
- Anti-tobacco messages correlate positively with quit attempts, students who see
  more warnings become more motivated to quit.
- Easy access from paan shops correlates with higher usage because availability
  directly increases consumption.


= Errors in Data and How They Were Fixed

Before training the models, the tobacco dataset contained several issues that needed
correction to ensure clean, reliable results. The first major problem was the
presence of three entries for each `State/UT` under `Rural`, `Urban`, and `Total`
categories. Using all three would create duplicate information and bias the model, so
only rows where `Area` was marked as `Total` was kept. After this filtering, the
`Area` column became unnecessary and was removed.

The dataset also contained an extra initial row that did not represent state-level
data. Keeping this row could distort averages and correlations, so it was removed
using `data.iloc[1:]`. After row removal, the index numbers were inconsistent, which
was fixed by resetting the index.

Finally, the cleaned dataset was prepared for machine learning by performing a
train–test split of `80:20`

= Models

This section explains the regression models used to predict
`Ever tobacco smokers who quit in last 12 months (%)`. A total of nine models were
trained on an `80:20` train–test split using the selected independent variables. Each
subsection provides a short description, key parameters, advantages, limitations, and
tuning guidelines.

== Linear Regression

//https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LinearRegression.html

// https://scikit-learn.org/stable/imgs/sphx_glr_plot_pcr_vs_pls_003.png
// https://scikit-learn.org/stable/imgs/sphx_glr_plot_ols_ridge_001.png
Linear Regression fits a straight line (or hyperplane) that minimizes the squared
error between actual and predicted values. It serves as the baseline for all
regression tasks.

#columns()[
  #underline([Pros:])
  - Fast and simple
  - Highly interpretable
  - Good baseline model when relationships are linear
  #colbreak()
  #underline([Cons:])
  - Sensitive to outliers
  - Performs poorly under multicollinearity
  - Assumes linearity and constant variance
]

#columns()[
  #underline([Parameters:])
  - `fit_intercept`: Whether to compute the intercept term
  - `n_jobs`: Enables parallel computation
  #colbreak()
  #underline([Tuning Tips:])
  - Standardize features before fitting
  - Use Ridge/Lasso when overfitting is observed
  - Add PolynomialFeatures for non-linearity
]

== Linear Regression with PolynomialFeatures

//https://scikit-learn.org/stable/auto_examples/linear_model/plot_polynomial_interpolation.html
// https://scikit-learn.org/stable/imgs/sphx_glr_plot_polynomial_interpolation_001.png
This is a preprocessing step for Linear Regression that expands features into
higher-degree polynomial terms and then applies Linear Regression. It captures
smooth, non-linear relationships.

#columns()[
  #underline([Pros:])
  - Models non-linearity while keeping interpretability
  - Simple extension of linear regression
  #colbreak()
  #underline([Cons:])
  - High risk of overfitting
  - Feature explosion with many input variables
]

#columns()[
  #underline([Parameters:])
  - `degree`: Polynomial order (usually 2 or 3)
  - `interaction_only`: Enables only interaction terms
  - `include_bias`: Includes constant term
  #colbreak()
  #underline([Tuning Tips:])
  - Start with `degree` = 2
  - Use Ridge/Lasso for regularized polynomial regression
  - Apply feature selection before expansion
]

#figure(
  img("svg/21.svg", height: 30%),
  caption: [Error is lowest at `degree=5`],
)

== Ridge Regression (L2 Regularization)

//https://scikit-learn.org/stable/modules/linear_model.html#regression
//https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.Ridge.html
Ridge adds an L2 penalty to shrink coefficients, reducing variance and handling
multicollinearity.

#columns()[
  #underline([Pros:])
  - Handles correlated predictors well
  - Stable coefficient estimates
  #colbreak()
  #underline([Cons:])
  - Does not perform feature selection
  - Coefficients never become exactly zero
]

#columns()[
  #underline([Parameters:])
  - `alpha`: Regularization strength (higher = stronger penalty)
  - `solver`: Optimization algorithm
  #colbreak()
  #underline([Tuning Tips:])
  - Tune `alpha` through cross-validation
  - Standardize features before fitting
]

#figure(
  img("svg/29.svg", height: 40%),
  caption: [Error is lowest at `Ridge(alpha=50, solver='auto')`],
)

== Lasso Regression (L1 Regularization)

// https://scikit-learn.org/stable/modules/linear_model.html#lasso
// https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.Lasso.html
Lasso adds an L1 penalty that can shrink coefficients to zero, effectively selecting
important features.

#columns()[
  #underline([Pros:])
  - Performs automatic feature selection
  - Improves model interpretability
  #colbreak()
  #underline([Cons:])
  - Unstable when features are very correlated
  - Poor if most features are relevant
]

#columns()[
  #underline([Parameters:])
  - `alpha`: Regularization strength
  - `max_iter`: Convergence settings
  #colbreak()
  #underline([Tuning Tips:])
  - Scale features before fitting
  - Use LassoCV to automatically find optimal `alpha`
]

#figure(
  img("svg/30.svg", height: 26%),
  caption: [Error is lowest at `Lasso(alpha=33)`],
)

== ElasticNet

// https://scikit-learn.org/stable/modules/linear_model.html#elastic-net
// https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.ElasticNet.html
ElasticNet combines L1 (Lasso) and L2 (Ridge) penalties to achieve both shrinkage and
feature selection.

#underline([Pros:])
- Works well with correlated feature groups
- More stable than Lasso alone

#columns()[
  #underline([Parameters:])
  - `alpha`: Overall regularization
  - `l1_ratio`: L1:L2 ratio [0, 1]
  #colbreak()
  #underline([Tuning Tips:])
  - Use grid search on `alpha` and `l1_ratio`
  - Standardize features
]

#figure(
  img("svg/32.svg", height: 43%),
  caption: [Error is lowest at `ElasticNet(alpha=14, l1_ratio=0.44)`],
)

== Quantile Regressor

// https://scikit-learn.org/stable/modules/linear_model.html#quantile-regression
// https://scikit-learn.org/stable/imgs/sphx_glr_plot_quantile_regression_002.png
// https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.QuantileRegressor.html
Quantile Regression predicts conditional quantiles (median), making it robust to
outliers and skewed distributions.

#columns()[
  #underline([Pros:])
  - Useful in predicting an interval instead of point
  - More robust than mean-based models
  - Captures variability in target distribution
  #colbreak()
  #underline([Cons:])
  - Optimization can be slow
  - Interpretation differs from standard regression
]

#columns()[
  #underline([Parameters:])
  - `alpha`: Regularization strength
  - `quantile`: Target quantile (0, 1)
  #colbreak()
  #underline([Tuning Tips:])
  - Start with `quantile` = 0.5
  - Try 0.25 and 0.75 to examine spread
]

#figure(
  img("svg/36.svg", height: 45%),
  caption: [Error is lowest at `Quantile(alpha=14, quantile=0.44)`],
)

== Decision Tree Regressor

// https://scikit-learn.org/stable/modules/tree.html#tree
// https://scikit-learn.org/stable/imgs/sphx_glr_plot_tree_regression_001.png
// https://scikit-learn.org/stable/imgs/sphx_glr_plot_adaboost_regression_001.png
Decision Trees split the feature space into regions and predict based on the average
target value in each leaf.

#columns()[
  #underline([Pros:])
  - Easy to interpret visually
  - No feature scaling required
  #colbreak()
  #underline([Cons:])
  - Easily overfits
  - Unstable on small changes in data
]

#columns()[
  #underline([Parameters:])
  - `criterion`: Error measure (se, mse)
  - `max_depth`: Limits tree growth
  #colbreak()
  #underline([Tuning Tips:])
  - Limit `max_depth`
  - Increase `min_samples_leaf`
]

#figure(
  img("svg/38.svg", height: 45%),
  caption: [Error is lowest at `DecisionTree(min_samples_split=29, max_depth=1)`],
)

== Random Forest Regressor

// https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.RandomForestRegressor.html
A random forest is a meta estimator that fits a number of decision tree regressors on
various sub-samples of the dataset and uses averaging to improve the predictive
accuracy and control over-fitting.

#columns()[
  #underline([Pros:])
  - Robust to overfitting
  - Handles large feature spaces
  - Works well without scaling
  #colbreak()
  #underline([Cons:])
  - Less interpretable
  - Slow with many trees
]

#columns()[
  #underline([Parameters:])
  - `n_estimators`: Number of trees
  - `min_samples_split`: Minimum samples required to split an internal node
  #colbreak()
  #underline([Tuning Tips:])
  - Tune `max_features` and `max_depth`
  - Increase `n_estimators` if variance is high
]

#figure(
  img("svg/40.svg", height: 45%),
  caption: [Error is lowest at
    `RandomForest(n_estimators=100, min_samples_split=11)`],
)

== Gradient Boosting Regressor

// https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.GradientBoostingRegressor.html
Gradient Boosting builds trees sequentially, with each new tree learning from the
errors of previous trees.

#columns()[
  #underline([Pros:])
  - High predictive accuracy
  - Excellent for structured/tabular data
  #colbreak()
  #underline([Cons:])
  - Sensitive to parameter choices
  - Can overfit with large depth or high learning rate
]

#columns()[
  #underline([Parameters:])
  - `n_estimators`: Number of boosting iterations
  - `learning_rate`: Shrinks each step
  - `max_depth`: Depth of each tree
  - `subsample`: Fraction of samples used per tree
  - `loss`: Loss function
  #colbreak()
  #underline([Tuning Tips:])
  - Use small learning rates (0.05–0.1)
  - Tune `n_estimators` and `subsample`
  - Consider advanced versions like XGBoost or LightGBM
]

#figure(
  img("svg/42.svg", height: 45%),
  caption: [Error is lowest at `GradientBoosting(learning_rate=0, n_estimators=1)`],
)

= Evaluation

To assess and compare the performance of the regression models developed in this
project, four widely used evaluation metrics were employed: Squared Error (SE), Mean
Squared Error (MSE), Root Mean Squared Error (RMSE), and R-Squared (R²). Each metric
offers a different analytical perspective on prediction quality, allowing a more
complete understanding of how well the models generalize to unseen data. The
evaluation process was applied consistently across all trained models under both
random and optimized parameter settings. Visual bar charts were generated for each
metric to enable clear comparison and interpretation.

// == Mean Absolute Error (with random parameter values)
// #figure(img("svg/43.svg", height: 28%), caption: [Error ranging from 8 to 14])

== Mean Absolute Error
MAE simply measures the difference between actual and predicted values. It reflects
how far individual predictions deviate from the true output.

$ "MAE" = (sum^n_(i=1) |e_i|) / n $

Features:
- Highlights individual large deviations
- Forms the foundation for MSE and RMSE
- Useful for spotting models that produce occasional extreme errors

#figure(img("svg/44.svg", height: 28%), caption: [Error ranging from 6 to 10])

== Mean Squared Error
Mean Squared Error represents the average squared difference between predicted and
actual values.

$ "MSE" = (sum^n_(i=1) (e_i)^2) / n $

Features:
- Penalizes large errors more heavily
- Useful for comparing models objectively
- Commonly used in optimization and tuning

#figure(img("svg/45.svg", height: 28%), caption: [Error ranging from 75 to 180])

== Root Mean Squared Error
Root Mean Squared Error is derived by taking the square root of the MSE, providing an
error metric in the same scale as the target variable. This makes interpretation more
intuitive compared to MSE.

$ "RMSE" = sqrt((sum^n_(i=1) (e_i)^2) / n) $

Features:
- More interpretable than MSE
- Indicates magnitude of average prediction error
- Sensitive to outliers

#figure(img("svg/46.svg", height: 28%), caption: [Error ranging from 9 to 14])

== R-Squared
The R² Score measures how much of the variation in the target variable is explained
by the model. It reflects goodness-of-fit rather than raw error.

$
  "SS"_"residual" & = sum_i (y_i - f_i)^2 \
     "SS"_"total" & = sum_i (y_i - accent(y, macron))^2 \
              R^2 & = 1 - "SS"_"residual" / "SS"_"total"
$

Features:
- Shows explanatory power of the model
- Indicates how well predictions follow actual trends
- Complements error-based metrics

#figure(img("svg/47.svg", height: 28%), caption: [Score ranging from -0.5 to -0.4])

= Conclusion
This project aimed to analyze the Youth Tobacco Survey dataset and develop predictive
models to estimate the percentage of "tobacco smokers who quit in the last 12
months". The work involved a complete data science pipeline, beginning with data
cleaning, handling missing and inconsistent values, restructuring feature columns,
and preparing the dataset for modeling. Exploratory analysis highlighted meaningful
behavioural and environmental relationships, showing that awareness programs and
school-based restrictions tend to reduce usage, while exposure at home or in public
places correlates with higher tobacco habits among youths.

Multiple regression models were implemented, including Polynomial Regression, Ridge,
Lasso, ElasticNet, Poisson Regressor, Quantile Regressor, Decision Tree, Random
Forest, and Gradient Boosting. Models were first tested under random parameter
configurations and later under optimized settings. Evaluation metrics: MAE, MSE,
RMSE, and R² were used to compare performance. The results indicate that tuning
significantly improves model accuracy, and among the tested approaches, Quantile and
Random Forest consistently provided stronger predictive capability and better
generalization. Meanwhile, Decision Trees and the Gradient Boosting configuration
showed higher error rates. Although the results are promising, there are limitations.
The analysis relied on a single train– test split instead of cross-validation, and
several input variables showed multicollinearity, affecting interpretability in
linear models.

Overall, the project successfully demonstrates how statistical insight and machine
learning can be applied to public health data. Future improvements should include
k-fold validation, advanced feature selection, more robust ensemble tuning, and
uncertainty estimation. With these enhancements, the model outputs could better
support policy planning, awareness strategies, and targeted intervention programs for
reducing youth tobacco exposure and improving cessation outcomes.

#pagebreak()

#heading(numbering: none)[References]
#h(40pt)
#set align(center)
#block(width: 80%)[
  #show link: underline
  #set align(left)

  #h(-10pt) 1. #strong[Global Youth Tobacco Survey (GYTS-4)]

  Official dataset registry entry, including metadata, publication details, download
  access, and catalog information. Used as the authoritative dataset source reference
  for the project.

  https://www.data.gov.in/catalog/global-youth-tobacco-survey-gyts-4

  \ #h(-10pt) 2. #strong[Scikit-learn Documentation]

  Software library used for implementing regression models. Referenced for model
  functions, evaluation metrics, and parameter settings.

  https://scikit-learn.org/stable/index.html

  \ #h(-10pt) 3. #strong[Matplotlib Documentation]

  Used for plotting evaluation graphs and array computation throughout model analysis
  and visualization.

  https://matplotlib.org/
]
