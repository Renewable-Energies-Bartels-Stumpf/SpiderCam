%SIMULATION DES VEREINFACHTEN PENDELS
%%
clear all;
clc
close all;


% ODE45-solver
timespan = [0,10];
init_con = [deg2rad(45);deg2rad(45);0;0];
[t,y] = ode45(@ep_dgl, timespan, init_con);

##figure(1)
##subplot(2,1,1);
##plot(t,y(:,1))
##subplot(2,1,2);
##plot(t,y(:,2))


%% FIGURE
figure(2)

for ii=1:25
  %% FIGURE PARAMS
  clf
  xlim([-0.5,1.5])
  ylim([-1.5,0.5])
  
  %% CONST
  l_0   = 1;
  l_1   = 0.1;
  
  %% ANGULAR FROM SIM
  phi_0 = y(ii,1);
  phi_1 = y(ii,2);
   
  %% BARS
  bar0  = l_0*e^(-i*phi_0);
  bar1  = bar0 + l_1*e^(i*phi_1);
  
  %% ANGULAR FROM CALC
  theta = acos((l_1^2 + abs(bar1) - l_0^2)/(2*abs(bar1)*l_1));
  delta = asin(l_1^2/l_0^2*sin(theta));
  
  bar2  = abs(bar1)*e^(-i*(phi_0-delta));
 
  
  %% LINES
  line([0,l_0],[0,0])
  line([0,real(bar0)],[0,imag(bar0)])
  line([0,real(bar1)],[0,imag(bar1)])
  line([0,real(bar2)],[0,imag(bar2)])
  
  line([real(bar0), real(bar1)], [imag(bar0), imag(bar1)])

  
  %% PAUSE FOR ANIMATION
  pause(10/142)
end