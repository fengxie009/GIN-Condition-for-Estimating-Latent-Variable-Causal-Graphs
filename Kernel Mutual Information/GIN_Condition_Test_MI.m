function MI = GIN_Condition_Test_MI(X,Y,Z,Cov_M)
%Calculate the Mutual Information (MI) of E_X(Y)|X(Z) and X(Z)
%Input
    %X         dims-by-sample size Orginal Variables
    %Y:        The number of test Set
    %Z:        The number of condition Set
    %Cov_M     covariance matrix of observed variables
%Output
    %MI     the mean of all MI

%Start

%----------------------------------------------------------------------%
%               Estimating Parameter Omega
%----------------------------------------------------------------------%
%Using SVD decomposition to extimate omega
N_Y=length(Y);%N_Y:the nmuber of parameter equals Dim(Y)
N_Z=length(Z);%
if N_Y-1<=N_Z%
    B=Cov_M(Y,Z);
    A=B';% omega*B=0--->B'*omega'=0
    [~,~,V] = svd(A,'econ');
    omega = V(:,end);
else
    error('Please check the number of Y and Z, notice that |Y| is greater or equal to');
end
SP_value=[];

%----------------------------------------------------------------------%
%              Cal the MI of E_X(Y)|X(Z) and X(Z)
%----------------------------------------------------------------------%
if sum(omega)==0
    Bolean=0;   %   trival solution
else
    MI=[];
    R=omega'*X(Y,:);    %   E_X(Y)|X(Z)
    for j=1:N_Z
        Tem_MI=My_KMI(X(Z(j),:),R); %
        MI(j) = Tem_MI;
    end
    MI=mean(MI);
end
end

