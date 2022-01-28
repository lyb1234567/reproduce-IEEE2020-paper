[D2D,CUE]=system_model(20,20,30);
Pkc=0.1995262315;
Pth1=1*10^(-6);
Pmax=0.1995262315;
Tmin=2;
[Sid,InfD,EhaD]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,50);
for i=1:size(Sid,1)
    temp=Sid{i,1};
    index=[];
    for k=1:size(temp,1)
        if temp(k,1)==0 && temp(k,2)==0
            index(end+1)=k;
        end
    end
    temp(index,:)=[];
    Sid{i,1}=temp;
end
Sid_temp=Sid;
% %去除所有0的部分
Sid=Sid(~cellfun('isempty',Sid));
for i=1:size(EhaD,2)
    Sid{i,2}=int2str(EhaD(i));
end
% 
% 
% 
EE={};
%模拟完成算法2和算法3之后，每一个D2D link i 对应一个 CUE k 都应该有自己的一个EE
for i=1:size(EhaD,2)
    temp=[];
    EE{i,1}=int2str(EhaD(i));
    for k=1:size(Sid{i,1},1)
         temp(k)=rand(1,1)*40+10;
    end
    EE{i,2}=temp;
end

% 同理，每一个CUE k 对应一个D2D link i, 也应该有对应的interfernce power
P_interference={};
for k=1:size(Sid,1)
    temp=[];
   for j=1:size(Sid{k,1},1)
       for i=1:size(EhaD,2)
           temp(j,i)=rand(1,1);
       end
   end
   P_interference{k,1}=temp;
end

%接下来就是建立preference list,每一个D2D link i 的preference list 中CUE k 根据 EE 从高到低进行排序
%每一个CUE k的 preference list 中D2D link i 根据 interfernce power 从低到高进行排序
Preference_D2D={};
for i=1:size(EhaD,2)
   Preference_D2D{i,1}=int2str(EhaD(i));
   temp=EE{i,2};
   temp_sort=sort(temp,'descend');
   Preference_list=[];
   for j=1:size(temp,2)
       Preference_list(j)=find(temp==temp_sort(j));
   end
   Preference_D2D{i,2}=Preference_list;
end

%建立 每一条 SWIPT-Supported D2D link i 上对应的每一个k的 preference list
Preference_CUE={};
for i=1:size(P_interference,1)
    Preference={};
    Preference_CUE{i,1}=int2str(EhaD(i));
    for k=1:size(P_interference{i,1},1)
        A=P_interference{i,1};
        temp=A(k,:);
        temp_sort=sort(temp,'ascend');
        Preference_list=[];
        for j=1:size(temp,2)
            Preference_list(j)=find(temp==temp_sort(j));
        end
        Preference{k,1}=Preference_list;
    end
    Preference_CUE{i,2}=Preference;
end


