## 1. **Recap and Introduction**
### Traditional Machine Learning vs. Deep Learning
#### Traditional Machine Learning:
- In traditional machine learning, you begin with **raw data**, but the features (patterns or characteristics from the data) are often **hand-crafted**. This means domain experts need to design or manually extract meaningful features for the model to process.
- The **machine learning model** then works with these hand-crafted features to produce an output or prediction. For example, in image classification (e.g., cat vs. dog):
  - Hand-crafted features could include **color**, **texture**, or **shape** features.
  - These features are manually chosen and extracted from the image.
  - The model processes these features and outputs a classification, such as "cat" or "dog."
- **Drawbacks**: This approach depends heavily on the quality of hand-crafted features. If the features are not well-designed, the model may fail to perform well.
#### Deep Learning:
- **Deep Learning** overcomes the limitations of hand-crafted features by learning features directly from the raw input data.
- Instead of manually defining what features to use, deep learning models can **learn to extract hierarchical features** through layers of neural networks.
  - For example, in image processing:
    - Lower layers might learn to detect **edges**.
    - Middle layers might learn to detect **shapes or contours**.
    - Higher layers might learn to recognize **objects** like eyes, faces, etc.
#### Conclusion:
- The **quality of feature representation** plays a critical role in the performance of machine learning models. Better representation makes it easier for the model to learn.
---
## 2. **Deep Artificial Neural Networks (DNNs)**
### Structure of a Deep Neural Network
- **Neural Networks** consist of several **layers**:
  - **Input Layer**: Takes the raw data (e.g., pixel values of an image).
  - **Hidden Layers**: These layers are "hidden" from the input/output; they process the input data using weighted connections. They are responsible for learning features.
  - **Output Layer**: Produces the final prediction or output.
- **Mathematical Model of a Neuron**:
  - Each neuron receives inputs from neurons in the previous layer.
  - The input for a neuron  j  in layer  l  is a **weighted sum** of the activations from the neurons in the previous layer $l-1$, plus a **bias term**:  $z_j = \sum_{i} w_{ij} a_i + b_j$
  Where:
  -  $w_{ij}$  is the **weight** from neuron $i$ to neuron $j$.
  -  $a_i$  is the **activation** of neuron  $i$  from the previous layer.
  -  $b_j$  is the **bias** for neuron $j$ .
- After computing the weighted sum, the neuron applies an **activation function**  $\sigma$  to introduce non-linearity:
  $a_j = \sigma(z_j)$
  Common activation functions include:
  - **Sigmoid function**:   $\sigma(z) = \frac{1}{1 + e^{-z}}$
  - **ReLU (Rectified Linear Unit)**:  $\sigma(z) = \max(0, z)$
  
  These functions allow the model to capture complex, non-linear relationships between the input and output.
### Layered Architecture and Hierarchical Features
- In DNNs, features are learned in a **hierarchical manner**. Lower layers detect basic features, while higher layers combine those features to form more complex ones.
  - For example, in image recognition:
    - **Layer 1** might learn edges.
    - **Layer 2** might combine edges into corners or shapes.
    - **Layer 3** might combine shapes into objects (like a nose, an ear).
- **Non-linearity** is crucial because it enables the network to learn complex relationships in the data that cannot be modeled by simple linear combinations.
---
## 3. **Motivation for DNNs**
### Feature Learning
- DNNs allow the network to **learn features directly from the data**, which is better than relying on manually created features.
### Hierarchical Features
- **Hierarchical Features** help group features at different levels. For example:
  - **Low-level features**: edges or textures in an image.
  - **High-level features**: objects or patterns detected from the combination of low-level features.
### Non-linearity
- **Non-linearity** (through activation functions) allows the network to capture relationships that are more complex than linear models can represent.
- The combination of **deep layers** and **non-linear activation functions** allows DNNs to excel in tasks like image classification, speech recognition, and many others.
---
## 4. **Neural Learning: Gradient Descent and Backpropagation**
### Gradient Descent
- The main goal of **neural learning** is to find the weights  $w$  and biases  $b$  that minimize the **cost function**  $C$ , which represents the error or loss of the model.
- The model uses **Gradient Descent** to update the weights and biases: $$w = w - \alpha \frac{\partial C}{\partial w}$$
  Where:
  -  $\alpha$ is the **learning rate** (controls the step size of the updates).
  -  $\frac{\partial C}{\partial w}$ is the **gradient** of the cost function with respect to the weight
### Cost Function
- The cost function $C$ measures the difference between the model’s prediction and the true value.
- For classification tasks, a common cost function is **cross-entropy loss**.
### Backpropagation
- **Backpropagation** is a method used to calculate the gradient of the cost function with respect to each weight and bias in the network.
- It works by applying the **chain rule** to compute the gradient for each layer, starting from the **output layer** and moving backward through the network.
### Steps in Backpropagation:
1. **Calculate the error at the output layer**.
   - The error for a neuron in the output layer is calculated as the difference between the predicted and actual output.
   - The gradient at the output layer can be written as:
   $\delta_j = \frac{\partial C}{\partial z_j} = \frac{\partial C}{\partial a_j} \cdot \frac{\partial a_j}{\partial z_j}$ 
2. **Propagate the error backward**.
   - For hidden layers, the error is computed using the errors from the next layer: $\delta_j = \sum_{k} \delta_k w_{jk} \cdot \sigma'(z_j)$   
   Where:
   -  $\delta_k$  is the error in the next layer.
   -  $w_{jk}$  is the weight from neuron $j$ in the current layer to neuron $k$  n the next layer.
3. **Update weights and biases**.
   - Weights and biases are updated using the computed gradients:  
      $$w_{ij} = w_{ij} - \alpha \delta_j a_i$$$$b_j = b_j - \alpha \delta_j$$
### Summary of Backpropagation:
- Backpropagation allows the network to **efficiently compute gradients** for all weights and biases using the chain rule.
- This process is repeated for each training example in the dataset, gradually updating the model to reduce the error.
---
## 5. **Summary of Deep Neural Networks**
- **DNNs** can automatically learn **hierarchical and non-linear features** from raw data, making them powerful tools for tasks that involve large, complex datasets.
- **Backpropagation** and **Gradient Descent** are essential components of neural learning, enabling the model to adjust its parameters to minimize the error.