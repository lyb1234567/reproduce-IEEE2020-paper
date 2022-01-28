function Throughput=Throughput_C(hkc,hiB,PiD)
N0=1*10^(-13);
N1=1*10^(-13);
Pkc=0.1995262315;
A=Pkc*hkc;
B=PiD*hiB+N0+N1;
SNR=A/B;
Throughput=log2(1+SNR);
end
