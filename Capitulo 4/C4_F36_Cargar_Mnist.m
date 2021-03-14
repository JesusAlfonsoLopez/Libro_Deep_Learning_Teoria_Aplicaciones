%%
% Figura  4.36 Código para cargar y organizar la información del conjunto de datos MNIST
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%
%
%Código para cargar los datos del dataset mnist previamiente guardados
% en un archivo *.mat

clear
close all
%Se cargan los datos de la base de datos mnist
load mnist.mat;
 
% Visualizamos las primeras 36 imágenes 
figure
for i = 1:36
    subplot(6,6,i);
    imshow(training.images(:,:,i));
end
 
% Inicializamos la matriz de entrada para el entrenamiento de la red
% neuronal
% MNIST tiene 60000 imágenes para entrenar 
Xtrain=zeros(784,60000);
% Inicializamos la matriz de las etiquetas de cada caracter
YtrainLabel=zeros(1,60000);
% Inicializamos la matriz de salida para la red neuronal
Ytrain=zeros(10,60000);
%Extraemos de los datos de la base de datos, la información para la entrada
%y la salida de la red.
%La entrada está compuesta por una matriz de 784x60000
 
 
for i=1:60000
    Xtrain(:,i)=reshape(training.images(:,:,i),784,1);
    YtrainLabel(i)=(training.labels(i));
end;
 
%La salida se codifica como One Hot Output
Ytrain = full(ind2vec(YtrainLabel+1));

