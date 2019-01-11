function [zlsq,a]=fitquad3(z, order)

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
    case 3
        A=ones(npt,10);
        A(:,1)=x(vlist);
        A(:,2)=y(vlist);
%         A(:,3)=x(vlist).^2;
%         A(:,4)=y(vlist).^2;
%         A(:,5)=x(vlist).*y(vlist);
        A(:,3)=x(vlist).^3;
%         A(:,4)=x(vlist).^2.*y(vlist);
%         A(:,5)=x(vlist).*y(vlist).^2;
        A(:,4)=y(vlist).^3;
        a=A\z(vlist);
%         zlsq=z-(a(1)*x+a(2)*y+a(3)*x.^2+a(4)*y.^2+a(5).*x.*y+a(6)*x.^3+a(7).*x.^2.*y+a(8).*x.*y.^2+a(9).*y.^3+a(10));
        zlsq=z-(a(1)*x+a(2)*y+a(3)*x.^3+a(4).*y.^3+a(5));
end

