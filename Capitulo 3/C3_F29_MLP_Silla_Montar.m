%%
% Figura  3.29 Código para entrenar una red tipo MLP para el aprendizaje de una función de
% dos variable
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%

% Entrenamiento de una red neuronal MLP para Aprendizaje de una
% superficie tipo silla de montar
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co

%
% Generación de los datos que usaremos para entrenar la red neuronal
close all
Rangox=-5:0.5:5;
Rangoy=Rangox;
[X,Y]=meshgrid(Rangox,Rangoy);
 Z=X.^2-Y.^2;
 surf(X,Y,Z)
 [f,c]=size(X);
% Xred en la entra de la red y D es la salida deseada
Xred=[reshape(X,1,f*c);
          reshape(Y,1,f*c)];
D=reshape(Z,1,f*c);
%%
% Creación de la red neuronal MLP con una capa oculta de 10 neuronas 
% con función de activación tangente sigmoidal, método de entrenamiento
% usado Levenberg-Marquardt
Red=newff(Xred,D,[10],{'tansig','purelin'},'trainlm');
% Elimino la partición de los datos que Matlab hace por defecto
Red.divideFcn=''; 
% Definimos la cantidad de iteraciones de entrenamiento y entrenamos 
% la red 
Red.trainparam.epochs=100;
Red=train(Red,Xred,D);
%%
% Calculamos la salida de la red con los datos de entrenamiento
SalRed=sim(Red,Xred);
% Generamos los datos de validación. Deben ser diferentes a los usados 
% en el proceso de entrenamiento
RangoxVal=-4.75:0.5:4.75;
RangoyVal=RangoxVal;
[Xval,Yval]=meshgrid(RangoxVal,RangoyVal);
[fval,cval]=size(Xval);
XredVal=[reshape(Xval,1,fval*cval);
reshape(Yval,1,fval*cval)];
% Pruebo al red con los datos de validacion     
SalRedVal=sim(Red,XredVal); 
% Creamos una figura donde visualizaremos los datos de entrenamiento 
%(puntos azules) la salida de la red ante los datos de entrenamiento 
%(asteríscos rojos) y la salida de la red ante los datos de validación 
%(asteríscos verdes)
figure
plot3(reshape(X,1,f*c),reshape(Y,1,f*c),reshape(Z,1,f*c),'ob');
hold on
plot3(reshape(X,1,f*c),reshape(Y,1,f*c),(SalRed),'*r');
plot3(reshape(Xval,1,fval*cval),reshape(Yval,1,fval*cval),...
(SalRedVal),'*g');
hold off

% Creamos una figura donde visualizaremos la superficie generada 
% por la red usando la salida ante los datos de validación 

figure
surf(Xval,Yval,reshape(SalRedVal,fval,cval))


