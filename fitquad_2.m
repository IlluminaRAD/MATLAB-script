function [zlsq,a]=fitquad(z, order)

[ny,nx]=size(z);
[x,y]=meshgrid(1:nx,1:ny);
vlist=find((~isnan(z))&(~isinf(z)));
npt=length(vlist);

switch order
    case 1
        A=ones(npt,3);
        A(:,1)=x(vlist);
        A(:,2)=y(vlist);
        a=A\z(vlist);
        zlsq=z-(a(1)*x+a(2)*y+a(3));
    case 2
        A=ones(npt,6);
        A(:,1)=x(vlist);
        A(:,2)=y(vlist);
        A(:,3)=x(vlist).^2;
        A(:,4)=y(vlist).^2;
        A(:,5)=x(vlist).*y(vlist);
        a=A\z(vlist);
        zlsq=z-(a(1)*x+a(2)*y+a(3)*x.^2+a(4)*y.^2+a(5).*x.*y+a(6));
end

