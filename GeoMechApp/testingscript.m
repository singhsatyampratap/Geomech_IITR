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