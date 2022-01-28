function Nmax=find_Nmax(Pth,PiR_max)
Nmax=0;
for i=1:size(Pth,2)
    if PiR_max>Pth(i) && PiR_max<Pth(i+1)
        Nmax=i+1;
    end
    if i==size(Pth,2) && PiR_max>Pth(i)
        Nmax=i;
    end
end