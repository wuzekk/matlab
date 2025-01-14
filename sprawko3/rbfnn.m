clear; close all; clc;

x1 = rand(300, 2)*10;
x2 = x1 +100;
X = [x1; x2]';
y = [ones(1, size(x1, 1))*0.2 ones(1, size(x1, 1))*0.7];

figure
subplot(1, 2, 1)
plot(X(1,:), X(2,:), '*'); grid; hold;
xlabel('x_1'); ylabel('x_2'); title('Input data');

subplot(1, 2, 2)
plot(y, 'ok'); grid; hold;
xlabel('Number of sample'); ylabel('Label'); title('Output data');


MN_values = [10, 100, 200];
SPREAD_values = [0.5, 0.7, 1.0];
DF = 5;
GOAL = 0;

%% newrb
figure
sgtitle('Porównanie klasteryzacji dla parametrów wejściowych newrb')
idx=1;
for MN=MN_values
    for SPREAD=SPREAD_values
        siecrb = newrb(X, y, GOAL, SPREAD, MN, DF);

        Xt = X + (randn(size(X))*0.05);
        ynn = siecrb(Xt);

        h = findobj('type','figure','name','NEWRB');
        if ~isempty(h)
            close(h);
        end

        if MN==10
            color = 'g*';
        elseif MN==100
            color = 'y*';
        elseif MN==200
            color = 'm*';
        end

        subplot(3, 3, idx)
        plot(y, 'ok'); grid; hold;
        plot(ynn, color);
        legend('y', 'y_{nn}', Location='best');
        title(['MN=' num2str(MN) ', SPREAD=' num2str(SPREAD)]);
        idx = idx+1;
    end
end

%% newrbe

figure
sgtitle('Porównanie klasteryzacji dla parametrów wejściowych newrbe')
idx=1;

    for SPREAD=SPREAD_values
        siecrbe = newrbe(X, y, SPREAD);

        Xt = X + (randn(size(X))*0.05);
        ynn = siecrbe(Xt);

        h = findobj('type','figure','name','NEWRB');
        if ~isempty(h)
            close(h);
        end

        if SPREAD==0.5
            color = 'c*';
        elseif SPREAD==0.7
            color = 'b*';
        elseif SPREAD==1.0
            color = 'r*';
        end

        subplot(1, 3, idx)
        plot(y, 'ok'); grid; hold;
        plot(ynn, color);
        legend('y', 'y_{nn}', Location='best');
        title(['SPREAD=' num2str(SPREAD)]);
        idx = idx+1;
    end













