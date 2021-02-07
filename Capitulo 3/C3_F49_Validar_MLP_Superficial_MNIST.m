%%
% Figura  3.49 Código para validar la red neuronal superficial entenada con el conjunto de 
% datos MNIST
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
%Extraemos de los datos de la base de datos, la información para la %entrada y la salida de la red.

%La entrada está compuesta por una matriz de 784x10000. Mnist tiene 10000
%imágenes de prueba
for i=1:10000
    Xtest(:,i)=reshape(test.images(:,:,i),784,1);
    YtestLabel(i)=(test.labels(i));
end;
 
%La salida se codifica como One Hot Output
Ytest = full(ind2vec(YtestLabel+1));
 
% Calculo de la salida de la red con la entrada de prueba
Yredtest_ori=(sim(red,Xtest));
%Se calcula los índices de la codificación One Hot para la salida de prueba
%y la salida genera por la red
[M,IndTest]=max(Ytest);
[M,IndRedTest]=max(Yredtest_ori);
% Vector con los errores generados 
Error_Test=(IndTest-IndRedTest);
%Vector con los errores generados 
Cantidad_Errores=Error_Test~=0;
% Calculo del porcentaje de errores
Porcentaje_Errores=sum(Cantidad_Errores)/length(Cantidad_Errores)
% Calculo del porcentaje de aciertos o precisión 
Cantidad_Aciertos=Error_Test==0;
Porcentaje_Aciertos=sum(Cantidad_Aciertos)/length(Cantidad_Aciertos)
 
%Generación de la matriz de confusión
figure;
plotconfusion(Ytest,Yredtest_ori)

