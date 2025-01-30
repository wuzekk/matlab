clear all;
close all;
clc;

data = 5 + 0.4 * randn(100, 7);
num_comp = [1, 2, 3, 4, 5, 6, 7];
errors_reconstruction = zeros(1, length(num_comp));
errors_mse = zeros(1, length(num_comp));

for i = 1:length(num_comp)
    [coeff, score, latent, tsquared, explained, mu] = pca(data, "NumComponents", num_comp(i));
    data_pca = score * coeff' + mu;
    errors_reconstruction(i) = norm(data - data_pca, 'fro');
    errors_mse(i) = immse(data, data_pca);
end

figure(1);
plot(num_comp, errors_reconstruction, '-o');
xlabel('Number of Components');
ylabel('reproduction error');
title('PCA Reproduction Error vs Number of Components');
grid on;

figure(2);
plot(num_comp, errors_mse, '-o');
xlabel('Number of Components');
ylabel('MSE');
title('PCA MSE vs Number of Components');
grid on
