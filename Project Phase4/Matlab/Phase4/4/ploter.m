clear;
clc;


eta1_values=0.5;
eta2_values=0.2;
eta3_values=1000;


initial_conditions = [-0.5; 1.5; 1];
[t, y] = ode45(@(t,y) dynamicSystem(t, y, eta1_values, eta2_values, eta3_values), [0, 500], initial_conditions);
 figure(3)
 plot3(y(:,1), y(:,2), y(:,3));
 xlabel('omega1');
 ylabel('omega2');
 zlabel('omega3');
 grid on;
                
 xlim([-2 2]); 
 ylim([-1 3]); 
 zlim([-2 1]);
 % Set the title
title(sprintf('eta1=%.2f, eta2=%.2f, eta3=%.2f', eta1_values, eta2_values, eta3_values));
