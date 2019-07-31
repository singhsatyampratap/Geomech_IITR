%UCS calculation from real data set
len=length(GOMDATA.Densitygcc)
for i=1:len
UCS(i,1)=3.87*exp(1.14*10^-10*GOMDATA.Depthft(i,1)*GOMDATA.VP(i,1));

end

