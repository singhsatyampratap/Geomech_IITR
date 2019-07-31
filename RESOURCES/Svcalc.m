%stress magnitude in earth base on crustal stregth
%unit are in FPS
h=0:250:10000;%data resampled at 250 interval for faster calculation
h=h';
g=32;%acceleration due to gravity
u=0.6;
denwater=0.0361273;%density of water
len=length(h);
PP=zeros(len,1);
Sv=zeros(len,1);
Shmin=zeros(len,1);
avg=avg';
dep=dep';
for j=1:len
Sv(j,1)=0;
Sv(j,1)=g*avg(1,1).*dep(1,1)*0.0361273;
L=length(avg);
for i=2:L-1 %changed
    if (h(j,1)>dep(i,1))
    Sv(j,1)=Sv(j,1)+g*avg(i).*(dep(i,1)-dep(i-1,1))*0.0361273;
    else
        break;
    end
end
Sv(j,1)=Sv(j,1)+g*avg(i+1).*(h(j,1)-dep(i-1,1))*0.0361273+denwater*32*h(j,1);
PP(j,1)=0.433*h(j,1);%hydrostatic pressure condition different prssure condition can also be used 
Shmin(j,1)=((Sv(j,1)-PP(j,1))/(sqrt((u^2)+1)+u)^2)+PP(j,1);% based on he crsutal strenth theory
end
plot(Sv,-1*h);
hold on;
plot(PP,-1*h);
hold on;
plot(Shmin,-1*h)
