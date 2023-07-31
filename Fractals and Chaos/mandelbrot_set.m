% Mandelbrot Set Exploration 

N = 2000;
x = linspace(-1.5, 1.5, N);
y = x;
[X, Y] = meshgrid(x, y);
Z = X + Y*j;
Iter = zeros(size(Z));

S = zeros(size(Z));

limit = 100;
k = 100;
for i = 1:k
    S = S.^2 + Z;
    Iter(~Iter & abs(S) > limit) = i;
end

p = pcolor(X, Y, Iter)
set(p, 'edgecolor', 'none')
axis equal