+++
title = "Discrete Mathematics"
author = ["System Administrator"]
draft = false
+++

## Number Systems {#number-systems}


### Natural Numbers {#natural-numbers}


#### Closed under addtition {#closed-under-addtition}

any 2 num in N add get 1 num in N


#### Key property {#key-property}

Any natural number can be obtained from 0
by S(n) = n + 1
S(0) = 1, S(S(0) = 2; `induction` !!


### Integers {#integers}

and negative


#### Even and odd {#even-and-odd}

0 = undefined


### Rational Numbers {#rational-numbers}

x/y where x and y belong to Integers


### Real numbers {#real-numbers}

all decimal numbers
Distances to points on a number line


### Prinme Numbers {#prinme-numbers}


## Perrin Numbers {#perrin-numbers}


## Proof Techiniques {#proof-techiniques}


### Proof by Induction {#proof-by-induction}


#### Flow {#flow}

<!--list-separator-->

-  1. Bace Case

    property holds for `n = 0`
    or `n = b`

<!--list-separator-->

-  2. Inductive Step

    Assume n = m is ture ==&gt; n = m + 1 is true

<!--list-separator-->

-  3. Conclusion


### Contradiction {#contradiction}


#### Flow {#flow}

<!--list-separator-->

-  1. Assumption by contradiction

<!--list-separator-->

-  2. Develop the proof

<!--list-separator-->

-  3. Find self conflict\\

    `This is a contradiction so the suusmption must be wrong`


## Set Theory {#set-theory}


### Notations {#notations}


#### Relative complement - {#relative-complement}


#### The complement ~ {#the-complement}

Complement of a set A is:
U([Universal set](#universal-set)) - A


#### Uniersal set {#uniersal-set}

the big set in probelm


#### Symmetric difference {#symmetric-difference}

no collapse, all other.


#### Power Set {#power-set}

Pow(A) = {C|C&lt;A}

<!--list-separator-->

-  Observaton

    Pow(A intersect B)= Pow(A) intersact Pow(B)
    does not hold for union


#### Cardinality |A| {#cardinality-a}

<!--list-separator-->

-  Union

    |       |   |   |   |   |   |               |
    |-------|---|---|---|---|---|---------------|
    | A U B | = | A | + | B | - | A intersact B |


#### Cartesian Product x {#cartesian-product-x}

A x B ={(a,b)|a E A and b E B}


### Problem sheet <code>[0/8]</code> {#problem-sheet}

-   [ ] Notation for sets
-   [ ] Subset?
-   [ ] equal of sets?
-   [ ] Operations
-   [ ] Algebra
-   [ ] Cardinality[ ]  produt
-   [ ] [ ] Bit strings


## Relations {#relations}

Relation over sets?
(a,b), a from A, b from B


### Definition {#definition}

between A and B:a subset R of A x B
When A = B, R is a binary relation on A


### Properties {#properties}


#### Reflexive {#reflexive}

xRx for all x


#### Transitive {#transitive}

xRy and yRz =&gt; xRz


#### Symmetric {#symmetric}

xRy =&gt; yRx

<!--list-separator-->

-  Anti symmetric

    xRy =&gt; yRx =&gt; x=y
    a.k.a {(1,1)} is both Symmetric and antisymmetric


### Equivalence Relations {#equivalence-relations}

A relation that is reflexive transitive and symmetric


#### Equivalent class Ex {#equivalent-class-ex}

The set related to x
E0 = Z
E1 = {0,1,2,3,4,5,6,7,8,9,...}


### Partial order {#partial-order}

-   binary relation R
-   reflexive
-   transitive
-   antisymmetric

&lt;= &gt;=


### Total order {#total-order}

partial order that is neither this or that.


### Relational closures {#relational-closures}

R on S may not have a property like reflexivity etc.

can extend the reltion so that it does have some properties


#### Reflexcive closure {#reflexcive-closure}

Add (x,x)
New relation is called the reflexive closure of R


#### Symmetric closure {#symmetric-closure}

Add every (x,y) (y,x)


### Path {#path}

Vertex a to vertex b

path with same start and end vertex is a circuit or cycle

length of path is number of edges


### Transitive Closure {#transitive-closure}

have all recachable vertex in the graph from any vertex of any length

made in repeats


#### Property {#property}

R\* is transitive
R belongs to R\*
S is transitive relation on A nad R belongs to S, then R\* belongs to


### Problem sheet <code>[0/7]</code> {#problem-sheet}

-   [ ] Definition
-   [ ] Binary relation representation
-   [ ] Unary relations
-   [ ] Properties of Binary relations
-   [ ] `Transitive closure`
-   [ ] Eauivalence relations adn partitions
-   [ ] `Partial orders` and total orders


## Functions {#functions}


## Logic and Spec ification Languages {#logic-and-spec-ification-languages}


## Propositional Logic {#propositional-logic}


## First Order Logic {#first-order-logic}

facts ==&gt; world
including:

-   [ ] Objects
-   Relation
-   Functions


## Combinatorics {#combinatorics}


### Problem sheet {#problem-sheet}

-   [ ] natotions for sums and products, including the factorial function.
-   [ ] Principles for counting permutations and combinations


## Probability and Statistics {#probability-and-statistics}

Test \\(\forall \epsilon > 0\\)


## Universal set {#universal-set}