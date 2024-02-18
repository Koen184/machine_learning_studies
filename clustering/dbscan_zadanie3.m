clear all
close all
clc

x1 = rand(300,2)*1;
x2 = x1 + sin(x1).*cos(x1)*100;
X = [x1; x2];

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