function [RX_x,RX_y]=RX(x,y,distance)
a=randperm(400,1)-200;
b=randperm(400,1)-200;
dist=hypot(x-a,y-b);
check1=(a==0);
check2=(b==0);
check=check1+check2;
while dist~=distance || a>200||a<-200 || b>200 ||b<-200||(check==1)
    a=randperm(400,1)-200;
    b=randperm(400,1)-200;
    dist=hypot(x-a,y-b);
    check1=(a==0);
    check2=(b==0);
    check=check1+check2;
end
RX_x=a;
RX_y=b;
end
