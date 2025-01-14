%% Klasteryzacja
clear; close all; clc;

img = imread('uni.jpg');

figure;
imshow(img);
title('Oryginalny obraz');


n_colsv = [0.05, 0.1];
k_values = [10, 20, 50];

for n_cols=n_colsv
    img_converted = rgb2ind(img, n_cols);
    img_converted = double(img_converted);
    
    figure
    image(img_converted); axis equal
    title(['Obraz po indeksacji, n = ', num2str(n_cols)])

    
    idx = 1;
    for k=k_values
        [clust_number, centers] = kmeans(img_converted, k);
        
        img_clustering = zeros(size(img_converted));
        for i=1:590
            img_clustering(img_converted==(i-1)) = clust_number(i)*10;
        end
        
        
        figure
        image(img_clustering); 
        colorbar; title(['Obraz po klasteryzacji, k =', num2str(k)], ['Dla obrazu po idenksacji dla n = ', num2str(n_cols)])
        idx = idx + 1;
    end
end
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
























