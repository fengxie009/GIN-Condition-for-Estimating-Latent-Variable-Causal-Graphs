function [F_Cluster,Cluster_Number] = Merge_Overlapping_Cluster(F_Cluster,Cluster,Cluster_Number)
%Merge the overlapping clusters
Tem_Cluster=Cluster; %Clusters to be merged
Test_Num_Latent=size(Cluster,2)-1;
V_Tem=[];
Tem_Number=0;
while 1
    [m,~]=size(Tem_Cluster);
    if m==0
        break;
    elseif m==1
        Cluster_Number=Cluster_Number+1;
        Mer_Posi_Cluster=Tem_Cluster(1,:);
        F_Cluster(Cluster_Number).a=Mer_Posi_Cluster;
        F_Cluster(Cluster_Number).b=Test_Num_Latent;
        break;%没有需要判断的行
    else
        Mer_Posi_Cluster=Tem_Cluster(1,:);
        Tem_Cluster(1,:)=[];
        while 1
            LL=size(Tem_Cluster,1);
            Tag=0;
            for i=1:LL
                if ~isempty(intersect(Mer_Posi_Cluster,Tem_Cluster(i,:)))
                    Mer_Posi_Cluster=unique([Mer_Posi_Cluster Tem_Cluster(i,:)]);
                    Tem_Cluster(i,:)=[];
                    break;
                end
                if i==LL
                    Tag=1;
                end
            end
            if Tag==1
                Cluster_Number=Cluster_Number+1;
                F_Cluster(Cluster_Number).a=Mer_Posi_Cluster;
                F_Cluster(Cluster_Number).b=Test_Num_Latent;
                break;
            end
            if isempty(Tem_Cluster)
                Cluster_Number=Cluster_Number+1;
                F_Cluster(Cluster_Number).a=Mer_Posi_Cluster;
                F_Cluster(Cluster_Number).b=Test_Num_Latent;
                break;
            end
        end
    end
end
end

