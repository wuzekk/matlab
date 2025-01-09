
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

%% trainlm

zakres = [-20 20];
liczba_n_h1=15;
liczba_n_h2=10;
liczba_n_o = 1; 
layers = [liczba_n_h1 liczba_n_h2 liczba_n_o];
liczba_warstw_ukrytych = length(layers) - 1;
liczba_epochs = 100;
fun_act = 'tansig';
learning_met = 'trainlm';


siec_newff = newff([zakres; zakres;zakres], [liczba_n_h1 liczba_n_h2 liczba_n_o], {fun_act,fun_act, 'purelin'}, learning_met);
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

titleString = sprintf('MSE = %d\nMetoda uczenia = %s',mseValue1, learning_met);
title(titleString);



%% trainrp


learning_met = 'trainrp';


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

titleString = sprintf('MSE = %d\nMetoda uczenia = %s',mseValue2, learning_met);
title(titleString);

%% traincgp


learning_met = 'traincgp';


siec_newff = newff([zakres; zakres;zakres], [liczba_n_h1 liczba_n_h2  liczba_n_o], {fun_act,fun_act 'purelin'}, learning_met);
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

titleString = sprintf('MSE = %d\nMetoda uczenia = %s',mseValue3, learning_met);
title(titleString);


%% traingdm

learning_met = 'traingdm';


siec_newff = newff([zakres; zakres;zakres], [liczba_n_h1 liczba_n_h2   liczba_n_o], {fun_act,fun_act, 'purelin'}, learning_met);
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

titleString = sprintf('MSE = %d\nMetoda uczenia = %s',mseValue4, learning_met);
title(titleString);

