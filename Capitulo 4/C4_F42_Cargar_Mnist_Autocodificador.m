%%
% Figura  4.42 Código para cargar y organizar la información del conjunto de datos       
% MNIST que serán usados con un Autocodificador
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%
clear
close all
%Se cargan los datos de la base de datos mnist
load mnist.mat;
 
% Visualizamos las primeras 20 imágenes 
figure
for i = 1:36
    subplot(6,6,i);
    imshow(training.images(:,:,i));
end
 
% Inicializamos la matriz de entrada para el entrenamiento de la red neuronal
% MNIST tiene 60000 imágenes para entrenar 
Xtrain=zeros(784,60000);
% Inicializamos la matriz de las etiquetas de cada caracter
YtrainLabel=zeros(1,60000);
% Inicializamos la matriz de salida para la red neuronal
Ytrain=zeros(10,60000);
%Extraemos de los datos de la base de datos, la información para la entrada
%y la salida de la red.
%La entrada esta compuesta por una matriz de 784x60000
%La salida se codifica como One Hot Output
 
for i=1:60000
    Xtrain(:,i)=reshape(training.images(:,:,i),784,1);
    YtrainLabel(i)=(training.labels(i));
end;
 
%La salida se codifica como One Hot Output
Ytrain = full(ind2vec(YtrainLabel+1));

%Del data set completo se extraer las imágenes correspondiente a los
%números 1, 5 y 6
Vector_1=(YtrainLabel==1);
Ind_1=find(Vector_1);
Vector_5=(YtrainLabel==5);
Ind_5=find(Vector_5);
Vector_6=(YtrainLabel==6);
Ind_6=find(Vector_6);
 
XtrainP=Xtrain(:,[Ind_1 Ind_5 Ind_6]);
YtrainP=Ytrain(:,[Ind_1 Ind_5 Ind_6]);
 
Total_Digitos=length([Ind_1 Ind_5 Ind_6]);
 

