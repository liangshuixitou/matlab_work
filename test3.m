high1 = 1;
high2 = 1;
y1 = [];
y2 = [];

stand1 = (sqrt(5) - 1) / 2;
stand2 = sqrt(2);

hold on;
box on;
title('简单连分数逼近精度分析');
ylim([0, 0.5]);

for i = 1:20
    y1 = [y1, log10(abs(high1 - stand1) / stand1)];
    high1 = 1 / (1 + high1);

    y2 = [y2, log10(abs(high2 - stand2) / stand2)];
    high2 = 1 / (1 + high2) + 1;
end

x = [1:1:20];

plot(x, y1, 'r*');
plot(x, y2, 'bx');

X = [ones(length(y1), 1), x']; %x'表示行向量转置为列向量
Y1 = y1';
[b1, bint1, r1, rint1, stats1] = regress(Y1, X);
z1 = b1(1) + b1(2) * x;
plot(x, z1, 'b-');

X = [ones(length(y2), 1), x']; %x'表示行向量转置为列向量
Y2 = y2';
[b2, bint2, r2, rint2, stats2] = regress(Y2, X);
z2 = b2(1) + b2(2) * x;
plot(x, z2, 'c-');

legend('黄金分割', '根号2', '拟合直线1', '拟合直线2', 'Location', 'northeast');

set(get(gca, 'XLabel'), 'String', '展开项数 n');
set(get(gca, 'YLabel'), 'String', 'log10(连分数逼近差值)');
