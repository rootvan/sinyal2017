%%Gürültülü Sinyal Grafiði
figure
plot(t, ecg_noise)
title("Gurultulu Sinyal");

%%Genlik Spektrumu Grafiði
figure
ts = (1 / fs ) ;
x = ecg_noise;
y = fft(x);
n = length(x);          % number of samples
f = (0:n-1)*(fs/n);
power = abs(y).^2/n;    % power of the DFT
y0 = fftshift(y);         % shift y values
f0 = (-n/2:n/2-1)*(fs/n); % 0-centered frequency range
power0 = abs(y0);    % 0-centered power
plot(f0,power0)
title("Genlik Spektrumu");






