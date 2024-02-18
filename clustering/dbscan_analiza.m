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

minpts = 10;
epsln = 5;
distance = 'minkowski';

[clust_num, core_points] = dbscan(X, epsln, minpts, 'Distance', distance);

figure(2)
grid on;
hold on;
box on;
xlabel('Coordinate X');
ylabel('Coordinate Y');
gscatter(X(:,1),X(:,2),clust_num);

titleString = sprintf(['Min points = %d\nEpsilon = %d\nDistance = %s'], ...
    minpts, epsln, distance);

title(titleString);