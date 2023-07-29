% Basins of Attraction for Complex Numbers using Vectorization
clf
hold on

% Using function x^6 - 1
r = zeros(1,6);
for j = 1:6
    r(j) = cos(pi/3*j) + sin(pi/3*j)*1i;
end

colors = [1 0 0; 0 1 0; 0 0 1; 0 1 1; 1 0 1; 1 1 0; 0 0 0];

N = 1000;
[x, y] = meshgrid(linspace(-2,2,N), linspace(-2,2,N)');
X = x + 1i*y;

f = @(s) s.^6 - 1;
df = @(s) 6*(s.^5);

prev = ones(N,N);
for j = 1:100
    X = X - f(X)./df(X);
end

c = zeros(N,N);
c(:,:) = 7;

for j = 1:6
    % plot(x(abs(X - r(j)) < 1e-8),y(abs(X - r(j)) < 1e-8),".","color",colors(j))
    c(abs(X - r(j)) < 1e-8) = j;
end

h = pcolor(x, y, c);
colormap(colors);
set(h, 'EdgeColor', 'none');