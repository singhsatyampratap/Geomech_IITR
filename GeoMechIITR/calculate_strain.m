function log=calculate_strain(log)
    
    
             prompt = {"Strain in x-direction","Strain in y-direction"};
             dlgtitle = "Enter Tectonic strain Value" ;
    
            %definput = {'others'};
            ans = inputdlg(prompt,dlgtitle);
            ex=str2num(ans{1});
            ey=str2num(ans{2});
            
            log.ex=ex*ones(length(log.Depth),1);
            log.ey=ey*ones(length(log.Depth),1)
            

            log.other=[log.other,{"ex","ey"}];
            
            
            
            log.other=[log.other,{"ex","ey"}]
    
    
    
end