% Block LMS alg IMP
function [xF, wF] = MDF_alg(xF, wF, x, d, mu)
   
    [M, P] = size(xF);
    M = M/2;

    xF = [fft(x) xF(:,(1:end-1))];
    yhat = ifft(sum((wF.*xF).').'); 
    yhat = real(yhat(M+1:end));
    
    E = d - yhat;
    MU = mu*(sum(abs(xF).^2, 2) + 0.001).^(-1);
    EF = fft([zeros(M,1); E]);
    
    wF = wF + diag(MU.*EF)*conj(xF);
    waux = real(ifft(wF)); 
    wF = fft([waux(1:M,:); zeros(M,P)]);
    
    
end