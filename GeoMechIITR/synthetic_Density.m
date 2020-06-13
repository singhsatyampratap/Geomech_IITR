function log=synthetic_Density(log)
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
    if isfield(log,"VP")==0
        log=load_dtco(log)
    end
        
   prompt = {'a','b'};
   dlgtitle = 'Gardner Parameter';
   dims = [1 35];
   definput = {'0.23','0.25'};
   answer = inputdlg(prompt,dlgtitle,dims,definput);
   a=str2num(answer{1});
   b=str2num(answer{2});
   log.Density=lab_data_model(3,[a,b],log.VP',0);
   log.Density=(log.Density')*1000;
   f = msgbox("Density Data can now be accessed as log.Density","Success");
      
end