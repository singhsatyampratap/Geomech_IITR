function log=synthetic_VP(log)
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
    if isfield(log,"Density")==0
        log=load_Density(log)
    end
        
   prompt = {'a','b'};
   dlgtitle = 'Gardner Parameter';
   dims = [1 35];
   definput = {'108','4'};
   answer = inputdlg(prompt,dlgtitle,dims,definput);
   a=str2num(answer{1});
   b=str2num(answer{2});
    
    log.VP=lab_data_model(3,[a,b],log.Density'/1000,0);
    log.VP=log.VP';
    log.dtco=1./ log.VP
    f = msgbox("Density Data can now be accessed as log.Density","Success");
end