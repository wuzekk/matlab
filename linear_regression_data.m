a = 7;
b = 5;
c = 7;
num_elements = 100;

[R21, R22, R23] = linear_regression(a, b, c, num_elements);
% Współczynniki R^2 dla każdego z modeli
disp(['R^2 for simple linear regression (slope): ', num2str(R21)]);
disp(['R^2 for linear regression (slope and intercept): ', num2str(R22)]);
disp(['R^2 for manual linear regression calculation: ', num2str(R23)]);
