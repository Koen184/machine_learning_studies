clear all
close all
clc

[Q, map] = imread('butterfly.jpg');
n_col = 0.15;

figure(1)
imshow(Q);
title('Input image');

[Q1, map] = rgb2ind(Q, n_col);

figure(2)
image(Q1);
colorbar;
title('Input image, RGB');

k = 100;
[idx, C, sumd, D] = kmeans(Q1, k);
clust_number = idx;
centers_coordinate = C;

figure(3)
image(clust_number);
title('Visualisation - cluster numbers');
figure(4)
image(centers_coordinate);
title('Visualisation - center coordinates');

img_clustering = zeros(size(Q1));

for i = 1:256
    img_clustering(Q1 == (i-1)) = clust_number(i);
end

figure(5)
image(img_clustering);
colorbar;
title('Image separation (k-means)');

n_colors_before = max(max(Q1));
n_colors_after = (max(img_clustering));