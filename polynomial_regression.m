function polynomial_regression(a,b,c,d,num_elements)

    x = 1:1:num_elements;
    y = a * x + b * ((x + randn(1, num_elements)) .^ d);
    y = y + c;
    Y = y';
    X = x';

    % regression 2nd degree
    X = [ones(size(X)) X X .^ 2];
    B3 = X \ Y;
    ye3 = X * B3;

    % ploting for 2nd degree
    figure(1);
    plot(x, y, '*', 'LineWidth', 3); grid; hold on;
    xlabel('x'); ylabel('y');
    plot(x, ye3, 'k', 'LineWidth', 3);
    title('Polynomial regression (2nd degree)');

    % R^2 for 2nd degree
    R2_3 = 1 - sum((y - ye3') .^ 2) / sum((y - mean(y)) .^ 2);
    disp('R^2 for polynomial regression of degree 2');disp(R2_3);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % for 1st deegree
    w = polyfit(x, y, 1);
    xt = 1:0.5:num_elements;
    yt = polyval(w, xt);

    figure(2);
    plot(xt, yt, 'k', 'LineWidth', 3); grid; hold on;
    plot(x, y, '*', 'LineWidth', 3);
    xlabel('x'); ylabel('y');
    title('Polynomial fit degree - 1');
    legend('Polynomial values', 'Original data');

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % for 2nd degree
    w = polyfit(x, y, 2);
    yt = polyval(w, xt);

    figure(3);
    plot(xt, yt, 'k', 'LineWidth', 3); grid; hold on;
    plot(x, y, '*', 'LineWidth', 3);
    xlabel('x'); ylabel('y');
    title('Polynomial fit degree - 2');
    legend('Polynomial values', 'Original data');

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Regression with confidence bounds
    [w, D] = polyfit(x, y, 1);
    [ye, D1] = polyval(w, x, D);

    figure(4);
    plot(x, y, '*k', 'LineWidth', 3); grid; hold on;
    plot(x, ye, 'r', 'LineWidth', 3);
    plot(x, ye - 1 * D1, 'g', 'LineWidth', 3);
    plot(x, ye + 1 * D1, 'g', 'LineWidth', 3);
    xlabel('x'); ylabel('y');
    title("Regression with Confidence Bounds");
    legend('Original values', 'Regression line', 'Bounds');

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Polynomial Regression with Matrix Approach
    x = 1:1:num_elements;
    y = a * x + b * ((x + randn(1, num_elements)) .^ d);
    y = y + c;
    Y = y';

    % Tworzenie macierzy X dla wielomianu 2. stopnia
    X = [ones(size(x')) x' (x').^2];
    B = X \ Y;           % Obliczanie współczynników
    ye = X * B;          % Predykcja wartości y za pomocą modelu

    figure(5);
    plot(x, y, '*k', 'LineWidth', 3); grid; hold on;
    plot(x, ye, 'r', 'LineWidth', 3);
    xlabel('x'); ylabel('y');
    title("Polynomial Regression with Matrix Approach");
    legend('Data', 'Fitted Polynomial');
end