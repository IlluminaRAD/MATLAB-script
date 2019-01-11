function [zlsq,a]=fitquad_sparse(z)

x = z(:, 1);
y = z(:, 2);
vlist = find((~isnan(z(:, 3)))&(~isinf(z(:, 3))));
npt = length(vlist);

A = ones(npt,6);
A(:,1) = x(vlist);
A(:,2) = y(vlist);
A(:,3) = x(vlist).^2;
A(:,4) = y(vlist).^2;
A(:,5) = x(vlist).*y(vlist);
a = A\z(vlist, 3);
zlsq = z(:, 3)-(a(1)*x+a(2)*y+a(3)*x.^2+a(4)*y.^2+a(5).*x.*y+a(6));

