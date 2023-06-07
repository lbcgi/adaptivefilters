% Block LMS alg IMP
function [y, e, hest] = FLMS_alg(x, d, hest, eta)
    
    N = round(length(x)/2);
   
    X = fft(x);
    
    H = fft([hest;zeros(N,1)]);
    
    O1 = real(ifft(X.*H));
    y = O1(N + 1:end);
    e = d - y;
    E = fft([zeros(N,1);e]);

    %% debug
    Htemp = real(ifft(conj(X).*E));
    deltaH = [Htemp(1:N);zeros(N,1)];
    H = H + eta*fft(deltaH);
    hest = real(ifft(H));
    hest = hest(1:N);
    %%
end