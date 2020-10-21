%The structure of example is in Figure 1 of our Paper
%    L1->L2,{L1,L2}->{L3,L4},and L3->L4 
%   {L1,L2}->{X1,X2,X3,X4}, L3->{X5, X6}, and L4->{X7, X8}
clear all;clc;
nSample=1000;   %Sample size
%Latent variables
nr=0.2;%noise ratio
L(1,:)=mapstd(unifrnd (-1,1,1,nSample).^5);
L(2,:)=0.5*L(1,:)+nr*mapstd(unifrnd (-1,1,1,nSample).^5);
L(3,:)=0.3*L(1,:)+0.6*L(2,:)+nr*mapstd(unifrnd (-1,1,1,nSample).^5);
L(4,:)=0.6*L(1,:)+0.4*L(2,:)+0.5*L(3,:)+nr*mapstd(unifrnd (-1,1,1,nSample).^5);
%Observed variables
X([1:4],:) = [0.3 -0.6; 1.2 0.4; 0.5 0.7; 0.3 0.9]*L([1 2],:) + nr * mapstd(unifrnd (-1,1,4,nSample).^5);
X([5:6],:) = [0.6; 1.4]*L(3,:) + nr * mapstd(unifrnd (-1,1,2,nSample).^5);
X([7:8],:) = [2.5; 0.8]*L(4,:) + nr * mapstd(unifrnd (-1,1,2,nSample).^5);
alpha=0.01;
%Test our method
[Causal_Cluster,Causal_Order] = GIN_Main(X,alpha);