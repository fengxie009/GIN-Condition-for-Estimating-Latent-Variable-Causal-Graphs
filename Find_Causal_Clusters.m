function [Causal_Cluster,Cluster_Number] = Find_Causal_Clusters(X,Cov_M,alpha)
%Identifying Causal Clusters - Algorithm 1
%Input
%X         dims-by-sample size
%Cov_M     covariance matrix of observed variables
%alpha     the significance level of independent test
%Output
%Causal_Cluster     contain the causal cluster of observed variables
%Latent_Number      the number of causal clusters(Latents)

%Start
dims=size(X,1); %   dims: number of observed variables
V=1:dims;
V_Left=1:dims;
Num_Confounder=0;
Cluster_Number=0;
Causal_Cluster=[];
while 1
    Num_Confounder=Num_Confounder+1;
    Test_Variable_Length=Num_Confounder+1;
    fprintf('Test %d Latent Variable\n',Num_Confounder);
    Tem_L=length(V_Left);
    if Tem_L<=Num_Confounder+1
        break;
    end
    P=nchoosek(V_Left,Test_Variable_Length);	%All possible cases to be tested
    Tem_Cluster=[];
    V_Save=[];
    for i=1:size(P,1)
        Tem_Z=setdiff(V,P(i,:));
        [Boolean,~,~]= GIN_Condition_Test(X,P(i,:),Tem_Z,Cov_M,alpha);	%GIN Test
        if Boolean
            Tem_Cluster=[Tem_Cluster;P(i,:)];   %Save it to Tem_Cluster
            V_Save=[V_Save,P(i,:)];
        end
    end
    V_Save=unique(V_Save);
    if ~isempty(Tem_Cluster)
        [Causal_Cluster,Cluster_Number] = Merge_Overlapping_Cluster(Causal_Cluster,Tem_Cluster,Cluster_Number);
    else
        break;
    end
    V_Left=setdiff(V_Left,V_Save);
    if isempty(V_Left)
        break;
    end
end
end

