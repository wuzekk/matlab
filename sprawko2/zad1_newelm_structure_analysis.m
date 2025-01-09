
close all
clear all
clc

x1 = -10:0.1:10;
x2 = x1(2:end);
x1 = x1(1:end - 1);
X = [x1; x2];
y = sin(x1);


%% jedna warstwa ukryta

zakres = [-20 20];
liczba_n_h1=15;
liczba_n_o=1;
layers = [liczba_n_h1 liczba_n_o];
liczba_warstw_ukrytych = length(layers) - 1;


siec_newelm = newelm([zakres; zakres], [liczba_n_h1 liczba_n_o], {'tansig', 'purelin'}, 'trainlm');
siec_newelm.trainParam.epochs = 100;
siec_newelm.trainParam.goal = 0;

siec_newelm = train(siec_newelm, X, y);
ynn_newelm = sim(siec_newelm, X);

figure(1)
plot(ynn_newelm,'r');
grid; hold on;
plot(y,'b--');
legend('target', 'input')
mseValue1 = mse(y,ynn_newelm);

titleString = sprintf('MSE = %d\nIlość neuronów w sieci = %d\nLiczba warstw ukrytych = %d',mseValue1, liczba_n_h1, liczba_warstw_ukrytych);
title(titleString);

%% dwie warstwy ukryte


liczba_n_h1=15;
liczba_n_h2=10;
liczba_n_o=1;
layers = [liczba_n_h1 liczba_n_h2 liczba_n_o];
liczba_warstw_ukrytych = length(layers) - 1;


siec_newelm = newelm([zakres; zakres], [liczba_n_h1 liczba_n_h2 liczba_n_o], {'tansig','tansig', 'purelin'}, 'trainlm');
siec_newelm.trainParam.epochs = 100;
siec_newelm.trainParam.goal = 0;

siec_newelm = train(siec_newelm, X, y);
ynn_newelm = sim(siec_newelm, X);

figure(2)
plot(ynn_newelm,'r');
grid; hold on;
plot(y,'b--');
legend('target', 'input')
mseValue1 = mse(y,ynn_newelm);


titleString = sprintf('MSE = %d\nIlość neuronów w sieci = %d\nLiczba warstw ukrytych = %d',mseValue1, liczba_n_h1 + liczba_n_h2, liczba_warstw_ukrytych);
title(titleString);


%% trzy warstwy ukryte


liczba_n_h1=30;
liczba_n_h2=20;
liczba_n_h3=10;
liczba_n_o=1;
layers = [liczba_n_h1 liczba_n_h2 liczba_n_h3 liczba_n_o];
liczba_warstw_ukrytych = length(layers) - 1;


siec_newelm = newelm([zakres; zakres], [liczba_n_h1 liczba_n_h2 liczba_n_h3 liczba_n_o], {'tansig','tansig', 'tansig' 'purelin'}, 'trainlm');
siec_newelm.trainParam.epochs = 100;
siec_newelm.trainParam.goal = 0;

siec_newelm = train(siec_newelm, X, y);
ynn_newelm = sim(siec_newelm, X);

figure(4)
plot(ynn_newelm,'r');
grid; hold on;
plot(y,'b--');
legend('target', 'input')
mseValue1 = mse(y,ynn_newelm);


titleString = sprintf('MSE = %d\nIlość neuronów w sieci = %d\nLiczba warstw ukrytych = %d',mseValue1, liczba_n_h1 + liczba_n_h2 + liczba_n_h3, liczba_warstw_ukrytych);
title(titleString);


%% cztery warstwy ukryte

liczba_n_h1=30;
liczba_n_h2=20;
liczba_n_h3=10;
liczba_n_h4=10;
liczba_n_o=1;
layers = [liczba_n_h1 liczba_n_h2 liczba_n_h3 liczba_n_h4 liczba_n_o];
liczba_warstw_ukrytych = length(layers) - 1;


siec_newelm = newelm([zakres; zakres], [liczba_n_h1 liczba_n_h2 liczba_n_h3 liczba_n_h4 liczba_n_o], {'tansig','tansig', 'tansig','tansig' 'purelin'}, 'trainlm');
siec_newelm.trainParam.epochs = 100;
siec_newelm.trainParam.goal = 0;

siec_newelm = train(siec_newelm, X, y);
ynn_newelm = sim(siec_newelm, X);

figure(4)
plot(ynn_newelm,'r');
grid; hold on;
plot(y,'b--');
legend('target', 'input')
mseValue1 = mse(y,ynn_newelm);


titleString = sprintf('MSE = %d\nIlość neuronów w sieci = %d\nLiczba warstw ukrytych = %d',mseValue1, liczba_n_h1 + liczba_n_h2 + liczba_n_h3 + liczba_n_h4, liczba_warstw_ukrytych);
title(titleString);

