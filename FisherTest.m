function [Bolean,Fisher_pval]= FisherTest(Test_Pvalue,alpha)
Fisher_stat=0;
L=length(Test_Pvalue);
for i=1:L
    if Test_Pvalue(i)==0
        TP=1e-05;
    else
        TP=Test_Pvalue(i);
    end
    Fisher_stat = Fisher_stat - 2*log(TP);
end
Fisher_pval = 1-chi2cdf(Fisher_stat, 2*L);
if Fisher_pval>alpha
    Bolean=1;
else
    Bolean=0;
end

end

