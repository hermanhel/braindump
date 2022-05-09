+++
title = "Artificial Intelligence"
author = ["System Administrator"]
draft = false
+++

Guide page to various AI-related topics


## Categories {#categories}


### Herman's categories {#herman-s-categories}


#### Expert System {#expert-system}

[wikipedia](https://en.wikipedia.org/wiki/Expert_system)
use knowledge and processes an expert would have. Pretty much every algorithm.


#### Learning {#learning}

use standards to evolve by the system itself.

<!--list-separator-->

-  supervised learning

    with correct answer(label)

<!--list-separator-->

-  unsupervised learning

    without correct answer


### Ray Dalio's categories {#ray-dalio-s-categories}


#### Expert System {#expert-system}

algorithms/machines formulated from 5 step process coded into computer.


#### Pattern finding {#pattern-finding}

find pattern in the facts by itself


#### Data Mining {#data-mining}

reveal view of the world inside 1 particular large bunch of data.


## Math prerequisites {#math-prerequisites}


### [Linear Algebra]({{< relref "20220423190558-linear_algebra.md" >}}) {#linear-algebra--20220423190558-linear-algebra-dot-md}


#### matrix decomposition {#matrix-decomposition}

data comes as matrix.

| id | feature1 | feature2 |
|----|----------|----------|
| 1  | 4        | 2.72     |
| 2  | 5        | 1.61     |

1 matrix have various properties inside its strucutre. Matrix decomposition describes methods that explicitify the properties.

<!--list-separator-->

-  Determinant

<!--list-separator-->

-  Eigenvalues/Eigenvectors

<!--list-separator-->

-  Sigular Value Decomposition(SVD)

    {{< figure src="/Users/hermanhe/Notes/RoamNotes/resource/svd.png" width="600px" >}}

    -   U: orthogonal matrix
    -   v: orthogonal matrix
    -   \\(\\\): diagnal matrix. filled with singular values

    <!--list-separator-->

    -  seeing the results

        <!--list-separator-->

        -  U: important patterns

            as the \\(\\\) is in descending order, column vectors \\(u\_{i}\\) in \\(U\\) are in desc order by importance evaluated by singular values in \\(/\\)

        <!--list-separator-->

        -  \\(\\\) weights

        <!--list-separator-->

        -

    <!--list-separator-->

    -  computing SVD

<!--list-separator-->

-  Principle Component Analysis(PCA)

    Finding \\(n\\) principle components (column ) in the matrix

<!--list-separator-->

-  Independent Component Analysis(ICA)

    seperate mixed signals

<!--list-separator-->

-  Non-Negative Matrix Factorization(NMF)


#### continuous optimization {#continuous-optimization}

<!--list-separator-->

-  sovlable

    -   least-square
    -   linear programming
    -   convex optimization


#### gradient descent {#gradient-descent}


#### constrained optimization {#constrained-optimization}


#### convex optimization {#convex-optimization}


### probabilistic model {#probabilistic-model}

distribution and stuff


#### discrete probabilities {#discrete-probabilities}


#### continuous probabilities {#continuous-probabilities}

<!--list-separator-->

-  probability density function


#### Gaussian Distribution {#gaussian-distribution}


#### conditional probability {#conditional-probability}


#### Baye's therorem {#baye-s-therorem}

most important formula in all of probability


## Data Preprocessing {#data-preprocessing}

Prepare input for the program to prevent errors/low performance


### bad value {#bad-value}

some values are input wrongly, like a 1000C water temperature


### bad entry {#bad-entry}

very outliners should be excluded from cirtain classes.


### bad distribution/scale {#bad-distribution-scale}

some algorithms do better on a cirtain value range, like [-1,1]. some assume standard distribution. Scaling/normalizing the data to such range boost performance/enable algorithm to run.


### better features {#better-features}


### data analytics {#data-analytics}


#### data analysis {#data-analysis}

<!--list-separator-->

-  frequency distribution

    <!--list-separator-->

    -  normal distribution

<!--list-separator-->

-  pointiness

<!--list-separator-->

-  lack of symmetry

<!--list-separator-->

-  centrality

    <!--list-separator-->

    -  mean

    <!--list-separator-->

    -  median

    <!--list-separator-->

    -  mode

<!--list-separator-->

-  dispersion

    <!--list-separator-->

    -  range

    <!--list-separator-->

    -  interquartile range

    <!--list-separator-->

    -  variance

    <!--list-separator-->

    -  standard deviation


#### diagnostic analytics {#diagnostic-analytics}

find possible relations

<!--list-separator-->

-  correlation

<!--list-separator-->

-  Peawrson's r correlation


#### prescriptive analytics {#prescriptive-analytics}


#### exploratory analysis {#exploratory-analysis}

to find some questions(relations) to explore


#### mechanistic analysis {#mechanistic-analysis}

how change in `x` result in change in `y`.
tool: regression.


## Carrier of algorithms {#carrier-of-algorithms}


### Languages {#languages}

any language, but cirtain languages have special libs/functionalities comes in handy

-   python: very many libraries
-   R
-   java
-   c/c++
-   Lisp(scheme,common-lisp,clojure)


### platforms {#platforms}


#### python {#python}

-   pytorch libs
-   sklearn libs: implementation of various learning algorithms/tests
-   numpy/matplotlib/pandas libs: basic science computing utils
-   tensorflow


## Machine learning {#machine-learning}


### Mathematical regression/classification {#mathematical-regression-classification}


### Classifer training via gradient descent {#classifer-training-via-gradient-descent}


### supervised learning algorithms {#supervised-learning-algorithms}

predict a value. use label.


#### classification {#classification}

<!--list-separator-->

-  Support Vector Machine

    <!--list-separator-->

    -  hyperplane

    <!--list-separator-->

    -  Support vector

    <!--list-separator-->

    -  kernel functions

        make the data points linear separable

    <!--list-separator-->

    -  Multiple classes

        <!--list-separator-->

        -  1 vs 1

        <!--list-separator-->

        -  1 vs Many

        <!--list-separator-->

        -  Many vs Many

<!--list-separator-->

-  Naive Bayes

    <!--list-separator-->

    -  Bayes' Rule

    <!--list-separator-->

    -  use Bayes' Rule for classification: MAP estimation

        MAP: Maximum a posteriori estimation

    <!--list-separator-->

    -  Naive Bayes Classifier

        the system

<!--list-separator-->

-  Model likelihood

    <!--list-separator-->

    -  log-likelihood

    <!--list-separator-->

    -  bayesian estimation &amp; laplacian correction

    <!--list-separator-->

    -  Likelihood &amp; Cross Validation &amp; Entropy Measures

<!--list-separator-->

-  Parametric/non-parametric methods

<!--list-separator-->

-  Decision Tree

    <!--list-separator-->

    -  select attributes

        <!--list-separator-->

        -  entropy gain

        <!--list-separator-->

        -  ratio gain

        <!--list-separator-->

        -  Gini index(CART)

    <!--list-separator-->

    -  Overfitting

    <!--list-separator-->

    -  Random Forest

<!--list-separator-->

-  kNN


#### regression {#regression}

<!--list-separator-->

-  linear regression

    <!--list-separator-->

    -  least square

    <!--list-separator-->

    -  multiple linear regression

    <!--list-separator-->

    -  how clever is the model.

    <!--list-separator-->

    -  model selection

    <!--list-separator-->

    -  outliers

        <!--list-separator-->

        -  spot outliner: cook's distance

<!--list-separator-->

-  polynomial regression

<!--list-separator-->

-  logistic regression

    for classification
    map data to a probability

    <!--list-separator-->

    -  alternative funcitons

        -   Softmax
        -   tanh


### unsupervised learning algorithms {#unsupervised-learning-algorithms}

don't predict a value. use no label


#### clustering {#clustering}

<!--list-separator-->

-  hierachical clustering

    agglomerative clustering (bottom-up)

    <!--list-separator-->

    -  algorithm

    <!--list-separator-->

    -  group strategy

        <!--list-separator-->

        -  single linkage

        <!--list-separator-->

        -  complete linkage

        <!--list-separator-->

        -  average linkage

<!--list-separator-->

-  k-means

    divisive clustering (top-down)

    <!--list-separator-->

    -  algorithm

    <!--list-separator-->

    -  k = ?

<!--list-separator-->

-  model based clustering

    <!--list-separator-->

    -  Gaussian Mixture Model

        <!--list-separator-->

        -  definition

        <!--list-separator-->

        -  Expectation Maximisation

            ref: section 11.4, Machine Learning – A Probabilistic Perspective by Keven P. Murphy, the MIT Press

            <!--list-separator-->

            -  expectation step

            <!--list-separator-->

            -  maximmisation step

<!--list-separator-->

-  performance evaluation

    smaller intra-cluster distance, larger inter-cluster distance
    [sklearn module](https://scikit-learn.org/stable/modules/clustering.html#clustering-performance-evaluation)

    -   Davies-Bouldin Index
    -   Calinski-Harabasz Index
    -   Silhouette Coefficient
    -   Homogeneity &amp; Completeness
    -   Fowlkes-Mallows Scores

<!--list-separator-->

-  Distance mesurements

    [mathwork list](https://www.mathworks.com/help/stats/pdist.html#mw_238ce485-9126-46a1-beaa-f2dcc12573eb)

    -   Euclidean Distance
    -   City Block Distance
    -   Mahalanobis Distance
    -   Correlation Distance
    -   Cosine Distance
    -   Hamming Distance
    -   Chebyshev Distance
    -   Spearman Distance
    -   Jaccard Distance


#### density estimation {#density-estimation}


## some application {#some-application}


### computer vision {#computer-vision}


### Natural Language Processing {#natural-language-processing}


### machine learning {#machine-learning}