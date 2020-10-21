function K = Find_CO_by_IT(C,Len,X,Latent_Number,Cov_M,alpha)
%Find the causal order by Independent test
Tem_L=1:Latent_Number;
K=[];
method='Sta';   % Default method
% method='P_value'; % One may also use this method
Iter=0;
while 1
    B=[];
    P=[];
    S=[];
    LLL=length(Tem_L);
    B=zeros(LLL,LLL);
    P=zeros(LLL,LLL);
    S=zeros(LLL,LLL);
    Iter=Iter+1;
    for i=1:LLL
        P_X=[];
        P_Z=[];
        for k=1:length(Len(Tem_L(i),:))
            Tem_C_X=C{Tem_L(i),k};
            P_X=[P_X Tem_C_X(1:Len(Tem_L(i),k))];
            if k==1
                P_Z=Tem_C_X(Len(Tem_L(i),k)+1:end);
            else
                P_Z=[P_Z Tem_C_X(Len(Tem_L(i),k)+1:2*Len(Tem_L(i),k))];
            end
        end
        Tem_P_X=[];
        Tem_All_P=[];
        for j=1:LLL
            if i~=j
                Tem_C_Z=C{Tem_L(j),1};
                Tem_P_X=[Tem_C_Z(1,1) P_X];
                %Test P_Z-->P_X
                [Bolean,PP,Statistic]= GIN_Condition_Test(X,Tem_P_X,P_Z,Cov_M,alpha);
                if Bolean==1
                    B(i,j)=1;%i-->j
                end
                Tem_All_P=[Tem_All_P; PP];
                [~,Fisher_pval]= FisherTest(PP,alpha);
                P(i,j)=Fisher_pval;
                %
                S(i,j)=Statistic;
                All_P_value{i,j,Iter}=PP;
            end
        end
    end
    switch method
        case 'P_value'
            P_sum=sum(P,2);%
            [P_a,P_b]=max(P_sum);
            K=[ K Tem_L(P_b)];
            Tem_L(P_b)=[];
        case 'Sta'
            S_sum=sum(S,2);
            [S_a,S_b]=max(S_sum);
            K=[K Tem_L(S_b)];
            Tem_L(S_b)=[];
    end
    if LLL==2
        K=[K Tem_L];
        break;
    end
    %update the CLuster
    for kkk=Tem_L
        C{kkk,length(K)+1}=C{K(end),1};
        Len(kkk,length(K)+1)=Len(K(end),1);
    end
end

end
