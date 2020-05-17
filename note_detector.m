[x,Fs]=audioread("C:\Users\milja\source\repos\DOSR\DOSR\data\audio0.wav");
t=0:1/Fs:(length(x)-1)/Fs;
plot(t,x);
a = Fs;
Fs1 = 4.4;
[P,Q] = rat(Fs1/Fs);
xnew = resample(x,P,Q);
tnew=0:1/Fs1:(length(xnew)-1)/Fs1;
plot(tnew,xnew);
tsampled = tnew;
xsampled = xnew;

subplot(2,1,1)
plot(t,x)
title('Audio at 44100Hz')
subplot(2,1,2)
plot(tsampled,xsampled)
title('Audio at 4.4Hz')

%plot(psd(periodogram,x,'Fs',Fs,'NFFT',length(x)));

%% exp
clear, clc, close all;
[y,fs] = audioread("C:\Users\milja\source\repos\DOSR\DOSR\data\audio0.wav");
N = length(y);              
Y = fft(y,N);
F = ((0:1/N:1-1/N)*fs);
w = 2*pi*F; 
magnitudeY = abs(Y);        
phaseY = unwrap(angle(Y));
figure (1);
plot(F(1:1500), magnitudeY(1:1500));
grid on;
xlabel('Frequency[Hz]');
ylabel('Magnitude[dB]');
title('Magnitude spectrum of sound wave in frequency');
notes = ["C3" "C#" "D3" "D#" "E3" "F3" "F#" "G3" "G#" "A3" "A#" "B3" "C4" "C#" "D4" "D#" "E4" "F4" "F#" "G4" "G#" "A4" "A#" "B4"];
freqs = [131 139 147 156 165 175 185 196 208 220 233 247 262 277 294 311 330 349 370 392 415 440 466 494];
for i = 1:24
    disp(notes(i)+"  "+magnitudeY(freqs(i)))
end
disp("displaced: "+magnitudeY(393))
disp("displaced: "+magnitudeY(394))

%figure (2);
%plot (F, phaseY);
%grid on;
%set(gca, 'FontName', 'Times New Roman', 'FontSize', 14);
%xlabel('Frequency, Hz');
%ylabel('Phase angle, radian');
%title('Phase spectrum of sound wave in frequency');
