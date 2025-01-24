close all;
clear;
clc;

global kp ti
%ga
opt = optimoptions("ga", 'PlotFcn', @gaplotbestf);
opt.MaxGenerations = 5;
opt.PopulationSize = 10;

[wartosci_wyznaczone, wartosc_f_ga] = ga(@flc_error_ffunc, 2, [], [], [], [], [1 0.001], [100 3], [], opt);

kp = wartosci_wyznaczone(1);
ti = wartosci_wyznaczone(2);
sim('test');
figure(1)
plot(t, wref, 'b'); hold on;
plot(t, omega, 'r');
xlabel('t [s]');
ylabel('\omega [p.u.]');
legend('init', 'optim');

%pso
opt = optimoptions("particleswarm", 'PlotFcn', @pswplotbestf);
opt.MaxIterations = 5;
opt.SwarmSize = 10;

[wartosci_obliczone, wartosc_f_pso] = particleswarm(@flc_error_ffunc, 2, [1 0.001], [100 3], opt);

kp = wartosci_obliczone(1);
ti = wartosci_obliczone(2);
sim('test');

figure(2)
plot(t, wref, 'b'); hold on;
plot(t, omega, 'r');
xlabel('t [s]');
ylabel('\omega [p.u.]');
legend('init', 'optim');