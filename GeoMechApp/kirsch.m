%%Input
%Shmax maximum horizontal stress
%Shmin minimum horizontal stress
%Po pore pressure
% R raidus ,T temperaure
%%output
%sigma_rr,sigma_theta
%tau_r_theta
%%
%without considersing the temperature effect
Shmax=72;
Shmin=45;
Po=30;
Sv=85;
poi_rat=0.33;
R=0.5;
r=0.51:0.01:1
theta=0:(2*pi)/360:2*pi
 i=length(r);
 j=length(theta);

 for k=1:i
     for m=1:j
          plot_r(k,m)=r(k)*cos(theta(m));
          plot_theta(k,m)=r(k)*sin(theta(m));
sigma_rr(k,m)=(1/2)*(Shmax+Shmin-2*Po)*(1-(R/r(k))^2)+(1/2)*(Shmax-Shmin)*(1-(4*(R/r(k))^2)+(3*(R/r(k))^4))*cos(2*theta(m))+Po*((R/r(k))^2);
sigma_theta(k,m)=(1/2)*(Shmax+Shmin-2*Po)*(1+(R/r(k))^2)-(1/2)*(Shmax-Shmin)*(1+(3*(R/r(k))^4))*cos(2*theta(m))-Po*((R/r(k))^2);
tau_r_theta(k,m)=(1/2)*(Shmax-Shmin)*(1+(2*(R/r(k))^2)-(3*(R/r(k))^4))*sin(2*theta(m));
sigma_zz(k,m)=Sv-2*poi_rat*(Shmax-Shmin)*cos(2*theta(m))-Po;
     end
 end
 figure 
 surf(plot_r,plot_theta,sigma_rr);
 figure 
 surf(plot_r,plot_theta,sigma_theta);
 figure 
 surf(plot_r,plot_theta,tau_r_theta);
 figure
  surf(plot_r,plot_theta,sigma_zz);