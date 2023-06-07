% Block LMS alg IMP
function [y, e, Hest] = FLMS_alg2(x, d, Hest, eta)
    
    N = round(length(x)/2);
    X = fft(x);    
    O1 = real(ifft(X.*Hest));
   
    y = O1(N + 1:end);
    e = d - y;
    E = fft([zeros(N,1);e]);

    %% debug
    O2 = real(ifft(conj(X).*E));
    deltaH = [O2(1:N);zeros(N,1)];
    Hest = Hest + eta*fft(deltaH);
    %%
%      Hest = Hest + eta*E.*conj(X);
%      hest = real(ifft(Hest)); 
%      Hest = fft([hest(1:N,:); zeros(N,1)]);
    
    
end