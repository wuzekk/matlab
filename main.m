%% nie wiem kurwa jak to zrobić tak, żeby się ładnie printowało 
%% bo teraz to wygląda jak totalna sraka :(((
% Zestawy parametrów
% Parametry zestawów danych
AC = [7 4 0];
DP = [7 3 9];
IP = [7 2 9];
MR = [7 5 7];
sets = {AC, DP, IP, MR};

num_elements = 100;
max_iterations = 50;
learning_rate = 0.00001;
degree = 3; % stopień wielomianu dla polynomial_regression
d = 1; % dodatkowy parametr dla polynomial_regression

% Wywołania funkcji dla każdego zestawu
for i = 1:length(sets)
    a = sets{i}(1);
    b = sets{i}(2);
    c = sets{i}(3);
    
    % Wydruk informacji o zestawie danych
    fprintf('================ Zestaw %d ================\n', i);
    fprintf('Parametry: a = %d, b = %d, c = %d\n', a, b, c);
    
    % Linear regression
    [R21, R22, R23] = linear_regression(a, b, c, num_elements);
    fprintf('\n--- Linear Regression ---\n');
    fprintf('R^2 (slope): %.4f\n', R21);
    fprintf('R^2 (slope and intercept): %.4f\n', R22);
    fprintf('R^2 (manual calculation): %.4f\n', R23);
    
    % Multiple linear regression
    [coefficients, predicted_values] = multiple_lin_reg(a, b, c, num_elements);
    fprintf('\n--- Multiple Linear Regression ---\n');
    fprintf('Regression coefficients:\n');
    disp(coefficients); % wyświetlanie macierzy współczynników
    
    % Polynomial regression
    variables = [a, b, c, d];
    fprintf('\n--- Polynomial Regression (degree %d) ---\n', degree);
    polynomial_regression(variables, num_elements, degree); % Wywołanie bez przypisania wyniku
    
    % Gradient descent
    [gradient_result] = gradient_desc(a, b, c, num_elements, max_iterations, learning_rate);
    fprintf('\n--- Gradient Descent ---\n');
    disp('Gradient descent result:');
    disp(gradient_result);
    
    fprintf('==========================================\n\n');
end

