% Conway Game of Life Project

N = 100;

game = logical(randi([0 1], [N+2 N+2]));
game(1,:) = 0;
game(end,:) = 0;
game(:,1) = 0;
game(:,end) = 0;

% Implementation using fast matrix addition for counting neighbors
for iter = 1:1000
    p = pcolor(game(2:end-1,2:end-1));
    set(p, "EdgeColor", "none");
    colormap gray;
    pause(0.1);
    new_game = zeros(size(game));
    new_game(2:end-1,2:end-1) = game(1:end-2,1:end-2) + ...
        game(1:end-2,2:end-1) + ...
        game(1:end-2,3:end) + ...
        game(2:end-1,1:end-2) + ...
        game(2:end-1,3:end) + ...
        game(3:end,1:end-2) + ...
        game(3:end,2:end-1) + ...
        game(3:end,3:end);
    new_game = ((game == 1) & (new_game == 2 | new_game == 3)) | ...
        ((game == 0) & (new_game == 3));
    if (game == new_game)
        break
    end
    game = new_game;
end