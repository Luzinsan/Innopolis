Decision trees:
- accurate (in prediction)
- interpretable: 
	- understanding and explaining model predictions and decisions,
	- uncovering underlying assumptions and relationships
	- gaining insights into model reasoning

# Decision Tree Classifier
1. Start with an empty tree
2. Make **decision stump** (select a feature to split data to maximize the ==information gain==)
   > Decision Tree Class Boundaries - when input space divided into axis-parallel rectangles and label each rectangle with on of the given classes (**majority class**) 
	- **Information Gain** (how well a given feature separates training data according to their target classification) 
	  $$IG(D_p, x_i) = I(D_p) - \sum_{k=1}^K\frac{N_{k}}{N_p}I(D_{k}),$$
	  - $IG$: Information Gain
	  - $x_i$: feature to perform the split
	  - $N_{p/k}$: number of samples in the parent/k_child node
	  - $D_{p/k_child}$: training subset of the parent/k_child node
	  - I: ==impurity== 
	  - entropy of a discrete random variable (a number that quantifies the uncertainty inherent in its possible outcomes)  $$I(t) = -\sum^C_{i=1}p^t_i\space log_2(p_i^t),$$
		  $t$ - a given node
		  $C$ - total number of classes
		  $p^t_i$ - the proportion of samples that belong to class $i$ at node $t$
	- Gini uncertainty (Gini impurity): $$I(t)_{Gini} = 1 -\sum^C_{i=1}(p^t_i)^2,$$
1. Stop if leave nodes are pure/no more features to split/a max node depth has reached/splitting a node does not lead to information gain (stopping criteria has met),
    otherwise repeat step 2 and 3 for each child node.

# Decision Trees Regression
1. Start with an empty tree
2. Make **decision stump** (select a feature $x_i$ to split data to maximize the ==MAE== (or MSE, etc.) with certain threshold $t$) 
   $$IG(D_p, x_i, t) = MSE(D_p) - (\frac{N_{left}}{N_p}MSE(D_{left} + \frac{N_{right}}{N_p}MSE(D_{right}))$$
   Where loss function is: $$MSE(D) = \frac{1}{N}\sum^N_{i=1}(y_i - \hat{y})^2,$$
   And predicted value is: $$\hat{y_t} = \frac{1}{N_t}\sum^{N_t}_{i=1}y_i$$ 