%calculating the poisson's ratio and Elasicity coeffiecent in case we have
%travel time data of Vs and Vp
L=length(GOMDATA.VP)
for i=1:L
    v(i,1)=(0.5*(GOMDATA.VP(i,1)/GOMDATA.VS(i,1))^2)-1)/((GOMDATA.VP(i,1)/GOMDATA.VS(i,1))^2-1);
    G(i,1)=GOMDATA.Densitygcc(1,1)*(GOMDATA.VS(i,1))^2;
    E(i,1)=2*G(i,1)*(1+ v(i,1));
end 
PP=0.433*h;
Shmin=PP+(Sv-PP)*v/(1-v);%in case leak off test is not known...can be validated using LOT