% Basins of Attraction Project
clf
hold on

r1 = [-1;-1];
r2 = [0;0];
r3 = [1;1];

for x = -2:0.02:2
    for y = -2:0.02:2
        X = [x;y];
        for j = 1:100
            prev = X;
            X = X - ([3*X(1)^2 -1; -1 3*X(2)^2])^(-1)*...
                [X(1)^3-X(2) X(2)^3 - X(1)]';
            if X == prev
                break
            end
        end

        if norm(X-r1)<1e-8
             c='r';
        elseif norm(X-r2)<1e-8
             c='b';
        elseif norm(X-r3)<1e-8
             c='g';
        else
             c='k';
        end

        plot(x,y,'.','color',c);
    end
end

% Experimenting with plotting and labeling
% plot(X(1), X(2), 'k.')
% text(X(1), X(2), strcat('Iter ',string(j)))