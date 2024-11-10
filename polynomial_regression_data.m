a = 7;
b = 5;
c = 7;
d = 1; % przykład dodatkowego parametru d dla wzoru wyjściowego

% Liczba elementów i stopień wielomianu
num_elements = 50;
degree = 3; % wybrany stopień wielomianu (możesz zmienić na wyższy lub niższy w zależności od potrzeb)

% Tworzenie wektora zmiennych do przekazania do funkcji
variables = [a, b, c, d];

% Wywołanie funkcji polynomial_regression
polynomial_regression(variables, num_elements, degree);