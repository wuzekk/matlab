close all
clear all
clc

zakres = [-20 20];
liczba_n_h1 = 20;
liczba_n_o = 1;

a = 1.4;
b = 0.3;
n = 50;
x0 = 1;
y0 = 1;

x1 = zeros(1, n);
y = zeros(1, n);
x1(1) = x0;
y(1) = y0;

for i = 2:n
    x1(i) = y(i-1) + 1 - a * x1(i-1)^2;
    y(i) = b * x1(i-1);
end

X = [x1; y];
y_true = sin(x1);


siec_newff = newff([zakres; zakres], [liczba_n_h1 liczba_n_o], {'tansig', 'purelin'}, 'trainlm');
siec_newff.trainParam.epochs = 100;
siec_newff.trainParam.goal = 0;

siec_newff = train(siec_newff, X, y);

ynn_newff = sim(siec_newff, X);

%newelm
siec_newelm = newelm([zakres; zakres], [liczba_n_h1 liczba_n_o], {'tansig', 'purelin'}, 'trainlm');
siec_newelm.trainParam.epochs = 100;
siec_newelm.trainParam.goal = 0;

siec_newelm = train(siec_newelm, X, y);
ynn_newelm = sim(siec_newelm, X);

%newrb & newrbe
MN = 50;
DF = 5;
GOAL = 0;
SPREAD = 0.5;

siec_newrb = newrb(X, y, GOAL, SPREAD, MN, DF);
siec_newrbe = newrbe(X, y, SPREAD);

ynn_newrb = sim(siec_newrb, X);
ynn_newrbe = sim(siec_newrbe, X);

%ploting
figure;

%newff
subplot(3, 1, 1);
plot(x1, y, 'b', x1, ynn_newff, 'r');
title('Original vs newff, MSE= ', num2str(mse(y, ynn_newff)));
legend('Original', 'newff');
xlabel('x');
ylabel('y');

%newelm
subplot(3, 1, 2);
plot(x1, y, 'b', x1, ynn_newelm, 'g');
title('Original vs newelm, MSE= ', num2str(mse(y, ynn_newelm)));
legend('Original', 'newelm');
xlabel('x');
ylabel('y');

%newrb vs newrbe
subplot(3, 1, 3);
plot(x1, y, 'b', x1, ynn_newrb, 'r', x1, ynn_newrbe, 'g');
title('Comparison of newrb and newrbe with Original');
legend('Original', 'newrb', 'newrbe');
xlabel('x');
ylabel('y');
dim = [0.4 0.10 0.3 0.2];
str = ['MSE newrb: ', num2str(mse(y, ynn_newrb)), newline, 'MSE newrbe: ', num2str(mse(y, ynn_newrbe))];
annotation('textbox', dim, 'String', str, 'FitBoxToText', 'on', 'BackgroundColor', 'white', 'HorizontalAlignment', 'center');
