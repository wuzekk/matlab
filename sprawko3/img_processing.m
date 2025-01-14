%% Klasteryzacja
clear; close all; clc;

img = imread('uni.jpg');

figure;
imshow(img);
title('Oryginalny obraz');

img_converted = rgb2ind(img, 0.05);
img_coverted = double(img_converted);

k = 3;
[clust_number, centers] = kmeans(img_converted, k);

img_clustering = zeros(size(img_coverted));
for i=1:590
    img_clustering(img_converted==(i-1)) = clust_number(i)*100;
end

figure
image(img_clustering); axis equal
colorbar; title(['Obraz po klasteryzacji na ', num2str(k), ' klastry'])

%% Redukcja kolorow z uzyciem k-means
% wymiary
x = size(img, 1);
y = size(img, 2);

% liczba klastrow
k = 3;

% przepisanie pikseli do formatu: nr_piksela(R G B)
pixels = zeros(x * y, 3);

idx = 1;
for i = 1:x
    for j = 1:y
        pixels(idx, :) = double(img(i, j, :));
        idx = idx + 1;
    end
end

% klasteryzacja
[clust_number, centers] = kmeans(pixels, k);

% przypisanie kolorow do odpowiednich pikseli, gdzie centers odpowiada wartosci RGB koloru
img_reduced = zeros(x, y, 3, 'uint8');

idx = 1;
for i = 1:x
    for j = 1:y
        cluster_idx = clust_number(idx); 
        img_reduced(i, j, :) = uint8(centers(cluster_idx, :)); % przypisanie koloru
        idx = idx + 1;
    end
end

figure;
imshow(img_reduced);
title(['Obraz po redukcji kolorów do ', num2str(k), ' klastrów']);
























