function [zlsq,a]=fitplane_sparse(z)

x = z(:, 1);
y = z(:, 2);
vlist = find((~isnan(z(:, 3)))&(~isinf(z(:, 3))));
npt = length(vlist);

A = ones(npt,3);
A(:,1) = x(vlist);
A(:,2) = y(vlist);
a = A\z(vlist, 3);
zlsq = z(:, 3)-(a(1)*x+a(2)*y+a(3));

