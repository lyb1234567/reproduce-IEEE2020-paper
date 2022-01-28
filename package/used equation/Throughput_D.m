function Throughput=Throughput_D(lambda,PiD,hiD,hki)
Pkc=0.1995262315;
N0=1*10^(-13);
N1=1*10^(-13);
A=(1-lambda)*PiD*hiD;
B=1-lambda;
C=Pkc*hki+N0;
Throughput=log2(1+(A/(B*C+N1)));
end