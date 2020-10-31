number1 = 1;
low1 = 0;
high1 = 2;
number3 = 1;
number4 = 1;
x = 1;

% 简单连分数
y1 = [];
% 二分搜索
y2 = [];
% 牛顿迭代
y3 = [];
% 泰勒级数
y4 = [];

stand = sqrt(2);

hold on;
box on;
title('多种逼近方法逼近精度对比分析');
ylim([0, 0.5]);

t = 1;

for i = 1:20
    y1 = [y1, log10(abs(number1 - stand))];
    number1 = 1 / (1 + number1) + 1;

    mid = (low1 + high1) / 2;
    y2 = [y2, log10(abs(mid - stand))];

    if (mid < sqrt(2))
        low1 = mid;
    else
        high1 = mid;
    end

    y3 = [y3, log10(abs(number3 - stand))];
    number3 = (number3 + 2 / number3) / 2;

    y4 = [y4, log10(abs(number4 - stand))];
    t = t * (1/2 - i + 1) / i;
    number4 = number4 + x^i * t;
end

x = [1:1:20];

x2 = x(:, [1, 2, 3, 4, 5, 6]);
y33 = y3(:, [1, 2, 3, 4, 5, 6]);

plot(x, y1, 'r*');
plot(x, y2, 'b*');
plot(x2, y33, 'm*');
plot(x, y4, 'c*');

X1 = [ones(length(y1), 1), x']; %x'表示行向量转置为列向量
Y1 = y1';
[b1, bint1, r1, rint1, stats1] = regress(Y1, X1);
z1 = b1(1) + b1(2) * x;
plot(x, z1, 'b-');

X2 = [ones(length(y2), 1), x']; %x'表示行向量转置为列向量
Y2 = y2';
[b2, bint2, r2, rint2, stats2] = regress(Y2, X2);
z2 = b2(1) + b2(2) * x;
plot(x, z2, 'b-');

X3 = [ones(length(y33), 1), x2']; %x'表示行向量转置为列向量
Y3 = y33';
[b3, bint3, r3, rint3, stats3] = regress(Y3, X3);
z3 = b3(1) + b3(2) * x2;
plot(x2, z3, 'b-');

X4 = [ones(length(y4), 1), x']; %x'表示行向量转置为列向量
Y4 = y4';
[b4, bint4, r4, rint4, stats4] = regress(Y4, X4);
z4 = b4(1) + b4(2) * x;
plot(x, z4, 'b-');

legend('简单连分数', '二分搜索', '牛顿迭代', '泰勒级数', '拟合直线', 'Location', 'northeast');

set(get(gca, 'XLabel'), 'String', '展开项数 n');
set(get(gca, 'YLabel'), 'String', 'log10(相对逼近差值)');
