function lambda=lambda_fix_PiD(PiD,alpha,beta,gamma,delta,in,hiD,hki,kj,QiD)
Pkc=0.1995262315;
N0=1*10^(-13);
N1=1*10^(-13);
G=hiD*PiD;
H=hki*Pkc+N0;
K=beta+(QiD+in)*kj*(G+H);
A=1/log(2);
J=G*N1*A*(1+gamma);
a1=K*(G*H+H^(2));
a2=K*(G+2*H)*N1;
a3=K*N1^(2)-J;
lambda1=0;
lambda2=(-a2+sqrt(a2^(2)-4*a1*a3))/(2*a1);
lambda3=(-a2-sqrt(a2^(2)-4*a1*a3))/(2*a1);
lambda=max([lambda1 lambda2 lambda3]);

end