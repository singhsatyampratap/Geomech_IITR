function [PP]=PorePressure_calculator(Depthlog,fl_den,g,type) 
    
    %This Function calculates the pore pressure log 
    
    %input parameter
    %Depthlog: Depthlog array(in m)
    %fl_den: fluid density array or a constant value(kg/m3)
    %g: acceleration due to gravity(in m/s2)
    %type: hydrostatic or overpressure
    
    %Output parameter
    %PP: pore pressure array(in Pa)
    
    
    
    if length(fl_den)==1
        fl_den=fl_den*ones(length(Depthlog),1);
    end
    
    if type=='hydrostatic'
        PP=(fl_den).*Depthlog*g;
    end

end