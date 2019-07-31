%porosity calculation from real data set
len=length(GOMDATA.Densitygcc)
g=32;%acceleration due to gravity
denwater=0.0361273;%density of water
hydroPP=zeros(len,1);
eff_Sv=zeros(len,1);
for i=1:len
    porosity(i,1)=(2.7-GOMDATA.Densitygcc(i,1))/(2.7-1);
    hydroPP(i,1)=denwater*g*GOMDATA.Depthft(i,1);%hydrostatic pore pressure 
    eff_Sv(i,1)=SV(i,1)-hydroPP(i,1);
UCS(i,1)=3.87*exp(1.14*10^-10*GOMDATA.Depthft(i,1)
end

