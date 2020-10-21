function x = My_Standardize(x)
x=x-mean(x);
xstd=std(x);
x=x/xstd;
end

