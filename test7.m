high = 1;

stand = sqrt(2);

hold on;
box on;
title('牛顿迭代求根号2的近似值');
plot([1, 20], [stand, stand], 'k-');

for i = 1:20

    high = (high + 2 / high) / 2;
    plot(i, high, 'r*');
    plot([i, i], [high, stand], 'b:');

end

set(get(gca, 'XLabel'), 'String', '展开项数 n');
set(get(gca, 'YLabel'), 'String', '连分数逼近值');
