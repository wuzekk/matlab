clear all
close all
clc

range = 1:0.1:10;
x1 = sin(range)' + 0.1 * randn(length(range), 1);
x2 = sin(range)' + 0.5 * randn(length(range), 1);
data = [x1, x2];
[coeff, score, latent, tsquared, explained, mu] = pca(data);
data_pca = score * coeff' + mu;

figure;
plot(data(:, 1), data(:, 2), 'x', 'MarkerSize', 8, 'DisplayName', 'Original Data');
hold on;
plot(data_pca(:, 1), data_pca(:, 2), 'r.', 'DisplayName', 'PCA Data');
legend;
xlabel('x1');
ylabel('x2');
title('Original Data and PCA Data');
hold off;

[coeff, score, latent, tsquared, explained, mu] = pca(data, 'NumComponents', 1);
data_pca = score * coeff' + mu;
figure;
plot(data(:, 1), data(:, 2), 'x', 'MarkerSize', 8, 'DisplayName', 'Original Data');
hold on;
plot(data_pca(:, 1), data_pca(:, 2), 'r.', 'DisplayName', 'PCA Data');
legend;
xlabel('x1');
ylabel('x2');
title('Original Data and PCA Data');
hold off;
