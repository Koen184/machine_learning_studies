clear all
close all
clc

x_0 = 0;
y_0 = 0;
X = [];

for alpha = 0:0.01:2*pi
    r = rand + 50;

    x = x_0 + (r * cos(alpha));
    y = y_0 + (r * sin(alpha));

    r1 = rand * 10 + 150;
    X = [X; [x y]];
end


figure(1)
grid on;
hold on;
box on;
xlabel('Coordinate X');
ylabel('Coordinate Y');

for i = 1 : size(X, 1)
    plot(X(i, 1), X(i, 2),'*');
end

Q1 = X;

k = 6; % Tutaj można zmieniać ilość klastrów
[idx, C, sumd, D] = kmeans(Q1, k);
clust_number = idx;
centers_coordinate = C;

figure(2)
grid on;
hold on;
box on;
xlabel('Coordinate X');
ylabel('Coordinate Y');

for i = 1:size(X, 1)
    if clust_number(i) == 1
        plot(X(i, 1), X(i, 2), 'r*');
    elseif clust_number(i) == 2
        plot(X(i, 1), X(i, 2), 'g*');
    elseif clust_number(i) == 3
        plot(X(i, 1), X(i, 2), 'b*');
    elseif clust_number(i) == 4
        plot(X(i, 1), X(i, 2), '*', 'Color', '#FF1493');
    elseif clust_number(i) == 5
        plot(X(i, 1), X(i, 2), '*', 'Color', '#FFD700');
    elseif clust_number(i) == 6
        plot(X(i, 1), X(i, 2), '*', 'Color', '#7FFFD4');
    end
end

for i = 1:size(C, 1)
    plot(C(i,1), C(i,2), 'xk', 'MarkerSize', 12, 'LineWidth', 2);
end