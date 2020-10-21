function K= Find_Causal_Order(X,F_Cluster,Latent_Number,Cov_M,alpha)
%Learning the Causal Order of Latent Variables - Algorithm 2
%Identifying Causal Clusters - Algorithm 1
%Input
    %X         dims-by-sample size
    %F_Cluster
    %Latent_Number      the number of causal clusters(Latents)
    %Cov_M     covariance matrix of observed variables
    %alpha     the significance level of independent test
%Output
    %K     Causal Order of Latent Variables

%Start
for i=1:Latent_Number
    C{i,1}=F_Cluster(i).a;  
    Len(i,1)=F_Cluster(i).b;    %   the i-th cluster has j latent variables
end

method=1;
if method==1
    %default method-Mutual Information
    K = Find_CO_by_MI(C,Len,X,Latent_Number,Cov_M);
else
    %another method-HSIC independence test
    K = Find_CO_by_IT(C,Len,X,Latent_Number,Cov_M,alpha);
end
end

