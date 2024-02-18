clear all
close all
clc

x0 = [-7 3 21];
range = [0 4];
[t, x] = ode23(@Lorenz_eqs, range, x0);
X = [x(:,1), x(:,2)];

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

function the_Lorenz_values = Lorenz_eqs(t, x);
    sigma_f = 20;
    beta_f = 8/3;
    r_f = 28;
    the_Lorenz_values = [sigma_f*x(2)-sigma_f*x(1); r_f*x(1) - x(2) - x(1)*x(3); x(1)*x(2) - beta_f * x(3)];
end