% Adding very large numbers using vectors

N1=[1 9 5 4 3 8 4 8 5 6 0 3 4 0 5 3 2 4 5 6 ]; % to mean  19543848560340532456
N2=[2 3 4 3 2 3 4 5 4 8 6 4 7 8 9 7 6 5 3 2 1 4 6 7 9 ]; 

Ns = [];
carryover = 0;
stop1 = false;
stop2 = false;

for j = 1:max([size(N1) size(N2)])
    if size(N1) - j + 1 < 1
        stop1 = true;
    end
    if size(N2) - j + 1 < 1
        stop2 = true;
    end
    
    sum_digits = carryover;
    if ~stop1
        sum_digits = sum_digits + N1(end - j + 1);
    end
    if ~stop2
        sum_digits = sum_digits + N2(end - j + 1);
    end

    if sum_digits >= 10
        sum_digits = sum_digits - 10;
        carryover = 1;
    else
        carryover = 0;
    end

    Ns = [sum_digits Ns];
end

if Ns(1) == 0
    Ns = Ns(2:end);
end

Ns = string(Ns);

NS = "";
for i = 1:length(Ns)
    NS = NS + Ns(i);
end

NS

% Estimating pi using infinite sum of 1/n^2
format long

piValue = 0;
j = 1;

while pi - piValue > 10^(-6)
    series_sum = sum(1./((1:j).^2));
    piValue = sqrt(series_sum*6);
    j = j + 1;
end

piValue
j