function polynomial_regression(variables, num_elements, degree)
    a = variables(1);
    b = variables(2);
    c = variables(3);
    d = variables(4);
    
    x = 1:num_elements;
    y = a * x + b * ((x + rand(1, num_elements)).^d) + c;

    Y = y';
    X = x';
    X_poly = [ones(size(X)), X, X.^2];

    B = X_poly \ Y;
    ye = X_poly * B;

    figure(1)
    plot(x, y, '*', 'LineWidth', 3); grid on; hold on;
    plot(x, ye, 'k', 'LineWidth', 3);
    xlabel('x'); ylabel('y');
    title('Polynomial Regression');

    R2 = 1 - sum((y - ye').^2) / sum((y - mean(y)).^2);
    fprintf('R^2 for polynomial regression of degree %d: %.4f\n', degree, R2);

    y_sin = sin(x);
    w1 = polyfit(x, y_sin, 1);
    xt = -10:0.5:10;
    yt1 = polyval(w1, xt);
    
    figure(2)
    plot(xt, yt1, 'k', 'LineWidth', 3); grid on; hold on;
    plot(x, y_sin, '*', 'LineWidth', 3);
    xlabel('x'); ylabel('y');
    title('Polynomial Fit (degree - 1)');
    legend('polynomial values', 'new data');

    w2 = polyfit(x, y_sin, 2);
    yt2 = polyval(w2, xt);
    
    figure(3)
    plot(xt, yt2, 'k', 'LineWidth', 3); grid on; hold on;
    plot(x, y_sin, '*', 'LineWidth', 3);
    xlabel('x'); ylabel('y');
    title('Polynomial Fit (degree - 2)');
    legend('polynomial values', 'new data');

    [w, D] = polyfit(x, y, 1);
    [ye_bound, D1] = polyval(w, x, D);
    
    figure(4)
    plot(x, y, '*k', 'LineWidth', 3); grid on; hold on;
    plot(x, ye_bound, 'r', 'LineWidth', 3);
    plot(x, ye_bound - D1, 'g', 'LineWidth', 3);
    plot(x, ye_bound + D1, 'g', 'LineWidth', 3);
    xlabel('x'); ylabel('y');
    title('Regression with Bounds (Basic X)');
    legend('values', 'regression', 'bounds');

    X_ext = [X ones(size(X))];
    ye_ext = X_ext * w';
    
    figure(5)
    plot(x, y, '*k', 'LineWidth', 3); grid on; hold on;
    plot(x, ye_ext, 'r', 'LineWidth', 3);
    plot(x, ye_ext - D1, 'g', 'LineWidth', 3);
    plot(x, ye_ext + D1, 'g', 'LineWidth', 3);
    xlabel('x'); ylabel('y');
    title('Regression with Bounds (Extended X)');
    legend('values', 'regression', 'bounds');
end
