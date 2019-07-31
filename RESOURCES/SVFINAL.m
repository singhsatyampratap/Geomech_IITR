l=length(GOMDATA.Depthft);
g=32;
SV=0;
SV=GOMDATA.Densitygcc(1)*g*(GOMDATA.Depthft(1));
for i=2:l
    SV(i,1)=SV(i-1,1)+GOMDATA.Densitygcc(i,1)*g*(GOMDATA.Depthft(i,1)-GOMDATA.Depthft(i-1,1));
end
