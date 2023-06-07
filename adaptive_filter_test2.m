% adaptive filter test
clear;
Len = 512;
M = 3;

x = randn(Len, 1);
h0 = [2; 1; 0.3];
d = zeros(Len,1);
for n = 1:length(x) - 2
    d(n) = h0.'*x((0:M - 1) + n) + 0.0001*randn;
end


%For FLMS test
eta = 0.001;
BlockSize = 8;
nBlocks = floor(Len/BlockSize);
st = 1;
hest = zeros(BlockSize,1);
x_old = zeros(BlockSize, 1);
y = [];
for b = 1:nBlocks - 1
    xbuf = [x_old;x(st:st + BlockSize - 1)];
    dbuf = d(st:st + BlockSize - 1);
    [yt, et, hest] = FLMS_alg(xbuf, dbuf, hest, eta);
    et
    x_old = x(st:st + BlockSize - 1);
    st = st + BlockSize;
end
ytest = conv(x,hest);
