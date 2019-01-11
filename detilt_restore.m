function zlsq=detilt_restore(z, a)

[ny,nx]=size(z);
[x,y]=meshgrid(1:nx,1:ny);
vlist=find((~isnan(z))&(~isinf(z)));
npt=length(vlist);

zlsq=z-(a(1)*x+a(2)*y+a(3));
