function log=stress_around_well(log)
    
    
    
   
           prompt = {'Enter the Depth:'};
           dlgtitle = 'Input';
           dims = [1 35];
           definput = {'-400'};
           answer = inputdlg(prompt,dlgtitle,dims,definput);
           y = [str2num(answer{1}),str2num(answer{1})];
           
           
           
           [~,indx1,~]=closest_point(-log.Depth,y);

           
           
           
           if isfield(log,"Sv")==0
               log=calculate_SV(log)
           end
           
           if isfield(log,"SHmax")==0
               log=calculate_horizontal_stresses(log)
           end
           
           if isfield(log,"PP")==0
               log=calculate_Pore_Pressure(log)
           end
           if isfield(log,"v")==0
               log=calculate_poisson_ratio(log)
           end           
           if isfield(log,"BS")==0
               log=load_BS(log)
           end           
           
           
           
           
           
           
           
           
           
           Shmax=log.SHmax(indx1);
           Shmin=log.Shmin(indx1);
           Po=log.PP(indx1);
           Sv=log.Sv(indx1);
           poi_rat=log.v(indx1);
           R=log.BS(indx1);
           phi=pi/4;
           
           prompt = {'Enter the maximum Radius for visualisation:'};
           dlgtitle = 'Input';
           dims = [1 35];
           definput = {'2'};
           answer = inputdlg(prompt,dlgtitle,dims,definput);
           Rm = str2num(answer{1});
         
           
           
           

           
           
           
           r=R:0.01:Rm
           theta=0:(2*pi)/360:2*pi
           i=length(r);
           j=length(theta);
           plot_r=zeros(i,j);
           plot_theta=zeros(i,j);
           sigma_rr=zeros(i,j);
           sigma_theta=zeros(i,j);
           tau_r_theta=zeros(i,j);
           sigma_zz=zeros(i,j);

 for k=1:i
     for m=1:j
          plot_r(k,m)=r(k)*cos(theta(m));
          plot_theta(k,m)=r(k)*sin(theta(m));
sigma_rr(k,m)=(1/2)*(Shmax+Shmin-2*Po)*(1-(R/r(k))^2)+(1/2)*(Shmax-Shmin)*(1-(4*(R/r(k))^2)+(3*(R/r(k))^4))*cos(2*theta(m))+Po*((R/r(k))^2);
sigma_theta(k,m)=(1/2)*(Shmax+Shmin-2*Po)*(1+(R/r(k))^2)-(1/2)*(Shmax-Shmin)*(1+(3*(R/r(k))^4))*cos(2*theta(m))-Po*((R/r(k))^2);
tau_r_theta(k,m)=(1/2)*(Shmax-Shmin)*(1+(2*(R/r(k))^2)-(3*(R/r(k))^4))*sin(2*theta(m));
sigma_zz(k,m)=Sv-2*poi_rat*(Shmax-Shmin)*cos(2*theta(m))-Po;

sigma_max= max([sigma_rr(k,m),sigma_theta(k,m),sigma_zz(k,m)]);
sigma_min=min([sigma_rr(k,m),sigma_theta(k,m),sigma_zz(k,m)]);
slope= (tan(pi/4+phi/2))^2;
sigma_rad=(sigma_max-sigma_min)/2;
C0(k,m)=sigma_rad*sqrt(1+slope^2);

     end
 end


  
   
  log.kirsch.plot_r=plot_r;
  log.kirsch.plot_theta=plot_theta;
  log.kirsch.sigma_rr=sigma_rr;
  log.kirsch.sigma_theta=sigma_theta;
  log.kirsch.tau_r_theta=tau_r_theta;
  log.kirsch.sigma_zz=sigma_zz;
  log.kirsch.C0=C0;
  
  
    
end


