clear; close all; clc;

% Definicja funkcji celu
cost_fun = @(x) x.^2 + 3*x + 4;
cost_fun_v2 = @(x) x.^2 + 3*x + 4;
x_range = -5:0.1:5;

% Zakresy testowanych parametow
swarm_sizes = [10, 20, 50]; 
population_sizes = [10, 20, 50]; 
max_iterations = [5, 10, 20]; 

% PSO
figure; 
subplot_index = 1;

for i = 1:length(swarm_sizes)
    for j = 1:length(max_iterations)
        opt_pso = optimoptions("particleswarm", 'Display','off');
        opt_pso.MaxIterations = max_iterations(j);
        opt_pso.SwarmSize = swarm_sizes(i);
        [pso_result, pso_fval] = particleswarm(cost_fun_v2, 1, -5, 5, opt_pso);

        subplot(length(swarm_sizes), length(max_iterations), subplot_index);
        plot(x_range, cost_fun_v2(x_range), 'LineWidth', 2);
        hold on;
        plot(pso_result, pso_fval, 'xr', 'MarkerSize', 10, 'LineWidth', 2); 
        title(['PSO: S=', num2str(swarm_sizes(i)), ', I=', num2str(max_iterations(j)), ', Min=', num2str(pso_fval)]);
        xlabel('x'); ylabel('f(x)'); grid on; hold off;
        subplot_index = subplot_index + 1;
    end
end


% GA
figure;
subplot_index = 1;

for i = 1:length(population_sizes)
    for j = 1:length(max_iterations)
        opt_ga = optimoptions("ga", 'Display','off');
        opt_ga.MaxGenerations = max_iterations(j);
        opt_ga.PopulationSize = population_sizes(i);
        [ga_result, ga_fval] = ga(cost_fun, 1, [],[],[],[], -5, 5, [], opt_ga);

        subplot(length(population_sizes), length(max_iterations), subplot_index);
        plot(x_range, cost_fun(x_range), 'g', 'LineWidth', 2);
        hold on;
        plot(ga_result, ga_fval, 'xm', 'MarkerSize', 10, 'LineWidth', 2); 
        title(['GA: P=', num2str(population_sizes(i)), ', I=', num2str(max_iterations(j)), ', Min=', num2str(ga_fval)]);
        xlabel('x'); ylabel('f(x)'); grid on; hold off;
        subplot_index = subplot_index + 1;
    end
end





