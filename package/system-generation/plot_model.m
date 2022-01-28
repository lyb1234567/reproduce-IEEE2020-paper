function plot_model(D2D,CUE)
D2D_TX_x=[];
D2D_TX_y=[];
D2D_RX_x=[];
D2D_RX_y=[];
CUE_x=[];
CUE_y=[];
for i=1:size(D2D,1)
    D2D_TX_point=D2D{i,1};
    D2D_RX_point=D2D{i,2};
    D2D_TX_x(end+1)=D2D_TX_point(1,1);
    D2D_TX_y(end+1)=D2D_TX_point(1,2);
    D2D_RX_x(end+1)=D2D_RX_point(1,1);
    D2D_RX_y(end+1)=D2D_RX_point(1,2);
end

for k=1:size(CUE,1)
    CUE_x(end+1)=CUE(k,1);
    CUE_y(end+1)=CUE(k,2);
end
th = 0:pi/50:2*pi;
x=0;
y=0;
r=250;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
BS=0;
plot(xunit,yunit)
hold on
scatter([0],BS,140,'filled','d');
hold on
scatter(D2D_TX_x,D2D_TX_y);
hold on
scatter(D2D_RX_x,D2D_RX_y,'filled','s');
hold on
scatter(CUE_x,CUE_y,'^');
hold off
legend('System','BS','D2D_TX','D2D_RX','CUE');
title('Single cellular network')
xlabel('Location in x(m)')
ylabel('Location in y(m)')
set(gca,'FontSize',15,'FontWeight','Bold')
end