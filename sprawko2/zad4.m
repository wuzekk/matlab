%zad4 newff + newelm + newrb+ newrbe

close all
clear all
clc

%dane wejsciowe
x1 = [0 0 1 1];
x2 = [0 1 0 1];
y = [0 1 1 0];

X = [x1; x2];

%newff
zakres = [-20 20];
liczba_n_h1 = 5; % % %liczba neuronow w warstwie ukrytej
liczba_n_h2 = 10; % % %liczba neuronow w warstwie ukrytej
liczba_n_o = 1; % % % %liczba neuronow w warstwie wyjsciowej

siec_newff = newff([zakres; zakres], [liczba_n_h1 liczba_n_h2 liczba_n_o], {'tansig', 'tansig', 'purelin'}, 'trainlm');
siec_newff.trainParam.epochs = 200;
siec_newff.trainParam.goal = 0;

siec_newff = train(siec_newff, X, y);

ynn_newff = sim(siec_newff, X);

%newelm
siec_newelm = newelm([zakres; zakres], [liczba_n_h1 liczba_n_h2 liczba_n_o], {'tansig', 'tansig', 'purelin'}, 'trainlm');
siec_newelm.trainParam.epochs = 200;
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
subplot(4, 1, 1);
plot(y, 'ob');
hold on;
plot(ynn_newff, '*r');
title('Original vs newff, MSE= ', num2str(mse(y, ynn_newff)));
legend('Original', 'newff');
xlabel('x');
ylabel('y');

%newelm
subplot(4, 1, 2);
plot(y, 'ob');
hold on;
plot(ynn_newelm, '*r');
title('Original vs newelm, MSE= ', num2str(mse(y, ynn_newelm)));
legend('Original', 'newelm');
xlabel('x');
ylabel('y');

%newrb
subplot(4, 1, 3);
plot(y, 'ob');
hold on;
plot(ynn_newrb, '*r');
title('Original vs newrb, MSE= ', num2str(mse(y, ynn_newrb)));
legend('Original', 'newrb');
xlabel('x');
ylabel('y');

%newrbe
subplot(4, 1, 4);
plot(y, 'ob');
hold on;
plot(ynn_newrbe, '*g');
title('Original vs newrbe, MSE= ', num2str(mse(y, ynn_newrbe)));
legend('Original', 'newrbe');
xlabel('x');
ylabel('y');
