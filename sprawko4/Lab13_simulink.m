close all; clear; clc;

global kp ti


% PSO
opt = optimoptions("particleswarm", 'PlotFcn', @pswplotbestf);
opt.MaxIterations = 5;
opt.SwarmSize = 10;

[wartosci_obliczone, wartosc_f_pso] = particleswarm(@flc_error_ffunc, 2, [1 0.001], [100 3], opt);



%% GA

global kp ti

opt = optimoptions("ga", 'PlotFcn', @gaplotbestf);
opt.MaxGenerations = 5;
opt.PopulationSize = 10;

[wartosci_wyznaczone, wartosc_f_ga] = ga(@flc_error_ffunc, 2, [],[],[],[], [1 0.001], [100 3], [], opt);
