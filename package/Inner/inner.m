function [lambda,P_iD,EE]=inner(D2D,CUE,EhaD,Sid,I,phi,hiD,hki,hiB,hkc)
%established parameter
Pmax=0.1995262315;
Pkc=0.1995262315;
Pth=[10 100 230.06 57368]*10^(-6);
kj=[ 0 0.3899 0.6967 0.1427];
b=[0 -1.6613 -19.1737 108.2778]*10^(-6);
N0=1*10^(-13);
N1=1*10^(-13);
pass_loss=3;
Tmin_D=2;
Tmin_C=1;
lambda=[];
PiD=[];
EE=[];

s1=1*10^(-5);
s2=1*10^(-5);
s3=1*10^(-5);
s4=1*10^(-5);
s5=1*10^(-5);
for i=1:size(EhaD,2)
    PS_iD=Sid{i,1};
    hki_sub=hki{i,1};
    hD=hiD(EhaD(i));
    hDB=hiB(EhaD(i),1);
    for k=1:size(PS_iD,1)
        CUE_point=PS_iD(k,:);
        CUE_location=location_CUE(CUE,CUE_point);
        hkc_=hkc(CUE_location,1);
        hki_=hki_sub{k};
        PiR_max=Pmax*hD+Pkc*hki_+N0;
        [EH,Nmax]=EH_model(PiR_max);
        for j=1:Nmax
            t=1;
            PiD_iteration=[];
            QiD_iteration=[];
            lambda_iteration=[];
            %initialize PiD(0)
            PiD_iteration(t)=rand(1)*0.2;
            
            %initialize Q
            QiD_iteration(t)=rand(1);
            
            %initialize all the lagrange multipliers
            alpha=0.1;
            beta=0.1;
            gamma=0.1;
            delta=0.1;
            in=0.1;
            
            %EH coefficient initialization

            kj_=kj(j);
            %calculate the initial power splitting ratio
            lambda_iteration(t)=lambda_fix_PiD(PiD_iteration(t),alpha,beta,gamma,delta,in,hD,hki_,kj_,QiD_iteration(t));
            a=lambda_iteration(t)
            while t<=I
                PiD_iteration(t+1)=PiD_fix_lambda(lambda_iteration(t),alpha,beta,gamma,delta,in,hD,hki_,hkc_,hDB,kj_,QiD_iteration(t));
                lambda_iteration(t+1)=lambda_fix_PiD(PiD_iteration(t+1),alpha,beta,gamma,delta,in,hD,hki_,kj_,QiD_iteration(t));
                t=t+1;
            end
        end
                PiR=received_power(lambda_iteration(t+1), PiD_iteration(t+1),hD,hki_);
                EH=EH_model(PiR);
                T_D=Throughput_D(lambda_iteration(t+1),PiD_iteration(t+1),hD,hki_);
                EC_iD=Energy_Consumption(PiD_iteration(t+1),EH);
                T_C=Throughput_C(hkc,hiB,PiD_iteration(t+1));
                if T_D-EC_iD*QiD_iteration(t)<phi
                    lambda(i,j)=lambda_iteration(t+1);
                    PiD(i,j)=PiD_iteration(t+1);
                    EE(i,j)=QiD_iteration(t);
                    break;
                else
                    %update all the lagrange multipliers
                    alpha_=alpha-s1*(PiD_iteration(t+1)-Pmax);
                    alpha=max([0 alpha_]);
                    
                    beta_=beta-s2*(lambda_iteration(t+1)-1);
                    beta=max([0 beta_]);
                    
                    gamma_=gamma-s3*(T_D-Tmin_D);
                    gamma=max([0 gamma_]);
                    
                    delta_=delta-s4*(T_C-Tmin_C);
                    delta=max([0 delta_]);
                    
                    in_=in-s5*(PiR-Pth(1));
                    in=max([0 in_]);
                    
                    %update Q
                    QiD_iteration(t+1)=T_D/EC_iD;
                    continue;
                end
                t=t+1;
            end
        end
    end
end