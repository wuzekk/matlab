clear all;
close all;
clc

minpts = 10;
eps = 3; % wyznaczane wg k-dist
colors = {
          'b', 'g', 'r', 'c', 'm', 'k', ...
              [1, 0.5, 0], ... % orange
              [0.5, 0, 0.5], ... % purple
              [0.6, 0.3, 0.1], ... % brown
              [1, 0.75, 0.8], ... % pink
              [0.5, 0.5, 0.5], ... % gray
              [0.68, 0.85, 0.9], ... % lightblue
              [0.56, 0.93, 0.56], ... % lightgreen
              [1, 0.71, 0.76], ... % lightred
              [0.88, 1, 1], ... % lightcyan
              [1, 0.88, 1], ... % lightmagenta
              [1, 1, 0.88], ... % lightyellow
              [0.75, 0.75, 0.75] ... % lightblack
          };

color_for_negative = 'y';

for k = 1:10
    % Load the data
    dataFile = sprintf('dane%d.mat', k);
    load(dataFile);

    [clust_num, core_points] = dbscan(X, eps, minpts, 'Distance', 'euclidean');

    %figure;
    %grid;
    %hold on;
    %box on;
    %xlabel('coordinate x_1');
    %ylabel('coordinate x_2');
    %title(sprintf('data %d', k));
    %
    %for i = 1:size(X, 1)
    %    plot(X(i, 1), X(i, 2), '*');
    %end

    figure;
    grid;
    hold on;
    box on;
    xlabel('coordinate x_1');
    ylabel('coordinate x_2');
    title(sprintf('data %d after clustering', k));

    legend_handles = [];
    legend_labels = {};

    for i = 1:size(X, 1)

        if clust_num(i) == -1
            % Punkty szumu
            h = plot(X(i, 1), X(i, 2), 'o', 'Color', color_for_negative);

            if isempty(find(strcmp(legend_labels, '-1'), 1))
                legend_handles = [legend_handles, h];
                legend_labels = [legend_labels, '-1'];
            end

        else

            color_idx = mod(clust_num(i) - 1, length(colors)) + 1;
            h = plot(X(i, 1), X(i, 2), 'o', 'Color', colors{color_idx});

            % Dodanie do legendy tylko raz dla każdego klastra
            cluster_label = sprintf('%d', clust_num(i));

            if isempty(find(strcmp(legend_labels, cluster_label), 1))
                legend_handles = [legend_handles, h];
                legend_labels = [legend_labels, cluster_label];
            end

        end

    end

    % Dodanie legendy
    legend(legend_handles, legend_labels, 'Location', 'best');
    hold off;
end
