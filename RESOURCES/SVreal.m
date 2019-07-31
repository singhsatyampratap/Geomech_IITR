%svcalculation for real data
l_den=length(GOMDATA.Densitygcc)
g=32;
Sv=zeros(l_den,1)
Sv(1,1)=g*GOMDATA.Densitygcc(1,1).*GOMDATA.Depthft(1,1)*0.0361273;
den_water=0.0361273;
for i=2:l_den
    Sv(i,1)=Sv(i-1,1)+GOMDATA.Densitygcc(i,1)*g*(GOMDATA.Depthft(i,1)-GOMDATA.Depthft(i-1,1))*0.0361273;
end
plot(Sv);