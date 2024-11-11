% Plik wywołuje funkcje multiple_lin_reg dla kazdego zestawu parametrow. 

AC = [7 4 0];
DP = [7 3 9];
IP = [7 2 9];
MR = [7 5 7];

num_elements = 100;
save data_MLR

%% Multiple linear regression zestaw 1
clear;
load data_MLR.mat

a = AC(1);
b = AC(2);
c = AC(3);
[coefficients, predicted_values] = multiple_lin_reg(a, b, c, num_elements);

disp('--- Zestaw 1 ---')
disp('Regression coefficients:');
disp(coefficients);
%% Multiple linear regression zestaw 2
clear;
load data_MLR.mat

a = DP(1);
b = DP(2);
c = DP(3);
[coefficients, predicted_values] = multiple_lin_reg(a, b, c, num_elements);

disp('--- Zestaw 2 ---')
disp('Regression coefficients:');
disp(coefficients);
%% Multiple linear regression zestaw 3
clear;
load data_MLR.mat

a = IP(1);
b = IP(2);
c = IP(3);
[coefficients, predicted_values] = multiple_lin_reg(a, b, c, num_elements);

disp('--- Zestaw 3 ---')
disp('Regression coefficients:');
disp(coefficients);
%% Multiple linear regression zestaw 4
clear;
load data_MLR.mat

a = MR(1);
b = MR(2);
c = MR(3);
[coefficients, predicted_values] = multiple_lin_reg(a, b, c, num_elements);

disp('--- Zestaw 4 ---')
disp('Regression coefficients:');
disp(coefficients);
