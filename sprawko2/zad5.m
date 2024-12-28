%trzeba podobierac odopowiednie liczby neuronow co sa dla x y z :P

close all
clear all
clc

function y = ukladlorenza(t, f)
    s = 10;
    b = 8/3;
    r = 28;
    y = [s * f(2) - s * f(1); r * f(1) - f(1) - f(1) * f(3); f(1) * f(2) - b * f(3)];
end

wartosci_poczatkowe = [-5 5 25];
zakres = [0 5];
[t, wartosci_ukladu] = ode23(@ukladlorenza, zakres, wartosci_poczatkowe);

in_data_train = [t(1:length(t) - 2), t(2:length(t) - 1), t(3:length(t))];

out_data_train = [wartosci_ukladu(1:length(wartosci_ukladu) - 2, 1), wartosci_ukladu(1:length(wartosci_ukladu) - 2, 2), wartosci_ukladu(1:length(wartosci_ukladu) - 2, 3)];

figure(1)
plot3(wartosci_ukladu(:, 1), wartosci_ukladu(:, 2), wartosci_ukladu(:, 3));
grid;

%%newff

%X
liczba_n_h1 = 18; % % %liczba neuronow w warstwie ukrytej
liczba_n_h2 = 10; % % %liczba neuronow w warstwie ukrytej
liczba_n_o = 3; % % % %liczba neuronow w warstwie wyjsciowej

siec_newff = newff([zakres; zakres; zakres], [liczba_n_h1 liczba_n_h2 liczba_n_o], {'tansig', 'tansig', 'purelin'}, 'trainlm');
siec_newff.trainParam.epochs = 200;
siec_newff.trainParam.goal = 0;

siec_newff = train(siec_newff, in_data_train', out_data_train');
ynn_newff = sim(siec_newff, in_data_train');

figure(2)
subplot(3, 1, 1);
plot(out_data_train(:, 1), 'b');
hold on;
plot(ynn_newff(1, :), 'r');
title('X-Original vs newff, MSE= ', num2str(mse(out_data_train(:, 1), ynn_newff(1, :))));

subplot(3, 1, 2);
plot(out_data_train(:, 2), 'b');
hold on;
plot(ynn_newff(2, :), 'r');
title('X-Original vs newff, MSE= ', num2str(mse(out_data_train(:, 2), ynn_newff(2, :))));

subplot(3, 1, 3);
plot(out_data_train(:, 3), 'b');
hold on;
plot(ynn_newff(3, :), 'r');
title('X-Original vs newff, MSE= ', num2str(mse(out_data_train(:, 3), ynn_newff(3, :))));
%newelm
%X
liczba_n_h1 = 18; % % %liczba neuronow w warstwie ukrytej
liczba_n_h2 = 10; % % %liczba neuronow w warstwie ukrytej
liczba_n_o = 3; % % % %liczba neuronow w warstwie wyjsciowej

siec_newelm = newelm([zakres; zakres; zakres], [liczba_n_h1 liczba_n_h2 liczba_n_o], {'tansig', 'tansig', 'purelin'}, 'trainlm');
siec_newelm.trainParam.epochs = 200;
siec_newelm.trainParam.goal = 0;

siec_newelm = train(siec_newelm, in_data_train', out_data_train');
ynn_newelm = sim(siec_newelm, in_data_train');

figure(3)
subplot(3, 1, 1);
plot(out_data_train(:, 1), 'b');
hold on;
plot(ynn_newelm(1, :), 'r');
title('X-Original vs newelm, MSE= ', num2str(mse(out_data_train(:, 1), ynn_newelm(1, :))));

subplot(3, 1, 2);
plot(out_data_train(:, 2), 'b');
hold on;
plot(ynn_newelm(2, :), 'r');
title('Y-Original vs newelm, MSE= ', num2str(mse(out_data_train(:, 2), ynn_newelm(2, :))));

subplot(3, 1, 3);
plot(out_data_train(:, 3), 'b');
hold on;
plot(ynn_newelm(3, :), 'r');
title('Y-Original vs newelm, MSE= ', num2str(mse(out_data_train(:, 3), ynn_newelm(3, :))));

%newrb & newrbe
MN = 50;
DF = 5;
GOAL = 0;
SPREAD = 0.5;

siec_newrb = newrb(out_data_train', in_data_train', GOAL, SPREAD, MN, DF);
siec_newrbe = newrbe(out_data_train', in_data_train', SPREAD);

ynn_newrb = sim(siec_newrb, out_data_train');
ynn_newrbe = sim(siec_newrbe, out_data_train');

%newrb
figure(4)
subplot(3, 1, 1);
plot(out_data_train(:, 1), 'b');
hold on;
plot(ynn_newrb(1, :), 'r');
title('X-Original vs newrb, MSE= ', num2str(mse(out_data_train(:, 1), ynn_newrb(1, :))));

subplot(3, 1, 2);
plot(out_data_train(:, 2), 'b');
hold on;
plot(ynn_newrb(2, :), 'r');
title('Y-Original vs newrb, MSE= ', num2str(mse(out_data_train(:, 2), ynn_newrb(2, :))));

subplot(3, 1, 3);
plot(out_data_train(:, 3), 'b');
hold on;
plot(ynn_newrb(3, :), 'r');
title('Y-Original vs newrb, MSE= ', num2str(mse(out_data_train(:, 3), ynn_newrb(3, :))));

%newrbe
figure(5)
subplot(3, 1, 1);
plot(out_data_train(:, 1), 'b');
hold on;
plot(ynn_newrbe(1, :), 'r');
title('X-Original vs newrbe, MSE= ', num2str(mse(out_data_train(:, 1), ynn_newrbe(1, :))));

subplot(3, 1, 2);
plot(out_data_train(:, 2), 'b');
hold on;
plot(ynn_newrbe(2, :), 'r');
title('Y-Original vs newrbe, MSE= ', num2str(mse(out_data_train(:, 2), ynn_newrbe(2, :))));

subplot(3, 1, 3);
plot(out_data_train(:, 3), 'b');
hold on;
plot(ynn_newrbe(3, :), 'r');
title('Y-Original vs newrbe, MSE= ', num2str(mse(out_data_train(:, 3), ynn_newrbe(3, :))));
