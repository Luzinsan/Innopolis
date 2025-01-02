# History of the term
1. ==Classical probability== - if a random experiment (process with an uncertain outcomes) can result in $n$ *mutually exclusive and equally likely* outcomes, and if $n_A$ of these outcomes has an attribute $A$, then the probability of $A$ is the fraction $\frac{n_A}{n}$
   *(the probability of $A$ is the fraction $\frac{n_A}{n}$ where $n_A$ are the outcomes that has an attribute $A$ divided by mutually exclusive and equally likely outcomes which are results of random experiment)*
   **Basic assumption**: there is a finite number $n$ of possible outcomes
   **Examples**: roll of a dice, draw a card from a deck, toss of a coin.
   **Problems**: consider only finite events, definition of equally likely (circular), management of non physical problems for which there is no experiment.
   
1. ==Frequency probability== - the proportion of the sample (random & finite, from the population of interest) with an attribute "$a$" $Freq_a = \frac{n_a}{n}$ 
   We estimate $Pr[a]$ with $Freq_a$
   **Problems**: we cannot run infinite trials and our stopping point may induce ambiguities or errors in results, sometimes we cannot run repeatable experiments (such calls trials)
   
1. ==Axiomatic probability== - the sample space $\Omega$ is the set of possible outcomes of an experiment. 
   **Examples**: 
   - tossing a coin: $\Omega=\{H,T\}$ 
   - tossing a coin twice: $\Omega=\{HH, HT, TH, TT\}$ 
	   ==Event== - is a subset of $\Omega$
	   Examples:
	   - event $E$ $\{H\}$ in tossing a coin once
	   - event $E$ $\{HH, TT\}$ in tossing a coin twice
	   - 