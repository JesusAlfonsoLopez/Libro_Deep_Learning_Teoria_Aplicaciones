%%
% Figura  3.58 Código para generar la funcion peaks en Matlab
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%
Xini=[-3:0.2:3]; Yini=Xini;
[x,y]=meshgrid(Xini,Yini);
z= 3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ...
-10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
-1/3*exp(-(x+1).^2 - y.^2);
mesh(x,y,z)
