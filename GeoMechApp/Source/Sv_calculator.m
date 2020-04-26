function [Sv]=Sv_calculator(Densitylog,Depthlog,lith_den,g,type)
    %this function calculates the vertical overburden stress
    
    %input parameters
    %Densitylog: in kg/m3
    %Depthlog: in m
    %lith_den:average density of rock above the starting point 
    %g: acceleration due to gravity
    
    %output parameter
    %Sv: vertical stress(in Pa)
               
    
    l_density=length(Depthlog);
    Sv=zeros(l_density,1);
    Sv(1)=lith_den*g*Depthlog(1);

    for i=2:l_density
          Sv(i)=Sv(i-1)+Densitylog(i)*g*(Depthlog(i)-Depthlog(i-1));
    end
    
    
    
end