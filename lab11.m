clear all;
a = -pi/2;
b = pi/2;
k = 1000;
h = (b-a)/(k-1);

x = a:h:b;
y = sin(x);
XN(1) = x(1);
YN(1) = y(1);
m = 15;
for i = 1:m
    W = vander(XN);
    A = inv(W) * YN';
    p = polyval(A, x);
    pogr(i) = max(abs(y-p));
    hx = (b-a)/i;
    for j = 1:i
        XN(j+1) = XN(j) + hx + rand() * 0.001;
    end
    YN = sin(XN);
    plot(x, abs(y-p), 'b')
    pause;
end

plot(log10(pogr), 'r')
rand(10)
pause;