function [R21, R22, R23] = linear_regression(a, b, c, num_elements)
% Funkcja wykonuje regresję liniową na danych generowanych za pomocą wzoru y = a*x + b*randn + c
% Zwraca wartości R^2 dla trzech różnych podejść do regresji liniowej: bez wyrazu wolnego, z wyrazem wolnym i wyliczone ręcznie.

x = 1:1:num_elements;
y = a * x + b * randn(1, num_elements);
y = y + c;

Y = y';
X = x';
X = [ones(size(X)) X];

%% Regresja liniowa z samym nachyleniem (bez wyrazu wolnego)
B1 = y / x;
ye1 = B1 * x;

% Wykres dla regresji liniowej z samym nachyleniem
subplot(3, 1, 1); % Pierwszy subplot
plot(x, y, '*', 'LineWidth', 3); grid on; hold on; xlabel('x'); ylabel('y');
plot(x, ye1, 'k', 'LineWidth', 3);
legend('y', 'ye1');
title('Linear regression (slope)');

%% Regresja liniowa z wyrazem wolnym i nachyleniem
B2 = X \ Y;
ye2 = X * B2;

% Wykres dla regresji liniowej z wyrazem wolnym i nachyleniem
subplot(3, 1, 2); % Drugi subplot
plot(x, y, '*', 'LineWidth', 3); grid on; hold on; xlabel('x'); ylabel('y');
plot(x, ye2, 'k', 'LineWidth', 3);
legend('y', 'ye2');
title('Linear regression (slope and intercept)');

%% Ręczne obliczenie regresji liniowej
xm = sum(x) / length(x);
ym = sum(y) / length(y);
a1 = (sum((x - xm) .* (y - ym))) / sum((x - xm) .^ 2);
a0 = ym - (a1 * xm);

% Składanie wyników regresji ręcznej w wektor
B3 = [a0; a1];
ye3 = X * B3;

% Wykres dla ręcznie obliczonego modelu regresji liniowej
subplot(3, 1, 3); % Trzeci subplot
plot(x, y, '*', 'LineWidth', 3); grid on; hold on; xlabel('x'); ylabel('y');
plot(x, ye3, 'k', 'LineWidth', 3);
legend('y', 'ye3');
title('Manual linear regression');

% Obliczenie współczynnika R^2 dla pierwszego, drugiego i trzeciego modelu
R21 = 1 - sum((y - ye1) .^ 2) / sum((y - mean(y)) .^ 2);
R22 = 1 - sum((y - ye2') .^ 2) / sum((y - mean(y)) .^ 2);
R23 = 1 - sum((y - ye3') .^ 2) / sum((y - mean(y)) .^ 2);

end
