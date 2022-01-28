function [D2D_group,CUE_group]=system_model(number_D2D,num_CUE,distance)
D2D_TX_coord=[];
CUE_coord=[];
RX_coord=[];
for i=1:number_D2D
    D2D_TX_coord
    x=randperm(400,1)-200;
    y=randperm(400,1)-200;
    check1=x==0;
    check2=y==0;
    check=check1*check2;
    isempty(D2D_TX_coord)
    if isempty(D2D_TX_coord)
        if x^(2)+y^(2)<=200^2 && check==0
           D2D_TX_coord(i,1)=x;
           D2D_TX_coord(i,2)=y;
        else
            while x^(2)+y^(2)>200^2 ||check==1
              x=randperm(400,1)-200;
              y=randperm(400,1)-200; 
              check1=x==0;
              check2=y==0;
              check=check1*check2;
            end
            D2D_TX_coord(i,1)=x;
            D2D_TX_coord(i,2)=y;
        end
    elseif isempty(D2D_TX_coord)==0
        find=false;
        while find==false
            if x^(2)+y^(2)<=200^2 && ~any(D2D_TX_coord(:,1)==x)&& check==0
            D2D_TX_coord(i,1)=x;
            D2D_TX_coord(i,2)=y;
            find=true;
            else
             x=randperm(400,1)-200;
             y=randperm(400,1)-200;
             check1=x==0;
             check2=y==0;
             check=check1*check2;
            end
        end
    end
end
for j=1:num_CUE
    x_C=randperm(400,1)-200;
    y_C=randperm(400,1)-200;
    check_x_C=x_C==0;
    check_y_C=y_C==0;
    check_C=check_x_C*check_y_C;
    if isempty(CUE_coord)
        if x_C^(2)+y_C^(2)<=200^2 && check_C==0
           CUE_coord(j,1)=x_C;
           CUE_coord(j,2)=y_C;
        else
            while x_C^(2)+y_C^(2)>200^2 ||check_C==1
              x_C=randperm(400,1)-200;
              y_C=randperm(400,1)-200;
              check_x_C=x_C==0;
              check_y_C=y_C==0;
              check_C=check_x_C*check_y_C;
            end
            CUE_coord(j,1)=x_C;
            CUE_coord(j,2)=y_C;
        end
    else
        find_C=false;
        while find_C==false
            if x_C^(2)+y_C^(2)<=200^2 && ~any(CUE_coord(:,1)==x_C)&&~any(D2D_TX_coord(:,1)==x_C)&& check_C==0
                CUE_coord(j,1)=x_C;
                CUE_coord(j,2)=y_C;
                find_C=true;
                break;
            else
                x_C=randperm(400,1)-200;
                y_C=randperm(400,1)-200;
                check_x_C=x_C==0;
                check_y_C=y_C==0;
                check_C=check_x_C*check_y_C;
            end
        end
    end
end

for i=1:size(D2D_TX_coord,1)
    temp=D2D_TX_coord(i,:);
    x=temp(1);
    y=temp(2);
    [a,b]=RX(x,y,distance);
    RX_coord(i,:)=[a b];
end
temp_D2D={};
temp_CUE={};
for i=1:number_D2D
    temp_D2D{i,1}=D2D_TX_coord(i,:);
    temp_D2D{i,2}=RX_coord(i,:);
end
D2D_group=temp_D2D;
for k=1:num_CUE
    temp_CUE{k,1}=CUE_coord(k,:);
end
for p=1:size(temp_CUE,1)
    CUE_group(p,:)=temp_CUE{p,1};
end
end