function [EH,j]=EH_model(PiR)
Pth=[10 100 230.06 57368]*10^(-6);
k=[0 0.3899 0.6967 0.1427];
b=[0 -1.6613 -19.1737 108.2778]*10^(-6);
j=0;
P_EH_max=250*10^(-6);
for i=1:size(Pth,2)
    if PiR<=Pth(i)
        j=i-1;
        break;
    else
        j=j+1;
        if j>=size(Pth,2)
            j=size(Pth,2);
        end
    end  
end

if j==0
    EH=0;
end
if j>=1 && j<=size(Pth,2)-1
    EH=PiR*k(j)+b(j);
end
if j>=size(Pth,2)-1 && j<=size(Pth,2)
    EH=P_EH_max;
end
end