% test inner product and conv

x = [1;2;3];
h = [4;5];

y = conv(x,h);

% p1 = x(2:-1:1).'*h
% p2 = x(2:3).'*h;

p1 = x(1:2)'*h
p2 = x(2:3)'*h
p3 = [x(3);0]'*h

c = conv(x(3:-1:1),h)
