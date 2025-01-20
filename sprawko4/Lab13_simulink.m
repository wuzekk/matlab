close all; clear; clc;

global kp ti
iter = [5 10 15];
%max iter
for i = 1:size(iter)
    % PSO
    opt = optimoptions("particleswarm", 'PlotFcn', @pswplotbestf);
    opt.MaxIterations = iter(i);
    opt.SwarmSize = 10;

    [wartosci_obliczone, wartosc_f_pso] = particleswarm(@flc_error_ffunc, 2, [1 0.001], [100 3], opt);
end

swarm_size = [10 20 50];
% swarm size
for i = 1:size(swarm_size)
    % PSO
    opt = optimoptions("particleswarm", 'PlotFcn', @pswplotbestf);
    opt.MaxIterations = 5;
    opt.SwarmSize = swarm_size(i);

    [wartosci_obliczone, wartosc_f_pso] = particleswarm(@flc_error_ffunc, 2, [1 0.001], [100 3], opt);
end

%% GA

global kp ti

iter = [5 10 15];

for i = 1:size(iter)

    opt = optimoptions("ga", 'PlotFcn', @gaplotbestf);
    opt.MaxGenerations = iter(i);
    opt.PopulationSize = 10;

    [wartosci_wyznaczone, wartosc_f_ga] = ga(@flc_error_ffunc, 2, [], [], [], [], [1 0.001], [100 3], [], opt);
end

popul_size = [5 10 15];

for i = 1:size(iter)

    opt = optimoptions("ga", 'PlotFcn', @gaplotbestf);
    opt.MaxGenerations = 5;
    opt.PopulationSize = popul_size(i);

    [wartosci_wyznaczone, wartosc_f_ga] = ga(@flc_error_ffunc, 2, [], [], [], [], [1 0.001], [100 3], [], opt);
end
