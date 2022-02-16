function test_PiD_fix_lambda()
lambda=0.00071;
 alpha=0.1;
 beta=0.1;
 gamma=0.1;
 delta=0.1;
 in=0.1;
 hkc=2.707*10^(-6);
 hki=3.7429*10^(-7);
 hiD=1.1527*10^(-4);
 hiB=4.9154*10^(-7);
 k=0.6967;
 b=-19.1737*10^(-6);
 QiD=rand(1);
 PiD=PiD_fix_lambda(lambda,alpha,beta,gamma,delta,in,hiD,hki,hkc,hiB,k,QiD);
 PiD
end