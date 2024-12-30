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

zakres = [0 length(in_data_train)];
liczba_n_h1 = 10;
liczba_n_h2 = 50;
liczba_n_o = 1;
siec = newff([zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres], [liczba_n_h1 liczba_n_h2 liczba_n_o], {'tansig','tansig', 'purelin'}, 'trainlm');
siec.trainParam.epochs = 150;
siec.trainParam.goal = 1e-5;

siec = train(siec, in_data_train', out_data_train');
ynn = sim(siec, in_data_train');

figure;
plot(out_data_train, 'o', MarkerSize=10); hold on; grid;
plot(ynn, 'x', MarkerSize=10);
legend ('Wartości oczekiwane','Wartości przewidywane');
title('Newff, MSE= ', num2str(mse(out_data_train, ynn)));
