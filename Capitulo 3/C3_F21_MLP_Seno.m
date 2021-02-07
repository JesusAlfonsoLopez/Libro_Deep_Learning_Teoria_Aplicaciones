%%
% Figura  3.21 Código para entrenar una red tipo MLP para el aprendizaje de una 
% función senoidal
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%

% Entrenamiento de una red neuronal MLP para Aprendizaje de una
% onda senoidal
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co


% Cerramos las ventanas que estén abiertas
close all
% Definición de los datos de entrenamiento
X=0:pi/10:2*pi;
D=2*sin(X);
% Creación de la red neuronal.
% 10 neuronas en la capa oculta
% Funciones de activación Tangente sigmoidal y lineal
Red=newff(X,D,[10],{'tansig','purelin'},'trainlm');
% Creación de la red neuronal.
Red.trainparam.epochs=100;
% Elimino la partición de los datos que Matlab hace por defecto
Red.divideFcn='';
Red=train(Red,X,D);
SalidaRed=sim(Red,X)
%%
%Validación de la red neuronal
%Definición de los datos de validación. 
%Buscamos usar datos diferentes a los usados en el proceso de
%entrenamiento 
Xval=pi/20:pi/10:2*pi;
SalidaRedVal=sim(Red,Xval)
figure
plot(X,D,'ok',X,SalidaRed,'+k',Xval,SalidaRedVal,'*k');
