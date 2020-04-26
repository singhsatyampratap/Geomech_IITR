function [E,G,M,v]= elastic_parameter(Vplog,Vslog,Densitylog)
    
    %This function calculates thr elastic paramater like young's modulus, poisson's ratio
    %and shear modulus
    
    
    %input parameter
    % Vplog:P wave velocity array(in m/s)
    % Vslog:S wave velocity array(in m/s)
    % Densitylog:Density log array(in kg/m3)
    
    
    %outptut
    % v = ½ (VP^2 − 2VS^2) / (VP^2 − VS^2)
    % G= density*VS^2
    % E= 2*G.*(1+v)
    % M= density*VP^2
    v=0.5*((((Vplog./Vslog).^2)-2)./(((Vplog./Vslog).^2)-1));
    G=Densitylog.*((Vslog).^2);
    E=2*G.*(1+v);
    M=Densitylog.*((Vplog).^2);
end