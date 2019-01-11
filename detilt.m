function [zlsq,a]=detilt(z)

[ny,nx]=size(z);
[x,y]=meshgrid(1:nx,1:ny);
vlist=find((~isnan(z))&(~isinf(z)));
npt=length(vlist);

A=ones(npt,3);
A(:,1)=x(vlist);
A(:,2)=y(vlist);
a=A\z(vlist);
zlsq=z-(a(1)*x+a(2)*y+a(3));