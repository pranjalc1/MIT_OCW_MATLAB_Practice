% Collatz Conjecture Exploration

current = 1:100000;
maxes = zeros(size(current));
lengths = zeros(size(current));

final = ones(size(current));

while sum(current ~= final) > 0
    lengths(current ~= final) = lengths(current ~= final) + 1;
    even = (mod(current, 2) == 0) & (current ~= final);
    odd = (mod(current, 2) == 1) & (current ~= final);
    current(even) = current(even) / 2;
    current(odd) = 3*current(odd) + 1;
    maxes(current > maxes) = current(current > maxes);
end

sum(current) % check to see if all 1
[M, I] = max(lengths)
maxes(I)

tiledlayout(2,1)
nexttile
plot(1:100000, lengths, '.')
nexttile
plot(1:100000, maxes, '.')