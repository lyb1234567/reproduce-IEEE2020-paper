function PiR=received_power(lambda,PiD,hiD,hki)
Pkc=0.1995262315;
N0=1*10^(-13);
PiR=lambda*(PiD*hiD+Pkc*hki+N0);
end