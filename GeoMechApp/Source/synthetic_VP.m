function Vp_log=synthetic_VP(Density_log,a,b)
     %this function calculates synthetic P-wave value using inverse gardener
    %equation
    
    %input Parameter
    %Density_log: Pwave Velocity log in m/s
    % a and b are coeff
    %a=108
    %b=4
    
    %output
    %Vp_log in m/s
    
    %function used
    %see tool:lab_data_model
    
    Vp_log=lab_data_model(3,[a,b],Density_log'/1000,0);
    Vp_log=Vp_log';
end