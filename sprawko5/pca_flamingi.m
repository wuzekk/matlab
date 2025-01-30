clear all
close all
clc

data = imread('flamingos.jpg');
imwrite(data, 'flamingi.jpg', 'jpg');
figure(1)
imshow(data);
title('oryginal file');

data_c_red = data(:, :, 1);
data_c_red = double(data_c_red);

data_c_green = data(:, :, 2);
data_c_green = double(data_c_green);

data_c_blue = data(:, :, 3);
data_c_blue = double(data_c_blue);

max_components = size(data_c_blue, 2);
num_components = max_components - 1200;

%pca for red
[coeff, score, latent, tsqared, explained, mu] = pca(data_c_red, 'NumComponents', num_components);
data_pca_c_red = score * coeff' + mu;
data_pca_c_red = uint8(data_pca_c_red);
s1 = size(score, 1) * size(score, 2);
s2 = size(coeff, 1) * size(coeff, 2);
s3 = size(mu, 1) * size(mu, 2);
s_pca1 = s1 + s2 + s3;

%pca for green
[coeff, score, latent, tsqared, explained, mu] = pca(data_c_green, 'NumComponents', num_components);
data_pca_c_green = score * coeff' + mu;
data_pca_c_green = uint8(data_pca_c_green);
s1 = size(score, 1) * size(score, 2);
s2 = size(coeff, 1) * size(coeff, 2);
s3 = size(mu, 1) * size(mu, 2);
s_pca2 = s1 + s2 + s3;

%pca for blue
[coeff, score, latent, tsqared, explained, mu] = pca(data_c_blue, 'NumComponents', num_components);
data_pca_c_blue = score * coeff' + mu;
data_pca_c_blue = uint8(data_pca_c_blue);
s1 = size(score, 1) * size(score, 2);
s2 = size(coeff, 1) * size(coeff, 2);
s3 = size(mu, 1) * size(mu, 2);
s_pca3 = s1 + s2 + s3;

data_pca_final = cat(3, data_pca_c_red, data_pca_c_green, data_pca_c_blue);
figure(2)
imshow(data_pca_final);
title("PCA processing of the file");

imwrite(data_pca_final, 'flamingos_PCA.jpg', 'jpg');

file_original = dir('flamingi.jpg');
file_pca = dir('flamingos_PCA.jpg');

file_sizes_bytes = [file_original.bytes, file_pca.bytes];

labels = {'Oryginalny obraz', 'Obraz po PCA'};

figure(3);
bar(file_sizes_bytes);
set(gca, 'XTickLabel', labels);
ylabel('Rozmiar pliku [Bytes]');
title('Porównanie rozmiaru plików');

text(1:2, file_sizes_bytes, num2str(file_sizes_bytes'), ...
    'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', ...
    'FontSize', 10);

fprintf('Rozmiar pliku oryginalnego: %.2f KB\n', file_original.bytes / 1024);
fprintf('Rozmiar pliku po PCA: %.2f KB\n', file_pca.bytes / 1024);
