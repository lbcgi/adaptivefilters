% Block LMS alg IMP
function [y, e, W] = BLMS_alg(x, d, W, eta)
    bs = length(x);
    hs = length(W);
    X = zeros(bs - hs + 1, hs);
   
    for i = 1:bs - hs + 1
        X(i,:) = x((0:hs - 1) + i);
    end
    
    y = X(:,end:-1:1)*W;
%     y1 = xcorr(x,W);
%     y1 = y1(1:bs - hs + 1);
%     X = fft(X);
    
%     tmp = real(ifft(X.*W));
    
    e = d(1:bs - hs + 1) - y;
    W = W + eta*X(:,end:-1:1).'*e;

end