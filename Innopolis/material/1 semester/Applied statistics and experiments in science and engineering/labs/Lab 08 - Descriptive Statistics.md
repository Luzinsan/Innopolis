## Discrete random variables
> **A discrete random variable (stochastic variable)** is a variable that can take any whole number values as outcomes of a random experiment.
> Examples of a discrete random variable: 
> - Binomial random variable 
> - Geometric random variable
> - Bernoulli Random Variable
> - Poisson random variable
> Mean: $E[X] = \sum{x P(X=x)} = \mu$, where $P(X=x)$ - the probability mass function
> Variance: $Var(X) = \sum{(x-\mu)^2 P(X=x)} = \sum{x^2 P(X=x) - \mu^2}$ 

## Continuous random variables
> A random variable X is continuous if possible values comprise either a single interval on the number line or a union of disjoint intervals.
> Example: If in the study of the ecology of a lake, $X$, the r.v. may be depth measurements at randomly chosen locations.
> **Probability distribution (probability density function ($pdf$))** of $X$ is a function $f(x)$ s.t. $\forall$ two numbers $a$ and $b$ with $a <= b$, we have:
> $P(a\le X \le b) = \int_a^b{f(x)dx}$

## Descriptive statistics

## Z-score
> **Z-score** is a numerical measurement that describes a value's relationship to the mean of a group of values and is measured in terms of standard deviations from the mean.
> It indicates how many standard deviations a data point is from the mean of the distribution.
> $z = \frac{x-\mu}{\sigma}$ 
> In most large data sets (assuming a normal distribution of data), 
> - 99.7% of values lie between -3 and 3 standard deviations, 
> - 95% between -2 and 2 standard deviations, 
> - 68% between -1 and 1 standard deviations.