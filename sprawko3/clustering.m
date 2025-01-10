clear all;
close all;
clc;

% Parametr do liczby klastrów
k_values = [2, 4, 6];

% zmienić tutaj na liczbe zbiorow danych bo poki co nie wiemy ile
for file_idx = 1:10
    % Załaduj dane
    data = load(['dane', num2str(file_idx), '.mat']);
    X = data.X;
    % Wykres danych
    figure;
    subplot(1, length(k_values) + 1, 1);
    grid;
    hold;
    box;
    xlabel('coordinate x_1');
    ylabel('coordinate x_2');
    title(['data from dane', num2str(file_idx), '.mat']);

    for i = 1:size(X, 1)
        plot(X(i, 1), X(i, 2), '*');
    end

    % Wykresy po klasteryzacji
    for idx_k = 1:length(k_values)
        k = k_values(idx_k);
        [idx, C, sumd, D] = kmeans(X, k);
        clust_number = idx;
        centers_coordinate = C;

        subplot(1, length(k_values) + 1, idx_k + 1);
        grid;
        hold;
        box;
        xlabel('coordinate x_1');
        ylabel('coordinate x_2');
        title(['data after clustering with k = ', num2str(k)]);

        colors = ['r', 'g', 'y', 'm', 'c', 'b'];

        for i = 1:size(idx, 1)
            plot(X(i, 1), X(i, 2), [colors(idx(i)), '*']);
        end

    end

end
