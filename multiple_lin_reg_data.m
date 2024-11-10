a = 7;
b = 5;
c = 7;
num_elements = 100;

[coefficients, predicted_values] = multiple_lin_reg(a, b, c, num_elements);
disp('Regression coefficients:');
disp(coefficients);
