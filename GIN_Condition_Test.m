function [Bolean,P_value,Statistic] = GIN_Condition_Test(X,Y,Z,Cov_M,alpha)
%Test(X(Y),X(Z)) whether satisfy GIN condition
%Input
    %X         dims-by-sample size Orginal Variables
    %Y:        The number of test Set
    %Z:        The number of condition Set
    %Cov_M     covariance matrix of observed variables
    %alpha     the significance level of independent test
%Output
    %Bolean     1 independent/ 0 not independent

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
%               Test the independence of E_X(Y)|X(Z) and X(Z)
%----------------------------------------------------------------------%
if sum(omega)==0
    Bolean=0;   %   trival solution
else
    R=omega'*X(Y,:);    %   E_X(Y)|X(Z)
    for j=1:N_Z
        [p_val,Sta]=UInd_KCItest(X(Z(j),:)',R'); % independence test using HSIC method 
        P_value(j) = p_val;
        Sta_value(j)=Sta;
    end
    %%%%%%%%%%%-----------all elements in X(Z) to test-------------%%%%%%%%%%%%%%%
    Test_method='Fisher method';    %  default method
%   Test_method='Normal method';    % one can use normal method to verify the theory of GIN
    switch Test_method
        case 'Normal method'
            Bolean=1;
            for k=1:N_Z
                if P_value(k)<(alpha)
                    Bolean=0;
                    break;
                end
            end
        case 'Fisher method'
            [Bolean,Fisher_pval]= FisherTest(P_value,alpha);
            P_value=Fisher_pval;
    end
    P_value=mean(P_value);
    Statistic=mean(Sta_value);
end
end

