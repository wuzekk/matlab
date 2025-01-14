AC = [7 4 0];
DP = [7 3 9];
IP = [7 2 9];
MR = [7 5 7];
sets = {AC, DP, IP, MR};
set_names = {'AC', 'DP', 'IP', 'MR'};
num_elements = 50; % zmienione dla testow

y_min = -50;
y_max = 300;

%% Multiple Linear Regression
% Przygotowanie figure z podziałem na 4 subploty
figure;
set(gcf, 'Position', [100, 100, 1200, 800]); % Ustawienie rozmiaru okna

% Pętla po zestawach parametrów
for i = 1:length(sets)
    a = sets{i}(1);
    b = sets{i}(2);
    c = sets{i}(3);

    subplot_handle = subplot(2, 2, i);
    hold(subplot_handle, 'on');

    % Wywołanie funkcji multiple_lin_reg z uchwytem subplotu
    [coefficients, predicted_values] = multiple_lin_reg(a, b, c, num_elements, subplot_handle);

    ylim(subplot_handle, [y_min y_max]);
    title(subplot_handle, ['Zestaw ', num2str(i), ' - ', set_names{i}]);
    fprintf('--- Zestaw %d - %s ---\n', i, set_names{i});
    disp('Regression coefficients:');
    disp(coefficients);
end

% Tytuł główny dla całej figury
sgtitle('Multiple Linear Regression');

%% Linear Regression
% Pętla po zestawach parametrów dla drugiej części analizy
for i = 1:length(sets)
    % Pobieranie parametrów z aktualnego zestawu
    a = sets{i}(1);
    b = sets{i}(2);
    c = sets{i}(3);

    % Tworzenie nowej figury dla każdego zestawu
    figure;
    set(gcf, 'Position', [100, 100, 1200, 800]); % Ustawienie rozmiaru okna

    % Tytuł główny dla całej figury
    sgtitle(['Linear regression: ', 'Zestaw', num2str(i), ' - ', set_names{i}]);

    % Wywołanie funkcji linear_regression
    [R21, R22, R23] = linear_regression(a, b, c, num_elements);

    % Zakresy dla osi Y (tylko raz ustawiane dla każdego zestawu)
    ylim([y_min y_max]);

    % Wydruk wyników dla każdego zestawu
    fprintf('--- Zestaw %d - %s ---\n', i, set_names{i});
    disp(['R^2 for simple linear regression (slope): ', num2str(R21)]);
    disp(['R^2 for linear regression (slope and intercept): ', num2str(R22)]);
    disp(['R^2 for manual linear regression calculation: ', num2str(R23)]);
end

%% Polynomial regression

d = 1; % przykladowa wartosc

for i = 1:length(sets)
    % Pobieranie parametrów z aktualnego zestawu
    a = sets{i}(1);
    b = sets{i}(2);
    c = sets{i}(3);

    figure;
    set(gcf, 'Position', [100, 100, 1200, 800]); % Ustawienie rozmiaru okna

    % Tytuł główny dla całej figury
    sgtitle(['polynomial regression: ', 'Zestaw', num2str(i), ' - ', set_names{i}]);

    % Wywołanie funkcji polynomial_regression
    fprintf('--- Zestaw %d - %s ---\n', i, set_names{i});
    polynomial_regression(a, b, c, d, num_elements);
end

%% Gradient descent (dziwnie wygladaja te wykresy :/)
alfa = 0.00001;
num_iteration = 50;
A = randn(2, 1);

for i = 1:length(sets)
    % Pobieranie parametrów z aktualnego zestawu
    a = sets{i}(1);
    b = sets{i}(2);
    c = sets{i}(3);

    figure;
    set(gcf, 'Position', [100, 100, 1200, 800]); % Ustawienie rozmiaru okna

    % Tytuł główny dla całej figury
    sgtitle(['Gradient descent: ', 'Zestaw', num2str(i), ' - ', set_names{i}]);

    % Wywołanie funkcji gradient_desc
    gradient_desc(a, b, c, num_elements, num_iteration, alfa, A);
end

%% Logistic Regression

for i = 1:length(sets)
    % Pobieranie parametrów z aktualnego zestawu
    a = sets{i}(1);
    b = sets{i}(2);
    c = sets{i}(3);

    figure(i);
    set(gcf, 'Position', [100, 100, 1200, 800]); % Ustawienie rozmiaru okna

    % Tytuł główny dla całej figury
    sgtitle(['logistic regression: ', 'Zestaw', num2str(i), ' - ', set_names{i}]);

    % Wywołanie funkcji logistic_regression
    logistic_regression(num_elements, a, b, c);

end
