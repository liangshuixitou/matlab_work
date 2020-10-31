high = 1;

stand = (sqrt(5) - 1) / 2;

hold on;
box on;
title('黄金分割率的简单连分数渐进');
plot([1, 20], [stand, stand], 'k-');

for i = 1:20
    plot(i, high, 'r*');
    plot([i, i], [high, stand], 'b:');
    high = 1 / (1 + high);
end

set(get(gca, 'XLabel'), 'String', '展开项数 n');
set(get(gca, 'YLabel'), 'String', '连分数逼近值');
