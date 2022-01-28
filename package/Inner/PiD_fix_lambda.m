function PiD=PiD_fix_lambda(lambda,alpha,beta,gamma,delta,in,hiD,hki,hkc,hiB,kj,QiD)
syms eta
Pkc=0.1995262315;
N0=1*10^(-13);
N1=1*10^(-13);
m1=(1+gamma)*(1/log(2))*hiD;
m2=Pkc*hki+N0+(N1/(1-lambda));
m3=QiD*(1+(1-lambda)*0.7*hiD-kj*hiD)+alpha-in*lambda*kj*hiD;
m4=Pkc*hkc*hiB*(1/log(2))*delta;
m5=N0+N1;
m6=Pkc*hkc;
b1=m3*hiD*hiB^(2);
b2=(2*m3*m5+m3*m6)*hiD*hiB-(m1-m2*m3)*hiB^(2);
b3=(m3*m5^(2)+m3*m5*m6+m4)*hiD-(2*m1*m5+m1*m6-2*m2*m3*m5-m2*m3*m6)*hiB;
b4=m2*m4+m2*m3*m5^(2)+m2*m3*m5*m6-m1*m5^(2)-m1*m5*m6;
xN=(-m2/(3*m1));
yN=((2*b2^(3))/(27*b1^(2)))-((b2*b3)/(3*b1))+b4;
g=2*b1*(sqrt((b2^(2)-3*b1*b3)/(9*b1^(2))))^(3);
phi=(1/3)*acos(-yN/g);
test=yN/(2*b1);
yN
if test^(1/3)>0
    theta=sqrt((m2^(2)-3*m1*m3)/(9*m1^(2)));
elseif test^(1/3)<=0
    theta=-sqrt((m2^(2)-3*m1*m3)/(9*m1^(2)));
end
theta
if yN^(2)>g^(2)
    A=sqrt(yN^(2)-g^(2));
    B=-yN;
    C=2*b1;
    P1=xN+((B+A)/C)^(1/3)+((B-A)/C)^(1/3);
elseif yN^(2)==g^(2)
    P1=[xN-theta xN+2*theta];
else
    n=[0 1 2 ];
    D=((2*pi)/3)*n;
    P1=xN+2*theta*cos(phi-D);
end
PiD=max([0 P1]);
end