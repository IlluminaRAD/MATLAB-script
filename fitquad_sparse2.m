function [zlsq,a] = fitquad_sparse2(z)

x = z(:, 1);
y = z(:, 2);
vlist = find((~isnan(z(:, 3)))&(~isinf(z(:, 3))));
npt = length(vlist);

A = [x(vlist) y(vlist) x(vlist).^2 y(vlist).^2 x(vlist).*y(vlist) ones(length(vlist), 1)];
a = A\z(vlist, 3);
zlsq = z(:, 3)-(a(1)*x+a(2)*y+a(3)*x.^2+a(4)*y.^2+a(5).*x.*y+a(6));

