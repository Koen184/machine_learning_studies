clear all
close all
clc

x_0 = 0;
y_0 = 0;
X = [];

for alpha = 0:0.01:2*pi
    r = rand * 5 + 50;

    x = x_0 + (r * cos(alpha));
    y = y_0 + (r * sin(alpha));

    r1 = rand * 10 + 150;

    x1 = x_0 + (r1 * cos(alpha));
    y1 = y_0 + (r1 * sin(alpha));

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

minpts = 20;
epsln = 5;

[clust_num, core_points] = dbscan(X, epsln, minpts, 'Distance', 'euclidean');

figure(2)
gscatter(X(:,1),X(:,2),clust_num);

figure(2)
grid on;
hold on;
box on;
xlabel('Coordinate X');
ylabel('Coordinate Y');
gscatter(X(:,1),X(:,2),clust_num);
