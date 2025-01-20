clear; close all; clc;

% Definicje funkcji celu
cost_fun1 = @(x) x.^2 + 3*x + 4;        
cost_fun2 = @(x) sin(x) + 0.1*x.^2;  
x_range = -5:0.1:5;

swarm_sizes = [10, 50, 100];
population_sizes = [10, 50, 100];
max_iterations = [5, 10, 50];
params = [1, 5, 10];

for func_idx = 1:2
    if func_idx == 1
        cost_fun = cost_fun1;
        fun_name = "f(x) = x^2 + 3x + 4";
    else
        cost_fun = cost_fun2;
        fun_name = "f(x) = sin(x) + 0.1x^2";
    end

    % PSO
    figure;
    sgtitle(['Particle Swarm Optimization', fun_name])
    subplot_index = 1;
    for i = 1:length(swarm_sizes)
        for j = 1:length(max_iterations)
            opt_pso = optimoptions("particleswarm", 'Display','off');
            opt_pso.MaxIterations = max_iterations(j);
            opt_pso.SwarmSize = swarm_sizes(i);
            [pso_result, pso_fval] = particleswarm(cost_fun, 1, -params(j), params(j), opt_pso);

            subplot(length(swarm_sizes), length(max_iterations), subplot_index);
            plot(x_range, cost_fun(x_range), 'LineWidth', 2);
            hold on;
            plot(pso_result, pso_fval, 'xr', 'MarkerSize', 10, 'LineWidth', 2);
            title(['SwarmSize=', num2str(swarm_sizes(i)), ', Iter=', num2str(max_iterations(j)), ', Params=', num2str(params(j)), ', Min=', num2str(pso_fval)]);
            xlabel('x'); ylabel('f(x)'); grid on; hold off;
            subplot_index = subplot_index + 1;
        end
    end

    % GA
    figure;
    sgtitle(['Genetic Algorithm', fun_name])
    subplot_index = 1;
    for i = 1:length(population_sizes)
        for j = 1:length(max_iterations)
            opt_ga = optimoptions("ga", 'Display','off');
            opt_ga.MaxGenerations = max_iterations(j);
            opt_ga.PopulationSize = population_sizes(i);
            [ga_result, ga_fval] = ga(cost_fun, 1, [],[],[],[], -params(j), params(j), [], opt_ga);

            subplot(length(population_sizes), length(max_iterations), subplot_index);
            plot(x_range, cost_fun(x_range), 'g', 'LineWidth', 2);
            hold on;
            plot(ga_result, ga_fval, 'xm', 'MarkerSize', 10, 'LineWidth', 2);
            title(['PopSize=', num2str(population_sizes(i)), ', Iter=', num2str(max_iterations(j)), ', Params=', num2str(params(j)), ', Min=', num2str(ga_fval)]);
            xlabel('x'); ylabel('f(x)'); grid on; hold off;
            subplot_index = subplot_index + 1;
        end
    end
end




