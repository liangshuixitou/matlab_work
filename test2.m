high = 1;
y = [];

stand = (sqrt(5) - 1) / 2;

hold on;
box on;
title('�ƽ�ָ��ʵļ��������ƽ����ȷ���');
ylim([0, 0.5]);

for i = 1:20
    plot(i, log10(abs(high - stand)), 'r*');

    if (mod(i, 4) == 0)
        plot([0, i], [log10(abs(high - stand)), log10(abs(high - stand))], 'g:', 'linewidth', 2);
    end

    y = [y, log10(abs(high - stand))];
    high = 1 / (1 + high);
end

x = [1:1:20];

X = [ones(length(y), 1), x']; %x'��ʾ������ת��Ϊ������
Y = y';
[b, bint, r, rint, stats] = regress(Y, X);
z = b(1) + b(2) * x;
plot(x, z, 'b-');

set(get(gca, 'XLabel'), 'String', 'չ������ n');
set(get(gca, 'YLabel'), 'String', 'log10(�������ƽ���ֵ)');
