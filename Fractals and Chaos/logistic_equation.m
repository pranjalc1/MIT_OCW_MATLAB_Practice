% Logistic Equation Project
clf
hold on

xlim([0 4]);
ylim([0 1]);

N = 10000;

x = zeros(1, N) + 0.5;
r = linspace(0.001, 3.999, N);

lgs = @(x, r) r.*x.*(1-x);

for i = 1:1000
    x = lgs(x, r);
end

plot(r, x, '.b', 'MarkerSize', 1);

for i = 1:1000
    x = lgs(x, r);
    plot(r, x, '.b', 'MarkerSize', 1);
end