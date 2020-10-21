function x = laprnd(mu,sigma,m,n)%%%mu=0;均值；sigma=1;标准差，方差的开平方，m，n分别表示产生随机矩阵的行数和列数
% Reference: http://en.wikipedia.org/wiki/Laplace_distribution
% a 是位置参数（location parameter）  b ≥ 0 是尺度参数 （scale parameter），m，n分别表示产生随机矩阵的行数和列数
%http://zhidao.baidu.com/link?url=6Xn5jPj9yC6P-sI_Sw_6IpyEPbuWpAk13uKLjSv2sywaZWDz-UG0ra-FijsBuO84o-qTX09zsi2xnF4HAdOe_0xP-4-p4XQOF6QtkXckLhm    
% u = rand(m,n)-0.5;
% x = a - b*sign(u).*log(1-2*abs(u));
b=sigma/sqrt(2);      %根据标准差求相应的b
a=rand(m,n)-0.5;    %生成(-0.5,0.5)区间内均匀分布的随机数列 (一万个数的行向量);
x=mu-b*sign(a).*log(1-2*abs(a)); %生成符合拉普拉斯分布的随机数列
end