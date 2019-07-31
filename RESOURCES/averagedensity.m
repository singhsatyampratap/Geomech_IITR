%calculating average density of the log
%setting percentage sensitivity to 2%

k=1;
m=1;
sum=0;
L=length(GOMDATA.Densitygcc);
for i=1:L
    if (GOMDATA.Densitygcc(i,1)<= GOMDATA.Densitygcc(m,1)+0.1*GOMDATA.Densitygcc(m,1) && GOMDATA.Densitygcc(i,1)>= GOMDATA.Densitygcc(m,1)-0.1*GOMDATA.Densitygcc(m,1) )
        sum=GOMDATA.Densitygcc(i,1)+sum;
    else
         avg(k)=sum/(i-m);
        sum=0;
        sum=GOMDATA.Densitygcc(i,1)+sum;
        m=i;
       dep(k)=GOMDATA.Depthft(m,1);
    k=k+1;   
    end    
end
stairs(avg,-1*dep);
    
