low = 1;
high = 2;

stand = sqrt(2);

hold on;
box on;
title('二分搜素求根号2的近似值');
plot([1, 20], [stand, stand], 'k-');

for i = 1:20
    mid = (low + high) / 2;
    plot(i, mid, 'r*');
    plot([i, i], [mid, stand], 'b:');

    if (mid < sqrt(2))
        low = mid;
    else
        high = mid;
    end

end

set(get(gca, 'XLabel'), 'String', '迭代次数 n');
set(get(gca, 'YLabel'), 'String', '二分搜索逼近值');
