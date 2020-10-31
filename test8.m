result = 1;
x = 1;

stand = sqrt(2);

hold on;
box on;
title('泰勒展开求根号2的近似值');
plot([1, 20], [stand, stand], 'k-');

t = 1;

for i = 1:20

    plot(i, result, 'r*');
    plot([i, i], [result, stand], 'b:');
    t = t * (1/2 - i + 1) / i;
    result = result + x^i * t;

end

set(get(gca, 'XLabel'), 'String', '展开项数 n');
set(get(gca, 'YLabel'), 'String', '连分数逼近值');
