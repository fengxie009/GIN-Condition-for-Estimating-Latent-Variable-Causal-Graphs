function K = Find_CO_by_MI(C,Len,X,Latent_Number,Cov_M)
%Find the causal order by Mutual Information
addpath(genpath('.\Kernel Mutual Information'));
Tem_L=1:Latent_Number;
K=[];
Iter=0;%
while 1
    MI=[];
    LLL=length(Tem_L);
    MI=zeros(LLL,LLL);
    Iter=Iter+1;
    for i=1:LLL %P
        P_X=[];
        P_Z=[];
        for k=1:length(Len(Tem_L(i),:))
            Tem_C_X=C{Tem_L(i),k};
            P_X=[P_X Tem_C_X(1:Len(Tem_L(i),k))];
            if k==1
                P_Z=Tem_C_X(Len(Tem_L(i),k)+1:end);%
            else
                P_Z=[P_Z Tem_C_X(Len(Tem_L(i),k)+1:2*Len(Tem_L(i),k))];
            end
        end
        for j=1:LLL%Q
            if i~=j
                Tem_C_Z=C{Tem_L(j),1};
                Tem_P_X=[Tem_C_Z(1,1) P_X];
                %test P_Z-->P_X
                Tem_MI = GIN_Condition_Test_MI(X,Tem_P_X,P_Z,Cov_M);
                MI(i,j)=Tem_MI;
            end
        end
    end
    
    MI_sum=sum(MI,2);%
    [P_a,P_b]=min(MI_sum);
    K=[ K Tem_L(P_b)];
    Tem_L(P_b)=[];
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
