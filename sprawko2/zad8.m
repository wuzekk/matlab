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

siec_ff = train(siec_ff, in_data_train', out_data_train');
ynn_ff = sim(siec_ff, in_data_train');

figure;
subplot(1, 2, 1)
plot(out_data_train, 'o', MarkerSize=10); hold on; grid;
plot(ynn_ff, 'x', MarkerSize=10);
legend ('Target','Output');
title('Newff', ['MSE = ', num2str(mean(((out_data_train'-ynn_ff).^2)))]);

% newelm
zakres = [0 length(in_data_train)];
liczba_n_h1 = 10;
liczba_n_h2 = 50;
liczba_n_o = 1;
siec_elm = newelm([zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres;zakres; zakres; zakres; zakres; zakres], [liczba_n_h1 liczba_n_h2 liczba_n_o], {'tansig','tansig', 'purelin'}, 'trainlm');
siec_elm.trainParam.epochs = 150;
siec_elm.trainParam.goal = 1e-5;

siec_elm = train(siec_elm, in_data_train', out_data_train');
ynn_elm = sim(siec_elm, in_data_train');

subplot(1, 2, 2)
plot(out_data_train, 'o', MarkerSize=10); hold on; grid;
plot(ynn_elm, 'x', MarkerSize=10);
legend ('Target','Output');
title('Newelm', ['MSE = ', num2str(mean(((out_data_train'-ynn_elm).^2)))]);

%% newrb
MN_values = [1, 5, 10, 50];
DF = 5;
GOAL = 0;
SPREAD_values = [0.01, 0.1, 0.5, 1];

for SPREAD = SPREAD_values
    figure;
    for idx = 1:length(MN_values)
        MN = MN_values(idx);

        siec_rb = newrb(in_data_train', out_data_train', GOAL, SPREAD, MN, DF);
        ynn_rb = siec_rb(in_data_train');
        MSE_rb = mean(((out_data_train' - ynn_rb).^2));
        
        subplot(2, 2, idx);
        plot(out_data_train, 'o', MarkerSize=10); hold on; grid;
        plot(ynn_rb, 'x', MarkerSize=10);
        legend('Target', 'Output');
        title(['MN=', num2str(MN), ', MSE=', num2str(MSE_rb)]);
    end
    sgtitle(['Analiza maksymalnej liczby neuronów (MN) sieci radialnej newrb dla SPREAD = ', num2str(SPREAD)]);
end

% newrbe
for SPREAD = SPREAD_values
    figure;
    for idx = 1:length(MN_values)
        MN = MN_values(idx);

        siec_rbe = newrbe(in_data_train', out_data_train', SPREAD);
        ynn_rbe = siec_rbe(in_data_train');
        MSE_rbe = mean(((out_data_train' - ynn_rbe).^2));

        subplot(2, 2, idx);
        plot(out_data_train, 'o', MarkerSize=10); hold on; grid;
        plot(ynn_rbe, 'x', MarkerSize=10);
        legend('Target', 'Output');
        title(['MN=', num2str(MN), ', MSE=', num2str(MSE_rbe)]);
    end
     sgtitle(['Analiza maksymalnej liczby neuronów (MN) sieci radialnej newrbe dla SPREAD = ', num2str(SPREAD)]);
end