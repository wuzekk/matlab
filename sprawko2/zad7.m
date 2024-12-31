clear all;
close all;

x = -10:0.1:10;
x1 = (1 + cos(x)) .* (1 - sin(x));
y = (1 + sin(x1)) .* (1 - sin(x1));

X = x1;

zakres = [-20 20];
liczba_n_h1 = 5;
liczba_n_h2 = 10;
liczba_n_o = 1;

%% newff
siec_newff = newff(minmax(X), [liczba_n_h1 liczba_n_h2 liczba_n_o], {'tansig', 'tansig', 'purelin'}, 'trainlm');
siec_newff.trainParam.epochs = 100;
siec_newff.trainParam.goal = 0;
siec_newff = train(siec_newff, X, y);
ynn_newff = sim(siec_newff, X);

% plotting newff
figure(3);
plot(y, 'r', 'DisplayName', 'True y'); grid on; hold on;
plot(ynn_newff, 'm', 'DisplayName', 'Predicted y (newff)');
legend('show');
axis tight; % dopasowanie osi wykresu do danych

% obliczenie i wyświetlenie błędu
error_newff = sum(abs(y - ynn_newff)) / length(y);
title(sprintf('newff: Error = %.6f', error_newff));

%% newelm
siec_newelm = newelm(minmax(X), [liczba_n_h1 liczba_n_h2 liczba_n_o], {'tansig', 'tansig', 'purelin'}, 'trainlm');
siec_newelm.trainParam.epochs = 100;
siec_newelm.trainParam.goal = 0;
siec_newelm = train(siec_newelm, X, y);
ynn_newelm = sim(siec_newelm, X);

%p plotting newelm
figure(4);
plot(y, 'r', 'DisplayName', 'True y'); grid on; hold on;
plot(ynn_newelm, 'c', 'DisplayName', 'Predicted y (newelm)');
legend('show');
axis tight;

% obliczenie i wyświetlenie błędu
error_newelm = sum(abs(y - ynn_newelm)) / length(y);
title(sprintf('newelm: Error = %.6f', error_newelm));

MN = 10;
DF = 3;
GOAL = 0;
SPREAD = 0.5;

%% newrb
NN_model_rbf = newrb(X, y, GOAL, SPREAD, MN, DF);
Xt = X + (randn(size(X)) * 0.05);
ynn_newrb = sim(NN_model_rbf, Xt);

% plotting newrb
figure(1);
plot(y, 'r', 'DisplayName', 'True y'); grid on; hold on;
plot(ynn_newrb, 'g', 'DisplayName', 'Predicted y (newrb)');
legend('show');
axis tight;

% obliczenie i wyświetlenie błędu
error_newrb = sum(abs(y - ynn_newrb)) / length(y);
title(sprintf('newrb: Error = %.6f', error_newrb));

%% newrbe
NN_model_rbfe = newrb(X, y, GOAL, SPREAD, MN, DF);
Xt = X + (randn(size(X)) * 0.05);
ynn_newrbe = sim(NN_model_rbfe, Xt);

% plotting newrbe
figure(2);
plot(y, 'r', 'DisplayName', 'True y'); grid on; hold on;
plot(ynn_newrbe, 'b', 'DisplayName', 'Predicted y (newrbe)');
legend('show');
axis tight;

% obliczenie i wyświetlenie błędu
error_newrbe = sum(abs(y - ynn_newrbe)) / length(y);
title(sprintf('newrbe: Error = %.6f', error_newrbe));