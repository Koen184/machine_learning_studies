clear all
close all
clc

x_1 = 100;
y_1 = 0;
x_2 = 0;
y_2 = 0;
X = [];

for alpha = 0 * pi : 0.01 : 1 * pi
    r = rand * 5 + 50;

    x = x_1 + (r * cos(alpha));
    y = y_1 + (r * sin(alpha));

    r1 = rand * 10 + 150;

    x1 = x_2 + (r1 * cos(alpha));
    y1 = y_2 + (r1 * sin(alpha));

    X = [X; [x y]];
    X = [X; [x1 y1]];
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

k = 2; % Tutaj można zmieniać ilość klastrów
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