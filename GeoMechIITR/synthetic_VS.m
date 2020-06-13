
function log=synthetic_VS(log)
    %this function calculated the VS data using VP data
    %using Greenberg and Castagna correlations
    %default value a=0.8042
    %b=-855.9
    
    %Greenberg, M.L. and Castagna, J.P., Shear-Wave Velocity Estimation in
    %Porous Rocks: Theoretical Formulation, Preliminary Verification and
    %Application", Geophysical Prospecting, 40(2), pp 195-209, 1992
    
    if isfield(log,"VP")==0
        log=load_dtco(log)
    end
        
   prompt = {'a','b'};
   dlgtitle = 'Greenberg and Castagna Parameter';
   dims = [1 35];
   definput = {'0.8042','-855.9'};
   answer = inputdlg(prompt,dlgtitle,dims,definput);
   a=str2num(answer{1});
   b=str2num(answer{2});
    log.VS=a*log.VP+b;
    log.dtsm=1./log.VP;
    
end