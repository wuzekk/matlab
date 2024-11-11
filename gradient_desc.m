function A = gradient_desc(a, b, c, num_elements, num_iteration, alfa)
    x = 1:1:num_elements;
    y = a * x + b * randn(1, num_elements);
    y = y + c;
    %transponowanie wektorow Y i X
    Y = y';
    X = x';

    X = [ones(size(X)) X];

    A = randn(2, 1);
    A_copy = A;
    
    %wykres dla stalej wartości alfa
    figure(1);
    grid on;
    hold on;
    xlabel('x');
    ylabel('alfa values');
    title('const alfa values graph');

    %wykres dla wartości błędu
    figure(2);
    grid on;
    hold on;
    xlabel('x');
    ylabel('mean squared error values');
    title('Mean squared error graph for const alfa');

    %glowny kod regresji metodą gradientową

    for i=1:1:num_iteration

       figure(1);plot(i,alfa,'or');

       for n_data = 1:length(X)
           ye = X(n_data,:) * A;
           e = (Y(n_data,:)-ye);
           D_A = alfa * e * X(n_data,:)';
           A = A + D_A;
       end
       
       ye=X*A;
       element = mse(Y,ye);

       figure(2);
       plot(i,element,'*m')
    end

    figure(3);
    plot(x, y, 'bo'); 
    hold on;
    plot(x, X * A, 'r-'); 
    xlabel('x');
    ylabel('y');
    title('Original Data and Regression Line for const alfa');
    legend('Original Data', 'Regression Line');
    grid on;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ze zmienną wersja alfa    
    A = A_copy;
    %wykres dla stalej wartości alfa
    figure(4);
    grid on;
    hold on;
    xlabel('x');
    ylabel('alfa values');
    title('var alfa values graph');

    %wykres dla wartości błędu
    figure(5);
    grid on;
    hold on;
    xlabel('x');
    ylabel('mean squared error values');
    title('Mean squared error graph for variable alfa');

    %glowny kod regresji metodą gradientową

    for i=1:1:num_iteration

        alfa = length(X) / (1.0 + (i * length(X))) * 0.001;

        figure(4);plot(i,alfa,'or');

        for n_data = 1:length(X)
            ye = X(n_data,:) * A;
            e = (Y(n_data,:)-ye);
            D_A = alfa * e * X(n_data,:)';
            A = A + D_A;
        end

        ye=X*A;
        element = mse(Y,ye);

        figure(5);
        plot(i,element,'*m')
    end

    figure(6);
    plot(x, y, 'bo'); 
    hold on;
    plot(x, X * A, 'r-'); 
    xlabel('x');
    ylabel('y');
    title('Original Data and Regression Line for variable alfa');
    legend('Original Data', 'Regression Line');
    grid on;
end

