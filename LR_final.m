% Plik wywołuje funkcje linear_regression dla kazdego zestawu parametrow. Prosze uzywac cltr + enter dla kazdej sekcji (?) kodu Pzdr. DP.

AC = [7 4 0];
DP = [7 3 9];
IP = [7 2 9];
MR = [7 5 7];

num_elements = 100;
save data_LR

%% Linear regression zestaw 1
clear;
load data_LR.mat

a = AC(1);
b = AC(2);
c = AC(3);
[R21, R22, R23] = linear_regression(a, b, c, num_elements);

disp('--- Zestaw 1 ---')
disp(['R^2 for simple linear regression (slope): ', num2str(R21)]);
disp(['R^2 for linear regression (slope and intercept): ', num2str(R22)]);
disp(['R^2 for manual linear regression calculation: ', num2str(R23)]);
%% Linear regression zestaw 2
clear;
load data_LR.mat

a = DP(1);
b = DP(2);
c = DP(3);
[R21, R22, R23] = linear_regression(a, b, c, num_elements);

disp('--- Zestaw 2 ---')
disp(['R^2 for simple linear regression (slope): ', num2str(R21)]);
disp(['R^2 for linear regression (slope and intercept): ', num2str(R22)]);
disp(['R^2 for manual linear regression calculation: ', num2str(R23)]);
%% Linear regression zestaw 3
clear;
load data_LR.mat

a = IP(1);
b = IP(2);
c = IP(3);
[R21, R22, R23] = linear_regression(a, b, c, num_elements);

disp('--- Zestaw 3 ---')
disp(['R^2 for simple linear regression (slope): ', num2str(R21)]);
disp(['R^2 for linear regression (slope and intercept): ', num2str(R22)]);
disp(['R^2 for manual linear regression calculation: ', num2str(R23)]);
%% Linear regression zestaw 4
clear;
load data_LR.mat

a = MR(1);
b = MR(2);
c = MR(3);
[R21, R22, R23] = linear_regression(a, b, c, num_elements);

disp('--- Zestaw 4 ---')
disp(['R^2 for simple linear regression (slope): ', num2str(R21)]);
disp(['R^2 for linear regression (slope and intercept): ', num2str(R22)]);
disp(['R^2 for manual linear regression calculation: ', num2str(R23)]);
