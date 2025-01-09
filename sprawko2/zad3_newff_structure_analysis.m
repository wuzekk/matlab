
close all
clear all
clc

x1 = 0:0.1:10;
x2 = x1(2:end);
x3 = x2(2:end);

x1 = x1(1:end - 2);
x2 = x2(1:end - 1);
X = [x1; x2; x3];

y = exp(sin(x1) + 0.1 * sin(5 * x1));

%% jedna warstwa ukryta

zakres = [-20 20];
liczba_n_h1 = 15; 
liczba_n_o = 1; 
layers = [liczba_n_h1 liczba_n_o];
liczba_warstw_ukrytych = length(layers) - 1;
liczba_epochs = 100;
fun_act = 'tansig';
learning_met = 'trainlm';


siec_newff = newff([zakres; zakres;zakres], [liczba_n_h1 liczba_n_o], {fun_act, 'purelin'}, learning_met);
siec_newff.trainParam.epochs = liczba_epochs;
siec_newff.trainParam.goal = 0;

siec_newff = train(siec_newff, X, y);

ynn_newff = sim(siec_newff, X);


figure(1)
plot(ynn_newff,'r');
grid; hold on;
plot(y,'b--');
legend('target', 'input')
mseValue1 = mse(y,ynn_newff);

titleString = sprintf('MSE = %d\nIlość neuronów w sieci = %d\nLiczba warstw ukrytych = %d',mseValue1, liczba_n_h1, liczba_warstw_ukrytych);
title(titleString);



%% dwie warstwy ukryte


liczba_n_h1=15;
liczba_n_h2=10;
liczba_n_o=1;
layers = [liczba_n_h1 liczba_n_h2 liczba_n_o];
liczba_warstw_ukrytych = length(layers) - 1;


siec_newff = newff([zakres; zakres;zakres], [liczba_n_h1 liczba_n_h2 liczba_n_o], {fun_act,fun_act, 'purelin'}, learning_met);
siec_newff.trainParam.epochs = liczba_epochs;
siec_newff.trainParam.goal = 0;

siec_newff = train(siec_newff, X, y);

ynn_newff = sim(siec_newff, X);


figure(2)
plot(ynn_newff,'r');
grid; hold on;
plot(y,'b--');
legend('target', 'input')
mseValue2 = mse(y,ynn_newff);

titleString = sprintf('MSE = %d\nIlość neuronów w sieci = %d\nLiczba warstw ukrytych = %d',mseValue2, liczba_n_h1+liczba_n_h2, liczba_warstw_ukrytych);
title(titleString);

%% trzy warstwy ukryte


liczba_n_h1=30;
liczba_n_h2=20;
liczba_n_h3=10;
liczba_n_o=1;
layers = [liczba_n_h1 liczba_n_h2 liczba_n_h3 liczba_n_o];
liczba_warstw_ukrytych = length(layers) - 1;


siec_newff = newff([zakres; zakres;zakres], [liczba_n_h1 liczba_n_h2 liczba_n_h3 liczba_n_o], {fun_act,fun_act,fun_act 'purelin'}, learning_met);
siec_newff.trainParam.epochs = liczba_epochs;
siec_newff.trainParam.goal = 0;

siec_newff = train(siec_newff, X, y);

ynn_newff = sim(siec_newff, X);


figure(3)
plot(ynn_newff,'r');
grid; hold on;
plot(y,'b--');
legend('target', 'input')
mseValue3 = mse(y,ynn_newff);

titleString = sprintf('MSE = %d\nIlość neuronów w sieci = %d\nLiczba warstw ukrytych = %d',mseValue3, liczba_n_h1+liczba_n_h2+liczba_n_h3, liczba_warstw_ukrytych);
title(titleString);


%% cztery warstwy ukryte

liczba_n_h1=30;
liczba_n_h2=20;
liczba_n_h3=10;
liczba_n_h4=10;
liczba_n_o=1;
layers = [liczba_n_h1 liczba_n_h2 liczba_n_h3 liczba_n_h4 liczba_n_o];
liczba_warstw_ukrytych = length(layers) - 1;


siec_newff = newff([zakres; zakres;zakres], [liczba_n_h1 liczba_n_h2 liczba_n_h3 liczba_n_h4 liczba_n_o], {fun_act,fun_act,fun_act,fun_act 'purelin'}, learning_met);
siec_newff.trainParam.epochs = liczba_epochs;
siec_newff.trainParam.goal = 0;

siec_newff = train(siec_newff, X, y);

ynn_newff = sim(siec_newff, X);


figure(4)
plot(ynn_newff,'r');
grid; hold on;
plot(y,'b--');
legend('target', 'input')
mseValue4 = mse(y,ynn_newff);

titleString = sprintf('MSE = %d\nIlość neuronów w sieci = %d\nLiczba warstw ukrytych = %d',mseValue4, liczba_n_h1+liczba_n_h2+liczba_n_h3+liczba_n_h4, liczba_warstw_ukrytych);
title(titleString);

