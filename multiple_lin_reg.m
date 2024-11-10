function [outputArg1, outputArg2] = multiple_lin_reg(a, b, c, num_elements)

x = 1:1:num_elements;
y = a * x + b * randn(1, num_elements);
y = y + c;

Y = y';
X = x';

X = [ones(size(X)) X];
A = regress(Y, X);

Ye = A' * X';

figure(1)
plot(Ye, 'k', 'LineWidth', 3); grid on; hold on; xlabel('x'); ylabel('y');
plot(x, y, '*', 'LineWidth', 3); 
legend('Ye', 'y');
title('Multiple Linear Regression')

outputArg1 = A;  % Coefficients of the regression model
outputArg2 = Ye; % Predicted values
end
