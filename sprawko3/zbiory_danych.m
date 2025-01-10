function the_Lorenz_values = Lorenz_eqs(t, x);
    sigma_f = 20;
    beta_f = 8/3;
    r_f = 28;
    the_Lorenz_values = [sigma_f * x(2) - sigma_f * x(1); r_f * x(1) - x(2) - x(1) * x(3); x(1) * x(2) - beta_f * x(3)];
end

%dane 1
x1 = rand(300, 2) * 10;
x2 = x1 + 100;
X = [x1; x2];
save('dane1.mat', 'X');

%dane 2
x1 = rand(500, 2);
x2 = x1 + sin(x1) * 100;
X = [x1; x2];
save('dane2.mat', 'X');

%dane 3
x1 = rand(300, 2) * 1;
x2 = x1 +sin(x1) .* cos(x1) * 100;
X = [x1; x2];
save('dane3.mat', 'X');

%dane 4
x0 = [-7 3 21];
tspan = [0 4];
[t, x] = ode23(@Lorenz_eqs, tspan, x0);
X = [x(:, 1), x(:, 2)];
save('dane4.mat', 'X');

%dane 5
x0 = [-7 3 21];
tspan = [0 4];
sigma_f = 20;
beta_f = 8/3;
[t, x] = ode23(@Lorenz_eqs, tspan, x0);
X = [x(:, 1), x(:, 3)];
save('dane5.mat', 'X');

%dane 6
x_0 = 0;
y_0 = 0;
r = 1;
X = [];

for alpha = 0:0.01:2 * pi
    r = rand + 50;
    x = x_0 + (r * cos(alpha));
    y = y_0 + (r * sin(alpha));
    X = [X; [x y]];
end

save('dane6.mat', 'X');

%dane 7
x_0 = 0;
y_0 = 0;
r = 1;
X = [];

for alpha = 0:0.01:2 * pi
    r = rand * 5 + 50;
    x = x_0 + (r * cos(alpha));
    y = y_0 + (r * sin(alpha));
    r1 = rand * 10 + 150;
    x1 = x_0 + (r1 * cos(alpha));
    y1 = y_0 + (r1 * sin(alpha));
    X = [X; [x y]];
    X = [X; [x1 y1]];
end

save('dane7.mat', 'X');

%dane 8
x_0 = 0;
y_0 = 0;
X = [];

for alpha = 1 * pi:0.01:2 * pi
    r = rand * 5 + 50;
    x = x_0 + (r * cos(alpha));
    y = y_0 + (r * sin(alpha));
    r1 = rand * 10 + 150;
    x1 = x_0 + (r1 * cos(alpha));
    y1 = y_0 + (r1 * sin(alpha));
    X = [X; [x y]];
    X = [X; [x1 y1]];
end

save('dane8.mat', 'X');

%dane 9
x_0_1 = 100;
y_0_1 = 0;
x_0_2 = 0;
y_0_2 = 0;
X = [];

for alpha = 0 * pi:0.01:1 * pi
    r = rand * 5 + 50;
    x = x_0_1 + (r * cos(alpha));
    y = y_0_1 + (r * sin(alpha));
    r1 = rand * 10 + 150;
    x1 = x_0_2 + (r1 * cos(alpha));
    y1 = y_0_2 + (r1 * sin(alpha));
    X = [X; [x y]];
    X = [X; [x1 y1]];
end

save('dane9.mat', 'X');

%dane 10
x_0_1 = 100;
y_0_1 = 0;
x_0_2 = 0;
y_0_2 = 0;
X = [];

for alpha = 0 * pi:0.01:1 * pi
    r = rand * 5 + 50;
    x = x_0_1 + (r * cos(alpha));
    y = y_0_1 + (r * sin(alpha));
    X = [X; [x y]];
end

for alpha = 0 * pi:0.1 * rand:1 * pi
    r1 = rand * 10 + 150;
    x1 = x_0_2 + (r1 * cos(alpha));
    y1 = y_0_2 + (r1 * sin(alpha));
    X = [X; [x1 y1]];
end

save('dane10.mat', 'X');
