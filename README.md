# Generalized-Independent-Noise-Condition-for-Estimating-Latent-Variable-Causal-Graphs

Learning Causal Structure of Latent Variables for Linear Non-Gaussian Latent Variable Model (LiNGLaM).



## **Main Function**

function [Causal_Cluster,Causal_Order] = GIN_Main(X,alpha)

**Input:**

- X: dims-by-sample size
- alpha: significance level of the independence test.

**Output:**

- Causal_Cluster:     contain the causal cluster of observed variables
- Causal_Order:       contain the causal order of latent variables

See more details in the README.txt.

## Test Example

One may use the Example_GIN_Main.m to test our method.



### Notes

Our method relies heavily on independence tests, one can adjust some parameters, like kernel width, in the UInd_KCItest.m of the Package KCI, to ensure the accuracy.



### CITATION

If you use this code, please cite the following paper:

Feng Xie*, Ruichu Cai*, Biwei Huang, Clark Glymour, Zhifeng Hao, Kun Zhang*. Generalized Independent Noise Condition for Estimating Latent Variable Causal Graphs. NeurIPS 2020

If you have problems or questions, do not hesitate to send an email to xiefeng009@gmail.com.
