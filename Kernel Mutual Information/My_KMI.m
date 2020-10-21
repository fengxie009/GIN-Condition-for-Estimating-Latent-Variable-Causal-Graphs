function NMI = My_KMI(X,Y)
%J = my_call_contrast([R(i,:,j); X(j,:)]); %using kernel based independence measure
% Author: Yasuhiro Sogawa
% Modified by SS (27 Sep 2010)
% my_call_contrast - set parameters of KernelICA.
% and call a contrast function employed in KernelICA.
% The details of the parameters are shown in section 4.5,
% "Kernel Independent Component Analysis" (F. R. Bachand and M.I.Jordan).
X = My_Standardize(X);
Y = My_Standardize(Y);
x=[X;Y];
[m,N]=size(x);

% set the parameters
contrast='kgv';
% contrast='kcca';
if N < 1000
    sigma=1;
    kappa=2e-2;
else % Added by SS (24 Sep 2010)
    sigma = 1/2;
    kappa = 2e-3;
    %     kappa = 2e-5;
end

kernel='gaussian';

mc=m;
kparam.kappas=kappa*ones(1,mc);
kparam.etas=kappa*1e-2*ones(1,mc);
kparam.neigs=N*ones(1,mc);
kparam.nchols=N*ones(1,mc);
kparam.kernel=kernel;
kparam.sigmas=sigma*ones(1,mc);

% Commented out by SS (24 Sep 2010)
% % scales data
% covmatrix=x*x'/N;
% sqrcovmatrix=sqrtm(covmatrix);
% invsqrcovmatrix=inv(sqrcovmatrix);
% x=invsqrcovmatrix*x;

% perform contrast function
MI = contrast_ica(contrast,x,kparam);

% Normalized Mutual Information
% [X_entropy,~]=mentappr(X');
% [Y_entropy,~]=mentappr(Y');
% NMI=MI/(X_entropy+Y_entropy);

NMI=MI;
end

