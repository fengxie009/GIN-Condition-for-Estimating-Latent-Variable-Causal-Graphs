function [std_m] = std_moment(y,i)
%   std_moment calculates the standardized moment of the 'i'th order
%   y            is the input which can be a vector or a matrix
%                if y is a vector it does not matter if it is column or row
%                vector, either way the output is scalar.
% 
%                if y is a matrix then the each row of y is considered a
%                vector and the output will be a column vector.
% 
%   std_m        is the output which is the 'i'th moment.
[r,c]=size(y);
if r==1 
    mu=mean(y);
    nom=(sum((y-mu).^i)/c);
    den=((sum((y-mu).^2)/c))^(i/2);
    mu_i=nom/den;
    std_m=mu_i;
elseif  c==1
    mu=mean(y);
    nom=(sum((y-mu).^i)/r);
    den=((sum((y-mu).^2)/r))^(i/2);
    mu_i=nom/den;
    std_m=mu_i;
else
    std_m=zeros(r,1);
    for k=1:r
        z=y(k,:);
        mu=mean(z);
        nom=(sum((z-mu).^i)/c);
        den=((sum((z-mu).^2)/c))^(i/2);
        mu_i=nom/den;
         std_m(k,1)=mu_i;
    end

end

