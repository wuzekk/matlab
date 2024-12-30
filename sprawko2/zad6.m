close all
clear all
clc

%dane wejściowe
a = 1.4;
b = 0.3;
n = 100; % liczba próbek
x0 = 1;
y0 = 1;

x = zeros(1, n);
y = zeros(1, n);
x(1) = x0;
y(1) = y0;

for i = 2:n
    x(i) = y(i-1) + 1 - a * x(i-1)^2;
    y(i) = b * x(i-1);
end

X = [x; y];
y_true = sin(x); % Wyjście (na przykład: funkcja sin)

%newff
zakres = [-2 2]; % zakres wartości wejściowych
liczba_n_h1 = 5;
liczba_n_h2 = 10;
liczba_n_o = 1;

siec_newff = newff([zakres; zakres], [liczba_n_h1 liczba_n_h2 liczba_n_o], {'tansig', 'tansig', 'purelin'}, 'trainlm');
siec_newff.trainParam.epochs = 200;
siec_newff.trainParam.goal = 0;
siec_newff = train(siec_newff, X, y_true);
ynn_newff = sim(siec_newff, X);

%newelm
siec_newelm = newelm([zakres; zakres], [liczba_n_h1 liczba_n_h2 liczba_n_o], {'tansig', 'tansig', 'purelin'}, 'trainlm');
siec_newelm.trainParam.epochs = 200;
siec_newelm.trainParam.goal = 0;
siec_newelm = train(siec_newelm, X, y_true);
ynn_newelm = sim(siec_newelm, X);

%newrb
MN = 50;
DF = 5;
GOAL = 0;
SPREAD = 0.5;
siec_newrb = newrb(X, y_true, GOAL, SPREAD, MN, DF);
ynn_newrb = sim(siec_newrb, X);

%newrbe
siec_newrbe = newrbe(X, y_true, SPREAD);
ynn_newrbe = sim(siec_newrbe, X);

%% Plotowanie wyników
figure;

%newff
subplot(4, 1, 1);
plot(y_true, 'ob');
hold on;
plot(ynn_newff, '*r');
title(['Original vs newff, MSE= ', num2str(mse(y_true - ynn_newff))]);
legend('Original', 'newff');
xlabel('Sample');
ylabel('Output');

%newelm
subplot(4, 1, 2);
plot(y_true, 'ob');
hold on;
plot(ynn_newelm, '*r');
title(['Original vs newelm, MSE= ', num2str(mse(y_true - ynn_newelm))]);
legend('Original', 'newelm');
xlabel('Sample');
ylabel('Output');

%newrb
subplot(4, 1, 3);
plot(y_true, 'ob');
hold on;
plot(ynn_newrb, '*r');
title(['Original vs newrb, MSE= ', num2str(mse(y_true - ynn_newrb))]);
legend('Original', 'newrb');
xlabel('Sample');
ylabel('Output');

%newrbe
subplot(4, 1, 4);
plot(y_true, 'ob');
hold on;
plot(ynn_newrbe, '*g');
title(['Original vs newrbe, MSE= ', num2str(mse(y_true - ynn_newrbe))]);
legend('Original', 'newrbe');
xlabel('Sample');
ylabel('Output');
