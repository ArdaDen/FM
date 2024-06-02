close all;
clear all;
clc;

%% Low Pass Filter Implementation
%% This code illustrates the low pass filter windowing and its effect in time and frequency domains. For this purpose, two sinusoidal signals with different frequencies are selected.

fc = 1000; % Operating frequency
Fs = 1e5; % Sampling frequency
dt = 1/Fs; % Sampling period
Time = 5e-2; % Time duration
t = 0:dt:Time-dt; % Time scale

sig = sin(2*pi*fc*t) + sin(2*pi*fc*3*t); % Signal with two sinusodial components with different frequencies
sig_fft = fftshift(fft(sig)); % FFT of the signal
freq_scale = linspace(-Fs/2,Fs/2-Fs/length(t),length(t)); % Frequency scale

window = 1*(freq_scale<=fc*1.5 & freq_scale>=-fc*1.5); % The window low pass filter

figure;
plot(freq_scale,window);
xlabel("Frequency(Hz)");
ylabel("Amplitude");
title("Low-pass Filter")

sig_fft_filtered = sig_fft.*window; % Filtering absolute in frequency domain

sig_filtered = ifft(ifftshift(sig_fft_filtered)); % Inverse FFT

% Plots before and after filtering
figure;
tiledlayout(2,2)
ax1 = nexttile;
plot(t,sig);
title("Signal in time domain before filtering")
xlabel("Time(s)")
ylabel("Voltage(V)")
ax2 = nexttile;
plot(freq_scale,abs(sig_fft)/length(t));
title("Signal in frequency domain before filtering")
xlabel("Frequency(Hz)")
ylabel("Amplitude")
ax3 = nexttile;
plot(t,sig_filtered);
title("Signal in time domain after filtering")
xlabel("Time(s)")
ylabel("Voltage(V)")
ax4 = nexttile;
plot(freq_scale,abs(sig_fft_filtered)/length(t));
title("Signal in frequency domain after filtering")
xlabel("Frequency(Hz)")
ylabel("Amplitude")

