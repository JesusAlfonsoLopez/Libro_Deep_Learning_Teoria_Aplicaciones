%%
% Figura  4.44 Código para verificar la capacidad de reconstrucción de imágenes % de la red entrenada
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%
% Inicializamos la matriz de la entrada de prueba 
Xtest=zeros(784,10000);
% Inicializamos la matriz de las etiquetas de prueba de cada caracter
YtestLabel=zeros(1,10000);
% Inicializamos la matriz de salida de prueba
Ytest=zeros(10,10000);
%Extraemos de los datos de la base de datos, la información para la entrada
% y la salida de la red.
%La entrada esta compuesta por una matriz de 784x10000. Mnist tiene 
%10000 imágenes de prueba
%La salida se codifica como One Hot Output
for i=1:10000
    Xtest(:,i)=reshape(test.images(:,:,i),784,1);
    YtestLabel(i)=(test.labels(i));
end;
 
%La salida se codifica como One Hot Output
Ytest = full(ind2vec(YtestLabel+1));
 
Vector_1t=(YtestLabel==1);
Ind_1t=find(Vector_1t);
Vector_5t=(YtestLabel==5);
Ind_5t=find(Vector_5t);
Vector_6t=(YtestLabel==6);
Ind_6t=find(Vector_6t);
 
XtestP=Xtest(:,[Ind_1t Ind_5t Ind_6t]);
YtestP=Ytest(:,[Ind_1t Ind_5t Ind_6t]);
YtestLabelP=YtestLabel([Ind_1t Ind_5t Ind_6t]);
Total_Digitost=length([Ind_1t Ind_5t Ind_6t]);
 
%%
Patron=floor(rand(1,1)*Total_Digitost)
Yredtest_ori=(sim(red,XtestP(:,Patron)));
Ima_Salida=reshape(Yredtest_ori,28,28);
figure
imshow(Ima_Salida);
 
Cadena=strcat('Número esperado ',num2str(YtestLabelP(Patron)));
title(Cadena);

