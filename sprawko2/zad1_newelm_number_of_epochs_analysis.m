
close all
clear all
clc

x1 = -10:0.1:10;
x2 = x1(2:end);
x1 = x1(1:end - 1);
X = [x1; x2];
y = sin(x1);


%% liczba epok 50

zakres = [-20 20];
liczba_n_h1=15;
liczba_n_h2=10;
liczba_n_o=1;
layers = [liczba_n_h1 liczba_n_h2 liczba_n_o];
liczba_warstw_ukrytych = length(layers) - 1;
liczba_epochs = 50;
fun_act = 'tansig';
learning_met = 'trainlm';


siec_newelm = newelm([zakres; zakres], [liczba_n_h1 liczba_n_h2  liczba_n_o], {fun_act,fun_act, 'purelin'}, learning_met);
siec_newelm.trainParam.epochs = liczba_epochs;
siec_newelm.trainParam.goal = 0;

siec_newelm = train(siec_newelm, X, y);
ynn_newelm = sim(siec_newelm, X);

figure(1)
plot(ynn_newelm,'r');
grid; hold on;
plot(y,'b--');
legend('target', 'input')
mseValue1 = mse(y,ynn_newelm);

titleString = sprintf('MSE = %d\nLiczba epok = %d',mseValue1, learning_met);
title(titleString);

%% liczba epok 100

liczba_epochs = 100;


siec_newelm = newelm([zakres; zakres], [liczba_n_h1 liczba_n_h2  liczba_n_o], {fun_act,fun_act, 'purelin'}, learning_met);
siec_newelm.trainParam.epochs = liczba_epochs;
siec_newelm.trainParam.goal = 0;

siec_newelm = train(siec_newelm, X, y);
ynn_newelm = sim(siec_newelm, X);

figure(2)
plot(ynn_newelm,'r');
grid; hold on;
plot(y,'b--');
legend('target', 'input')
mseValue1 = mse(y,ynn_newelm);

titleString = sprintf('MSE = %d\nLiczba epok = %d',mseValue1, learning_met);
title(titleString);


%% liczba epok 200

liczba_epochs = 200;



siec_newelm = newelm([zakres; zakres], [liczba_n_h1 liczba_n_h2  liczba_n_o], {fun_act,fun_act, 'purelin'}, learning_met);
siec_newelm.trainParam.epochs = 100;
siec_newelm.trainParam.goal = 0;

siec_newelm = train(siec_newelm, X, y);
ynn_newelm = sim(siec_newelm, X);

figure(3)
plot(ynn_newelm,'r');
grid; hold on;
plot(y,'b--');
legend('target', 'input')
mseValue1 = mse(y,ynn_newelm);

titleString = sprintf('MSE = %d\nLiczba epok = %d',mseValue1, learning_met);
title(titleString);


%% liczba epok 500

liczba_epochs = 500;

siec_newelm = newelm([zakres; zakres], [liczba_n_h1 liczba_n_h2  liczba_n_o], {fun_act,fun_act, 'purelin'}, learning_met);
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

titleString = sprintf('MSE = %d\nLiczba epok = %d',mseValue1, learning_met);
title(titleString);
