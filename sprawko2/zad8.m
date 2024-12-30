clear; clc; close all; warning off;

% zero
A = [0 1 1 1 0
     1 0 0 0 1
     1 0 0 0 1
     1 0 0 0 1
     0 1 1 1 0];

a = A(:)'; %przepisywanie wartosci z macierzy do wektora

in_data_train = a;
out_data_train = 0;

% jeden
A = [0 0 0 1 0
     0 0 1 1 0
     0 1 0 1 0
     0 0 0 1 0
     0 0 0 1 0];

a = A(:)';

in_data_train = [in_data_train;a];
out_data_train = [out_data_train; 1];

% dwa
A = [0 0 1 1 0
     0 1 0 0 1
     0 0 0 1 0
     0 0 1 0 0
     0 1 1 1 1];

a = A(:)';

in_data_train = [in_data_train;a];
out_data_train = [out_data_train; 2];

% trzy
A = [0 0 1 1 0
     0 0 0 0 1
     0 0 1 1 0
     0 0 0 0 1
     0 0 1 1 0];

a = A(:)';

in_data_train = [in_data_train;a];
out_data_train = [out_data_train; 3];

% cztery
A = [0 0 1 0 0
     0 1 0 0 0
     0 1 1 1 0
     0 0 1 0 0
     0 0 1 0 0];

a = A(:)';

in_data_train = [in_data_train;a];
out_data_train = [out_data_train; 4];

% piec
A = [0 1 1 1 0
     1 0 0 0 0
     0 1 1 0 0
     0 0 0 1 0
     0 1 1 0 0];

a = A(:)';

in_data_train = [in_data_train;a];
out_data_train = [out_data_train; 5];

% szesc
A = [0 1 1 1 0
     1 0 0 0 0
     1 1 1 1 0
     1 0 0 0 1
     0 1 1 1 0];

a = A(:)';

in_data_train = [in_data_train;a];
out_data_train = [out_data_train; 6];

% siedem
A = [0 1 1 1 1
     0 0 0 0 1
     0 0 0 1 0
     0 0 1 0 0
     0 1 0 0 0];

a = A(:)';

in_data_train = [in_data_train;a];
out_data_train = [out_data_train; 7];

% osiem
A = [0 1 1 1 0
     1 0 0 0 1
     0 1 1 1 0
     1 0 0 0 1
     0 1 1 1 0];

a = A(:)';

in_data_train = [in_data_train;a];
out_data_train = [out_data_train; 8];

% dziewiec
A = [0 1 1 1 0
     1 0 0 0 1
     0 1 1 1 1
     0 0 0 0 1
     0 1 1 1 0];

a = A(:)';

in_data_train = [in_data_train;a];
out_data_train = [out_data_train; 9];

% newff
zakres = [0 length(in_data_train)];
liczba_n_h1 = 10;
liczba_n_h2 = 50;
liczba_n_o = 1;
siec_ff = newff([zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres], [liczba_n_h1 liczba_n_h2 liczba_n_o], {'tansig','tansig', 'purelin'}, 'trainlm');
siec_ff.trainParam.epochs = 150;
siec_ff.trainParam.goal = 1e-5;

[siec_ff, stats_ff] = train(siec_ff, in_data_train', out_data_train');
ynn_ff = sim(siec_ff, in_data_train');

figure;
subplot(1, 2, 1)
plot(out_data_train, 'o', MarkerSize=10); hold on; grid;
plot(ynn_ff, 'x', MarkerSize=10);
legend ('Input','Output');
title('Newff', ['MSE = ', num2str(mean(((out_data_train'-ynn_ff).^2)))]);

% newelm
zakres = [0 length(in_data_train)];
liczba_n_h1 = 10;
liczba_n_h2 = 50;
liczba_n_o = 1;
siec_elm = newelm([zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres], [liczba_n_h1 liczba_n_h2 liczba_n_o], {'tansig','tansig', 'purelin'}, 'trainlm');
siec_elm.trainParam.epochs = 150;
siec_elm.trainParam.goal = 1e-5;

[siec_elm, stats_elm] = train(siec_elm, in_data_train', out_data_train');
ynn_elm = sim(siec_elm, in_data_train');

subplot(1, 2, 2)
plot(out_data_train, 'o', MarkerSize=10); hold on; grid;
plot(ynn_elm, 'x', MarkerSize=10);
legend ('Input','Output');
title('Newelm', ['MSE = ', num2str(mean(((out_data_train'-ynn_elm).^2)))]);

