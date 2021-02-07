%%
% Figura  3.17 Código para entrenar una red tipo MLP para que aprenda la 
% función lógica XOR
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%

% Entrenamiento de una red neuronal MLP para resolver el problema de 
% la XOR
% Además se construye la superficie de separación que genera la red entrenada
% Argumentos:
% método = método de aprendizaje
%               1 = Gradiente descendente
%               2 = Gradiente descendente con alfa variable
%               3 = Gradiente descendente con momentum
%               4 = Gradiente descendente con momentum y alfa variable
% n = Número de iteraciones
%
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co

clear
close all
metodo=2
n=500
close all;
% Definición de los patrones de entrenamiento
X=[0 0 1 1;
   0 1 0 1];
D=[0 1 1 0];
 
      switch metodo
          case 1
            met_ent='traingd'
          case 2
            met_ent='traingda'
          case 3
            met_ent='traingdm'
          case 4
            met_ent='traingdx'
          otherwise
            met_ent='traingda'
      end
        
 % Creación y entrenamiento de la red
red=newff(X,D,[10],{'tansig','tansig'},met_ent);
red.trainParam.epochs=n;
red.dividefcn='';
red=train(red,X,D);
 
% Graficación de las regiones de clasificación generadas por la red
% entrenada
figure;hold on;axis([-0.2 1.2 -0.2 1.2]),title('o=Salida en Cero +=Salida en Uno')
plot(X(1,1),X(2,1),'ok','LineWidth',7);
plot(X(1,4),X(2,4),'ok','LineWidth',7);
plot(X(1,2:3),X(2,2:3),'+k','LineWidth',2);
 
for i=-0.1:0.1:1.1
   for j=-0.1:0.1:1.1
      yred=sim(red,[i;j]);
      if yred>0.7
         plot(i,j,'+k');
      end;
      if yred<0.3
         plot(i,j,'ok');
      end;
   end;
end;
hold off
 
 % Visualización 3D de la superficie  de separación
xg=-0.2:0.01:1.2;
yg=xg;
N=length(xg);
for kx=1:N
    for ky=1:N
    M(kx,ky)=sim(red,[xg(kx); yg(ky)]);
    Xg(kx,ky)=xg(kx);
    Yg(kx,ky)=yg(ky);
    end;
end;
 
figure
colormap parula
surface(Xg,Yg,M);
view(-23,77)
shading interp 
