clear all 
close
clc

%%
% Shale porosity vs Effective vertical Stress plot 
%creating a discrete test data

clear all 
close
clc
sigma_v  = linspace(0,50,75);
c=[0.386,-3.13E-2]
[phin,phi]=lab_data_model(2,c,sigma_v,0.2)
figure  
labdata_plotter(sigma_v,phin,'Effective Vertical Stress(MPa) ',"Shale Porosity","Normal Compaction Trend")
hold on
plot(sigma_v,phi)
figure
histoplotter(phin,15,"Porosity","1000-2000 m")
%%
%test load data
clear all
close 
clc
log=data_loader('/MATLAB Drive/GeoMechSAT/GeoMech/GOMDATA.xlsx')
%%
%test Sv_calculator
log.Sv=Sv_calculator(log.Density,log.Depth,2700,9.8,'a')
plot(log.Sv,-log.Depth)
%%
%test elastic_parameter
[log.E,log.G,log.M,log.v]=elastic_parameter(log.VP,log.VS,log.Density);
subplot(1,4,1)
plot(log.E,-log.Depth)
subplot(1,4,2)
plot(log.G,-log.Depth)
subplot(1,4,3)
plot(log.M,-log.Depth)
subplot(1,4,4)
plot(log.v,-log.Depth)

%%
%PorePressure calculation
log.PP=PorePressure_calculator(log.Depth,1100,9.8,'hydrostatic')
plot(log.PP,-log.Depth)

%%
%Shmin Calculation
log.Shmin=Shmin_calculator(log.Sv,log.PP,log.v,'movmean',100)
plot(log.Shmin,-log.Depth)

%%
% plot all stress and pore pressure
figure
hold on
plot(log.Sv,-log.Depth)
plot(log.Shmin,-log.Depth)
plot(log.PP,-log.Depth)
legend 'Overburden' 'Minimum Horizontal' 'Pore Pressure' 

