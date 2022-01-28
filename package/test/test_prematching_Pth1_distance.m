function test_prematching_Pth1_distance()
Pkc=0.1995262315;
Pth=[1*10^(-6) 3*10^(-6) 5*10^(-6) 7*10^(-6) 10*10^(-6)];
Pmax=0.1995262315;
Tmin=2;
total=[];
Total={};
for g=1:size(Pth,2)
 Pth1=Pth(g);
 total=[];
 for p=10:10:70
    fail_rate=[];
    for i=1:100
            [D2D,CUE]=system_model(30,30,p);
            for j=1:100
                [Sid,InfD,EhaD]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,p);
                fail=size(InfD,2)/30;
                fail_rate(i,j)=fail;
            end
	end
    fail_rate_total=sum(fail_rate(:))/10000;
    total(end+1)=fail_rate_total;
 end
 Total{g,1}=total;
end
Total
hold on
for i=1:size(Total,1)
number=10:10:70;
total=Total{i,1};
total_=100*total;
plot(number,total_,'-o');
title('Prematching failure rate[%]');
xlabel('r(m)');
ylabel('Prematching failure rate[%]');
end
lgd=legend('1*10^(-6)','3*10^(-6)','5*10^(-6)','7*10^(-6)','10*10^(-6)');
lgd.FontSize = 8;
saveas(gcf,[pwd '/simulation_results/Prematch_versus_distance_Pth.fig']);
end
