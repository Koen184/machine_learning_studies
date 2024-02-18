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

    X = [X; [x y]];
end

for alpha = 0 * pi : 0.1 * rand : 1 * pi
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

minpts = 20;
epsln = 8;

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
