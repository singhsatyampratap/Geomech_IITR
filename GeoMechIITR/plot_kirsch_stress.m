function plot_kirsch_stress(log)
    
    
           set(gcf,'Position',[10 10 2000 2000])
         log=stress_around_well(log);
                      
    
    subplot(2,2,1) 
 surf(log.kirsch.plot_r,log.kirsch.plot_theta,log.kirsch.sigma_rr,'EdgeColor',"none");
  title("\sigma _{rr}")
 colorbar
 view(2)
 
 
 
  subplot(2,2,2)  
 surf(log.kirsch.plot_r,log.kirsch.plot_theta,log.kirsch.sigma_theta,'EdgeColor',"none");
  title("\sigma _{\theta\theta }")
  colorbar
 view(2)
 
 
 
  subplot(2,2,3)  
 surf(log.kirsch.plot_r,log.kirsch.plot_theta,log.kirsch.tau_r_theta,'EdgeColor',"none");
 view(2)
  title("\tau _{r\theta }")
  colorbar
 
 
  subplot(2,2,4) 
  surf(log.kirsch.plot_r,log.kirsch.plot_theta,log.kirsch.sigma_zz,'EdgeColor',"none");
  view(2)
  title("\sigma _{zz}")
   colorbar
    
end


