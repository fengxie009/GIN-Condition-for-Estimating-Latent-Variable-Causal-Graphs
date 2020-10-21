function [Causal_Cluster,Causal_Order] = GIN_Main(X,alpha)
%Input
    %X         dims-by-sample size
    %alpha     Set the significance level of independent test
%Output
    %Causal_Cluster     contain the causal cluster of observed variables
        %Causal_Cluster(i).a    causal cluster set
        %Causal_Cluster(i).b    number of latent parents,
    %Causal_Order       contain the causal order of latent variables

%Start
%Add the path of method of independent test
% addpath('.\KCI');
addpath(genpath('.\KCI'));
fprintf('Using KCI for Independent Test\n');

[dims,samples]=size(X);
%Remove the Mean of Variables
X = X - mean(X,2)*ones(1,samples);
Cov_M=cov(X');  %   covariance matrix of observed variables

%----------------------------------------------------------------------%
%               Step 1: Finding the Causal Clusters
%----------------------------------------------------------------------%

fprintf('Runing the Step 1: Finding the Causal Clusters\n');
[Causal_Cluster,Cluster_Number] = Find_Causal_Clusters(X,Cov_M,alpha);
fprintf('Here, we find %d clusters \n',Cluster_Number);
for i=1:Cluster_Number
    fprintf('The %d cluster contains \n',i);
    Lag=Causal_Cluster(i).a;
    disp(Lag);
end

%----------------------------------------------------------------------%
%           Step 2: Learning the Causal Order of Latent Variables
%----------------------------------------------------------------------%

fprintf('Runing the Step 2: Learning the Causal Order of Latent Variables\n');
if Cluster_Number==0
    K=[];
    fprintf('There is no cluster and Stop runing the next Step\n');
else
    %
    if Cluster_Number==1
        K=1;
        fprintf('Notet that there exist only one latent variable\n');
    else
        K= Find_Causal_Order(X,Causal_Cluster,Cluster_Number,Cov_M,alpha);
    end
end
fprintf('The Causal Order of Latent Variables is as following \n');
Causal_Order=K;
% for i=1:length(K)
%     fprintf('The %d latent variable is \n',i);
%     Lag=F_Cluster(K(i)).a;
%     disp(Lag);
% end
end

