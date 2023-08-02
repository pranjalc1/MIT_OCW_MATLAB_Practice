% Warmup for Conway Game of Life

function w = warmup(A,x,y)
    diag_sum(A)
    [ul, lr] = submatrix(A)
    odd_submatrix(A)
    [a, b] = flipped(A)
    anti_diag_sum(A)
    unusual_add(x)
    [p1, p2, invp] = permutation(x,y)
    checkerboard(8)
    [d, sd] = diag_manual(A)
end

function s = diag_sum(A)
   s = sum(diag(A));
end

function [ul, lr] = submatrix(A)
    ul = A(1:2,1:2);
    lr = A(end-1:end,end-1:end);
end

function odd = odd_submatrix(A)
    odd = A(1:2:end,1:2:end);
end

function [flippedh, flippedv] = flipped(A)
    flippedh = A(:,end:-1:1);
    flippedv = A(end:-1:1,:);
end

function s = anti_diag_sum(A)
    [~,flip] = flipped(A);
    s = sum(diag(flip));
end

function v = unusual_add(vec)
    v = vec;
    v(2:2:end) = v(1:2:end) + 3;
end

function [p1, p2, invp] = permutation(x, p)
    p1 = x(p);
    p2 = cat(2,2:length(x),1);
    invpmat = zeros(length(x));
    invpmat(length(x)*[0:length(x)-1] + p) = 1;
    invp = (invpmat * (1:4)')';
end

function mat = checkerboard(n)
    mat = zeros(n);
    mat(2:2:end,:) = 1;
    mat(:,2:2:end) = 1 - mat(:,2:2:end);
end

function [d, sd] = diag_manual(A)
    d = sum(A(1:length(A) + 1:end));
    sd = sum(A(length(A):length(A)-1:end-1));
end