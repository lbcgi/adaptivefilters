% LMS alg of adaptive filters
function [y, e, W] = LMS_alg(X, d, W, ~, eta)

    y = W'*X;
    e = d - y;
    W = W + eta*X*e;
    
end
