function sequence = fibonacci(n)
%FIBONACCI Fibonacci sequence
%   FIBONACCI(N) generates fibonacci sequence from F_1 to F_N
if (n <= 0)
    sequence = []
    return
end
if (n == 1)
    sequence = [1];
    return
elseif (n == 2)
    sequence = [1 1];
    return
end
prevsequence = fibonacci(n-1);
sequence = [prevsequence prevsequence(n-1) + prevsequence(n-2)];
end

