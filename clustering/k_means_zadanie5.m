clear all
close all
clc

x0 = [-7 3 21];
range = [0 4];
[t, x] = ode23(@Lorenz_eqs, range, x0);
X = [x(:,1), x(:,3)];

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

function the_Lorenz_values = Lorenz_eqs(t, x);
    sigma_f = 20;
    beta_f = 8/3;
    r_f = 28;
    the_Lorenz_values = [sigma_f*x(2)-sigma_f*x(1); r_f*x(1) - x(2) - x(1)*x(3); x(1)*x(2) - beta_f * x(3)];
end