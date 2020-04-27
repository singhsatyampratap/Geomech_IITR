function Density_log=synthetic_Density(Vp_log,a,b)
    %this function calculates sythentic density log using Pwave data using gardener
    %equation
    
    %input Parameter
    %Vp_log: Pwave Velocity log in m/s
    % a and b are coeff
    %a=0.23
    %b=0.25
    
    %output
    %density log in kg/m3
    
    %function used
    %see tool:lab_data_model
    
    Density_log=lab_data_model(3,[a,b],Vp_log',0);
    Density_log=Density_log' *1000;
end