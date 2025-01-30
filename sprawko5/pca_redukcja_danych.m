clear all
close all
clc
range = 1:0.1:10;
x1 = sin(range)' + 0.1 * randn(length(range), 1);
x2 = sin(range)' + 0.5 * randn(length(range), 1);
data = [x1, x2];
[coeff, score, latent, tsquared, explained, mu] = pca(data, "NumComponents", 1);
data_pca = score * coeff' + mu;
figure(1)
plot(data(:, 1), data(:, 2), 'or', 'MarkerSize', 7, 'LineWidth', 3');
grid;
hold on;
plot(data_pca(:, 1), data_pca(:, 2), 'xb', 'MarkerSize', 7, 'LineWidth', 3');
xlabel('x');
ylabel('y');
legend('input data', 'pca');

clc
disp('size of initial data:')
s_init = size(data, 1) * size(data, 2)
disp('size of PCA data:')
s1 = size(score, 1) * size(score, 2);
s2 = size(coeff, 1) * size(coeff, 2);
s3 = size(mu, 1) * size(mu, 2);
s_PCA = s1 + s2 + s3

figure(2)
bar([1, 2], [s_init, s_PCA]);
set(gca, 'xticklabel', {'Initial Data', 'PCA Data'});
ylabel('Size');
title('Comparison of Data Sizes');
grid on;
