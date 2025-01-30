%% autoencoder
clear; clc; close all;

x = -10:0.05:10;
y = sin(x);

hidenSize = 35;

autoenc = trainAutoencoder(y, hidenSize,...
                           'EncoderTransferFunction', 'logsig',...
                           'DecoderTransferFunction', 'purelin',...
                           'MaxEpochs', 200);

a = 0.3;
yt = y + (a * randn(size(y)));
ye = predict(autoenc, yt);

figure
plot(ye, 'r'); grid; hold;
plot(yt, 'b');
legend('autoencoder', 'data')

%% analiza hiddensize
clear; clc; 

x = -10:0.05:10;
y = sin(x);

a = 0.3;
yt = y + (a * randn(size(y)));

hiddenSizes = [5 25 50];

figure
sgtitle('Analiza parametru hiddenSize')
idx = 1;
for hiddenSize=hiddenSizes
    autoenc = trainAutoencoder(y, hiddenSize,...
                           'EncoderTransferFunction', 'logsig',...
                           'DecoderTransferFunction', 'purelin',...
                           'MaxEpochs', 100);
    ye = predict(autoenc, yt);
    
    subplot(3, 1, idx)
    plot(ye, 'r'); grid; hold;
    plot(yt, 'b');
    legend('autoencoder', 'data')
    title(['HidenSize = ', num2str(hiddenSize)])
    idx = idx + 1;
end

%% analiza maxEpochs
clear; clc; 

x = -10:0.05:10;
y = sin(x);

a = 0.3;
yt = y + (a * randn(size(y)));

hiddenSize = 35;
maxEpochs = [10 50 100];

figure
sgtitle('Analiza parametru maxEpochs')
idx = 1;
for maxEpoch=maxEpochs
    autoenc = trainAutoencoder(y, hiddenSize,...
                           'EncoderTransferFunction', 'logsig',...
                           'DecoderTransferFunction', 'purelin',...
                           'MaxEpochs', maxEpoch);
    ye = predict(autoenc, yt);
    
    subplot(3, 1, idx)
    plot(ye, 'r'); grid; hold;
    plot(yt, 'b');
    legend('autoencoder', 'data')
    title(['maxEpochs = ', num2str(maxEpoch)])
    idx = idx + 1;
end

%% analiza funkcji aktywacji
clear; clc; 

x = -10:0.05:10;
y = sin(x);

a = 0.3;
yt = y + (a * randn(size(y)));

hiddenSize = 35;
maxEpoch = 100;
encoderFuncs = {'logsig' 'satlin'};
decoderFuncs = {'logsig' 'satlin' 'purelin'};

figure
sgtitle('Analiza funkcji aktywacji')
idx = 1;
for j=1:3
    for i=1:2
   
    autoenc = trainAutoencoder(y, hiddenSize,...
        'EncoderTransferFunction', encoderFuncs{i},...
        'DecoderTransferFunction', decoderFuncs{j},...
                           'MaxEpochs', maxEpoch);
    ye = predict(autoenc, yt);
    
    subplot(2, 3, idx)
    plot(ye, 'r'); grid; hold;
    plot(yt, 'b');
    legend('autoencoder', 'data', 'Location','southeast')
    title(['Funkcja encodera: ', encoderFuncs{i}, ', Funkcja decodera: ', decoderFuncs{j}])
    idx = idx + 1;
    end
end