function [outputArg1, outputArg2] = multiple_lin_reg(a, b, c, num_elements, subplot_handle)
    x = 1:num_elements;
    y = a * x + b * randn(1, num_elements);
    y = y + c;

    Y = y';
    X = x';

    X = [ones(size(X)) X];
    A = regress(Y, X);

    Ye = A' * X';

    % Wykres na danym subplocie
    plot(subplot_handle, Ye, 'k', 'LineWidth', 2); grid on; hold on;
    plot(subplot_handle, x, y, 'm*', 'LineWidth', 2);
    xlabel(subplot_handle, 'x');
    ylabel(subplot_handle, 'y');
    legend(subplot_handle, 'Ye (Predicted)', 'y (Original)');
    title(subplot_handle, 'Multiple Linear Regression');

    outputArg1 = A;  % Współczynniki modelu regresji
    outputArg2 = Ye; % Przewidywane wartości
end
