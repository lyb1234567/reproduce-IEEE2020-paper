function Sid_clean=clean_Sid(Sid)
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
Sid_clean=Sid(~cellfun('isempty',Sid));
end