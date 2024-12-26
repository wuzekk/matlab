function [params_optim, R2_1, R2_2] = logistic_regression(num_elements, a, b, c)

    % Function to perform logistic regression on generated random data

    x = linspace(0, 1, num_elements);
    y = a * x + b * randn(1, num_elements);
    y = y + c;

    % Split data into two sets
    x1 = x(1:2:end);
    x2 = x(2:2:end);
    y1 = y(1:2:end);
    y2 = y(2:2:end);

    Y = y1';
    X = [x1' ones(size(x1'))];
    x = x1;
    y = y1;

    % Plot original data
    subplot(3, 1, 1);
    plot(x, y, '*', 'LineWidth', 3);
    grid on;
    xlabel('x');
    ylabel('y');
    title('Regresja logistyczna - dane')

    % Define the cost function for logistic regression
    cost_function = @(params) -1 / length(X) * sum((Y .* log(logsig(X * params'))) + ((1 - Y) .* log(1 - logsig(X * params'))));

    options = optimset('Display', 'iter', 'MaxIter', 150, 'TolFun', 0, 'TolX', 0);
    %dodałem 'TolX', 0, i tolfun żeby nie wyłączało funkcji wczesniej tylko zeby wszystko szlo do 150

    % Initialize parameters for optimization
    params_init = randn(1, size(X, 2));
    params_low_bounds = [];
    params_up_bounds = [];

    params_optim = lsqnonlin(cost_function, params_init, params_low_bounds, params_up_bounds, options);

    ye1 = logsig(params_optim(1) * X(:, 1) + params_optim(2) * X(:, 2));
    R2_1 = 1 - sum((y - ye1') .^ 2) / sum((y - mean(y)) .^ 2);

    subplot(3, 1, 2);
    plot(x, y, '*', 'LineWidth', 3);
    grid on;
    hold on;
    xlabel('x');
    ylabel('y');
    plot(x, ye1, 'k', 'LineWidth', 3);
    title('Regresja logistyczna - Dopasowanie')

    Y = y2';
    X = [x2' ones(size(x2'))];
    x = x2;
    y = y2;

    % jaki drugi zestaw danych ????
    ye1 = logsig(params_optim(1) * X(:, 1) + params_optim(2) * X(:, 2));
    R2_2 = 1 - sum((y - ye1') .^ 2) / sum((y - mean(y)) .^ 2);

    % Plot the fit for the second data set
    subplot(3, 1, 3);
    plot(x, y, '*', 'LineWidth', 3);
    grid on;
    hold on;
    xlabel('x');
    ylabel('y');
    plot(x, ye1, 'k', 'LineWidth', 3);
    title('Regresja logistyczna - Drugi zestaw danych')
end
