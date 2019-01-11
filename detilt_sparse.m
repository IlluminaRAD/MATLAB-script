function [zlsq,a]=detilt_sparse(z)

zlsq = z;
x=z(:, 1);
y=z(:, 2);
vlist=find((~isnan(z(:, 3)))&(~isinf(z(:, 3))));

A=ones(length(vlist),3);
A(:,1)=x(vlist);
A(:,2)=y(vlist);
a=A\z(vlist, 3);
zlsq(:, 3)=z(:, 3)-(a(1)*x+a(2)*y+a(3));

