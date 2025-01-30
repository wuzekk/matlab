clear all
close all
clc

range = 1:0.1:10;
x1 = sin(range)' + 0.1 * randn(length(range), 1);
x2 = sin(range)' + 0.5 * randn(length(range), 1);
data = [x1, x2];
[coeff, score, latent, tsquared, explained, mu] = pca(data, "NumComponents", 1);
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

[coeff2, score2, latent, tsquared, explained, mu2] = pca(data, "NumComponents", 1);
data_pca2 = score2 * coeff2' + mu2;

figure;
histogram(size(data), 'FaceColor', 'b', 'DisplayName', 'Original Data');
hold on;
histogram(size(data_pca2), 'FaceColor', 'r', 'DisplayName', 'PCA Data');
title('Histogram of Original Data and PCA Data');
xlabel('Value');
ylabel('Frequency');
legend;
hold off;
