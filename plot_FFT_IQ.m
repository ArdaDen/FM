function plot_FFT_IQ(x,n0,nf,fs,f0)
x_segment = x(n0:(n0+nf-1));
p = fftshift(fft(x_segment));
z = 20*log10(abs(p)/max(abs(p)));
low_freq = (f0-fs/2);
high_freq = (f0+fs/2);
N = length(z);
freq = [0:1:N-1]*fs/N + low_freq;
figure;
plot(freq,z);
axis tight
xlabel("Frequency [MHz]","FontSize",14);
ylabel("Relative amplitude [dB down from max]","FontSize",14);
grid on;
set(gcf,"Color","white");
end