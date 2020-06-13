function log=stress_around_well(log)
    
    
    
   
 

           
           
           set(gcf,'Position',[10 10 1000 1000])
               log=stress_around_well(log);
          
            
 surf(log.kirsch.plot_r,log.kirsch.plot_theta,log.kirsch.C0,'EdgeColor',"none");
  title("C0 Required")
 colorbar
 view(2)
 
           
           
 
    
end