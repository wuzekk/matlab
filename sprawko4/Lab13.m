%% PSO
clear; close all; clc;

opt = optimoptions("particleswarm", 'PlotFcn', @pswplotbestf);
opt.MaxIterations = 5;
opt.SwarmSize = 10;


wartosci_obliczone = particleswarm(@cost_fun, 1, -5, 5, opt);

x = -10:0.1:10;
y = cost_fun(x);

figure
plot(x, y, LineWidth=2)
grid; hold;
xlabel('x'); ylabel('y')

qy = -50:.01:50;
qx = ones(size(qy)) * wartosci_obliczone;
plot(wartosci_obliczone, cost_fun(wartosci_obliczone), 'xr', MarkerSize=15, LineWidth=3);
title('PSO')
%% GA
opt = optimoptions("ga", 'PlotFcn', @gaplotbestf);
opt.MaxGenerations = 5;
opt.PopulationSize = 10;

[wartosci_wyznaczone] = ga(@cost_fun, 1, [],[],[],[], -5, 5, [], opt);

figure
plot(x, y, LineWidth=2,Color='g')
grid; hold;
xlabel('x'); ylabel('y')

qy = -50:.01:50;
qx = ones(size(qy)) * wartosci_wyznaczone;
plot(wartosci_wyznaczone, cost_fun(wartosci_wyznaczone), 'xm', MarkerSize=15, LineWidth=3);
title('GA')

%% 
close all; clear;
% PSO
opt = optimoptions("particleswarm", 'PlotFcn', @pswplotbestf);
opt.MaxIterations = 10;
opt.SwarmSize = 10;

wartosci_obliczone = particleswarm(@cost_fun3, 2, [-5 -5], [5 5], opt);


figure
fsurf(@(x1, x2) x1.*exp(-(sin(x1).^2+x2.^2))); grid; hold; box

cost_fun3([wartosci_obliczone(1) wartosci_obliczone(2)])
plot3(wartosci_obliczone(1), wartosci_obliczone(2), cost_fun3([wartosci_obliczone(1) wartosci_obliczone(2)]), 'xr', MarkerSize=15, LineWidth=3)
title('PSO')

% GA
opt = optimoptions("ga", 'PlotFcn', @gaplotbestf);
opt.MaxGenerations = 5;
opt.PopulationSize = 10;

[wartosci_wyznaczone] = ga(@cost_fun3, 2, [],[],[],[], [-5 -5], [5 5], [], opt);

figure
fsurf(@(x1, x2) x1.*exp(-(sin(x1).^2+x2.^2))); grid; hold; box

cost_fun3([wartosci_obliczone(1) wartosci_obliczone(2)])
plot3(wartosci_obliczone(1), wartosci_obliczone(2), cost_fun3([wartosci_obliczone(1) wartosci_obliczone(2)]), 'xr', MarkerSize=15, LineWidth=3)
title('GA')







