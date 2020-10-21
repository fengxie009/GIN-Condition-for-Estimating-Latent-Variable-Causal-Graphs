function x = laprnd(mu,sigma,m,n)%%%mu=0;��ֵ��sigma=1;��׼�����Ŀ�ƽ����m��n�ֱ��ʾ����������������������
% Reference: http://en.wikipedia.org/wiki/Laplace_distribution
% a ��λ�ò�����location parameter��  b �� 0 �ǳ߶Ȳ��� ��scale parameter����m��n�ֱ��ʾ����������������������
%http://zhidao.baidu.com/link?url=6Xn5jPj9yC6P-sI_Sw_6IpyEPbuWpAk13uKLjSv2sywaZWDz-UG0ra-FijsBuO84o-qTX09zsi2xnF4HAdOe_0xP-4-p4XQOF6QtkXckLhm    
% u = rand(m,n)-0.5;
% x = a - b*sign(u).*log(1-2*abs(u));
b=sigma/sqrt(2);      %���ݱ�׼������Ӧ��b
a=rand(m,n)-0.5;    %����(-0.5,0.5)�����ھ��ȷֲ���������� (һ�������������);
x=mu-b*sign(a).*log(1-2*abs(a)); %���ɷ���������˹�ֲ����������
end