-------------------------------------------------------------------------------

BASIC INFO

Name of the pack: 	G (GIN algorithm)


Version:	0.0 (21 October 2020)

What it does:	Learning Causal Structure of Latent Variables for Linear Non-Gaussian Latent Variable Model (LiNGLaM).
		See the details in the following paper:
		Feng Xie*, Ruichu Cai*, Biwei Huang, Clark Glymour, Zhifeng Hao, Kun Zhang*. Generalized Independent Noise Condition for Estimating Latent Variable Causal Graphs. NeurIPS 2020


Requirements:	Matlab 

-------------------------------------------------------------------------------

USAGE

Main code files:

	GIN_Main.m		-the main function for learning the causal structure of latent variables

Subfunctions:

	Example_GIN_Main:		-a simple example to test our method
	Find_Causal_Clusters:   -Identifying Causal Clusters - Algorithm 1
    Find_CausalOrder:       -Learning the Causal Order of Latent Variables - Algorithm 2
-------------------------------------------------------------------------------

Independent Test(KCI)

This package is the KCI code package, which is modified by Kun Zhang and Jonas Peters.
Goal: To test if x and y are independent with bootstrap (which is the same as in HSIC test) or with the finite-sample Gamma approximation.

we use the UInd_KCItest.m to test the independence of any two variables,
available from 

http://people.tuebingen.mpg.de/kzhang/KCI-test.zip

Note: in order to ensure the accuracy of the independent test, one can adjust some parameters, like kernel width, in the UInd_KCItest.m.

For convenience, this code is supplied as part of this package, so there
should be no need for you to separately download this code. 

One may also directly use the original HSIC code package,
available from

http://www.gatsby.ucl.ac.uk/~gretton/indepTestFiles/indep.htm

Gretton, A., K. Fukumizu, C.-H. Teo, L. Song, B. Schoelkopf and A. Smola: A kernel Statistical test of independence. NIPS 21, 2007.
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

Kernel Mutual Information

We use the Kernel Independent Component Analysis package to calculate the mutual information.
available from

https://www.di.ens.fr/~fbach/kernel-ica/index.htm

For convenience, this code is supplied as part of this package, so there
should be no need for you to separately download this code.
Francis R. Bach, Michael I. Jordan. Kernel Independent Component Analysis, 
Journal of Machine Learning Research, 3, 1-48, 2002. 
-------------------------------------------------------------------------------

---
Updated 21 October 2020
Feng Xie 
xiefeng009@gmail.com

-------------------------------------------------------------------------------