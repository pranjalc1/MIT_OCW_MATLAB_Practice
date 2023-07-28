% Root Finding using Newton's Method

% Initial Value
x = 1;

values = [];

% Iterating using Newton's Method
for i = 1:1000
    values(end + 1) = x;
    prev = x;
    % x_(n+1) = x_n - f(x_n)/f'(x_n)
    R = 101;
    x = x - (R^2*x^2 - 1) / (2*R^2*x);
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