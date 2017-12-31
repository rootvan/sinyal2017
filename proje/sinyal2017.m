%% Gürültülü Sinyal Grafiði
figure(1)
plot(t,ecg_signals_noise(1,:))
title('Gurultulu Sinyal');

%% Gürültülü Sinyalin Spektrum Grafiði
n1 = length(ecg_signals_noise(1,:));
xfft = fft(ecg_signals_noise(1,:));
f = (0:length(xfft)-1)*fs/n1;
figure(6)
plot(t,abs(xfft))
title('Gurultulu Sinyalin Spectrumu');

% Sinyali Shiftlemek
xfftshift = fftshift(xfft);
fshift = (-n1/2:n1/2-1)*fs/n1;
figure(11)
plot(fshift,abs(xfftshift));
title('Gurultulu Sinyalin Genlik Spectrumu');

%% Sinyalerin Filtreden Gecmek
yfiltre1 = filtfilt(num,den,ecg_signals_noise(1,:));
figure(16)
plot(t,ecg_signals_noise(1,:))
hold on
plot(t,yfiltre1)
title('1. Sinyalin Filtrelenmis Hali');

%% Filtrelenmis Spectrumlarini Cizdirmek
figure(21)
xx1=fft(yfiltre1);
plot(t,abs(xx1));
xxshift1=fftshift(xx1);
plot(fshift,abs(xxshift1));

% Sinyal ve Filtrenin Spectrumlari
plot(fshift,abs(xfftshift));
hold on
plot(fshift,abs(xxshift1))

%%
figure
[Rpeak,rzaman] = findpeaks(yfiltre1,t,'MinPeakHeight',2.3,'MinPeakDistance',0.5);
plot(t,yfiltre1)
hold on
plot(rzaman,Rpeak, 'rv','MarkerFaceColor','b')

%%R zaman Farký
rzamanfark = diff(rzaman);

%%Ortalama R aralýðý
ort_R_araligi = mean(rzamanfark);






