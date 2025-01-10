clear all;
close all;
clc

colors = {
          'b', 'g', 'r', 'c', 'm', 'k', ...
              [1, 0.5, 0], ...
              [0.5, 0, 0.5], ...
              [0.6, 0.3, 0.1], ...
              [1, 0.75, 0.8], ...
              [0.5, 0.5, 0.5], ...
              [0.68, 0.85, 0.9], ...
              [0.56, 0.93, 0.56], ...
              [1, 0.71, 0.76], ...
              [0.88, 1, 1], ...
              [1, 0.88, 1], ...
              [1, 1, 0.88], ...
              [0.75, 0.75, 0.75]
          };

color_for_negative = 'y';

load('dane2.mat');

distance_values = {'euclidean', 'cityblock', 'chebychev', 'minkowski', 'mahalanobis', 'cosine', 'correlation', 'hamming', 'jaccard', 'spearman'};

for idx = 1:length(distance_values)
    minpts = 10;
    eps = 5;
    dist = distance_values{idx};
    [clust_num, core_points] = dbscan(X, eps, minpts, 'Distance', dist);

    if mod(idx - 1, 4) == 0
        figure;
    end

    subplot(2, 2, mod(idx - 1, 4) + 1);

    grid;
    hold on;
    box on;
    xlabel('coordinate x_1');
    ylabel('coordinate x_2');
    title(sprintf('minpts = %d \n eps= %d \n distance= %s', minpts, eps, dist));

    legend_handles = [];
    legend_labels = {};

    for i = 1:size(X, 1)

        if clust_num(i) == -1
            h = plot(X(i, 1), X(i, 2), 'o', 'Color', color_for_negative);

            if isempty(find(strcmp(legend_labels, '-1'), 1))
                legend_handles = [legend_handles, h];
                legend_labels = [legend_labels, '-1'];
            end

        else
            color_idx = mod(clust_num(i) - 1, length(colors)) + 1;
            h = plot(X(i, 1), X(i, 2), 'o', 'Color', colors{color_idx});

            cluster_label = sprintf('%d', clust_num(i));

            if isempty(find(strcmp(legend_labels, cluster_label), 1))
                legend_handles = [legend_handles, h];
                legend_labels = [legend_labels, cluster_label];
            end

        end

    end

    legend(legend_handles, legend_labels, 'Location', 'best');
    hold off;
end
