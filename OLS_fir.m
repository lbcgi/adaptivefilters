% OLS
function y = OLS_fir(x, h)
    N = floor(length(x));
    y = real(ifft(fft(x, N).*fft(h, N)));
%     y = y(N:end);
%     y = conv(x,h);