%%
% Figura  4.62 Código para validar la red construida con los autocodificadores          
% apilados
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
%La entrada esta compuesta por una matriz de 784x10000. Mnist tiene 10000
%imágem¿nes de prueba
%La salida se codifica como One Hot Output
for i=1:10000
    Xtest(:,i)=reshape(test.images(:,:,i),784,1);
    YtestLabel(i)=(test.labels(i));
end;
 
%La salida se codifica como One Hot Output
Ytest = full(ind2vec(YtestLabel+1));

 y = deepnet(Xtest);
% Con la salida de la red y la salida deseada se obtiene la matriz de 
% confusión.
plotconfusion(Ytest,y);
%%

