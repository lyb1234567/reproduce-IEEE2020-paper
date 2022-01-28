function [SiD,InfD,EhaD,h_D2D,h_C_D2D,h_D2D_BS,h_CUE] = Prematch(D,C,Pkc,Pth1,Pmax,TminD,distance_D2D)
syms rayleigh_ki rayleigh_i_D
syms lambda_min T_max
EhaD=[];
InfD=[];
count_delete=0;
%pass loss exponent
pass_loss=3;
%N0 N1
N0=1*10^(-13);
N1=1*10^(-13);

%Set hDi hki hkc hiB
h_D2D=[];
h_C_D2D=[];
h_D2D_BS=[];
h_CUE=[];

%initialize BS
BS=[0 0];

for i=1:size(D,1)
    SiD{i,1}=C;
    count_delete=0;
    hD=exprnd(1)/(distance_D2D^(pass_loss));
    D2D_TX=D{i,1};
    D2D_RX=D{i,2};
    dis_i_BS=point_to_line(D2D_TX,D2D_RX,BS);
    hDB=exprnd(1)/(dis_i_BS^(pass_loss));
    h_D2D(i,1)=hD;
    h_D2D_BS(i,1)=hDB;
    for k=1:size(C,1)
        CUE_point=C(k,:);
        v1=D{i,1};
        v2=D{i,2};
        dis_k_D2D=point_to_line(v1,v2,CUE_point);
        hki=exprnd(1)/(dis_k_D2D^(pass_loss));
        
        dis_k_BS=hypot(CUE_point(1),CUE_point(2));
        hkc=exprnd(1)/(dis_k_BS^(pass_loss));
        h_CUE(k,1)=hkc;
        lambda_min=(Pth1)/(Pmax*hD+Pkc*hki+N0);
        T_max=log2(1+(Pmax*hD)/(Pkc*hki+N0+(N1)/(1-lambda_min)));
        h_C_D2D(i,k)=hki;
        if  lambda_min>1 || T_max<=TminD
            temp=SiD{i,1};
            temp(k,:)=[0 0];
            SiD{i,1}=temp;
            count_delete=count_delete+1;
        end
    end
   
    if  count_delete==k
        InfD(end+1)=i;
    elseif count_delete<k
        EhaD(end+1)=i;
    end

end
end
