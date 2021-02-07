%%
% Figura  3.34 Código para entrenar una red tipo MLP para el aprendizaje de un sistema 
% dinámico
% Autor:	
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%

% Entrenamiento de una red neuronal MLP para la identificación o 
% modelado de un sistema dinámico de primer orden
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co

% U debe contener los datos de entrada a la planta.
% Y debe contener los datos de salida a la planta.
% U, Y deben ser vectores columna.
%%
close all
U=Entrada;
Y=Salida;
Phi=[Y(1:end-1),U(1:end-1)]';
YReal=[Y(2:end)]';
%%
%Creación y entrenamiento de la red
Red=newff(Phi,YReal,[10],{'tansig','purelin'},'trainlm');
Red.dividefcn='';
Red.Trainparam.epochs=100;
Red=train(Red,Phi,YReal);
%%
%Exportación de la red a simulink para su validación
gensim(Red,0.01)

