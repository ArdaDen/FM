close all;
clear all;
clc;

dec = 40;
filename = "C:\Users\user\Desktop\staj\Recorded sounds\testData-2p5MHz.wav"; % IQ data file
[y,fs] = audioread(filename);
Y = y(:,1) + 1i*y(:,2); % Complex form IQ data

fft_Y = fftshift(fft(Y));
freqz(Y(1:5000),1,[-4e6:0.01e6:4e6],fs); 
decimated_y = decimate(Y,dec,"fir");
filt = firls(30,[0 .9],[0 1],"differentiator"); % Filter
decimated_y = decimated_y./abs(decimated_y);
real_dec = real(decimated_y);
imag_dec = imag(decimated_y);
y_demodulated = (real_dec.*conv(imag_dec,filt,"same")-imag_dec.*conv(real_dec,filt,"same"))./(real_dec.^2+imag_dec.^2);
sound(y_demodulated,fs/dec);



