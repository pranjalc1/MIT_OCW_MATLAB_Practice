% Root Finding using Secant Method

% Initial Value
x = 2;
prev = 0.5;

values = [];

% Iterating using Secant Method
for i = 1:100
    values(end + 1) = x;
    % x_(n+1) = x_n - f(x_n)*(x_n - x_(n-1))/(f(x_n) - f(x_(n-1)))
    new_x = x - (tanh(x) - x/3) * (x - prev)/(tanh(x) ...
        - tanh(prev) - x/3 + prev/3);
    prev = x;
    x = new_x;
    if x == prev
        break
    end
end

plot(log(abs(values(1:end-2)-values(end))),...
    log(abs(values(2:end-1)-values(end))),'.')

hold on

mdl = fitlm(log(abs(values(1:end-2)-values(end))),...
    log(abs(values(2:end-1)-values(end))));

plot(-100:100, mdl.Coefficients{"x1", "Estimate"} * (-100:100))

hold off