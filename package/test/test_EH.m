function test_EH()
a = 0;
b = 500*10^(-6);
r = (b-a).*rand(1,1000) + a;
EH_total=[];
PiR=[];
r=sort(r,'ascend');
for i=1:size(r,2)
    PiR(i)=r(i);
    EH=EH_model(PiR(i));
    EH_total(i)=EH;
end
EH_total=EH_total*10^(6);
PiR=PiR*10^(6);
plot(PiR,EH_total);
title('Piecewise linear EH model')
xlabel('Reveiver Power PR (µw)');
ylabel('Harvested Energy (µw)');
end