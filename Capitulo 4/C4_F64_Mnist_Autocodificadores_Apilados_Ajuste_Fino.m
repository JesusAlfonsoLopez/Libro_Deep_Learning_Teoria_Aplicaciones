%%
% Figura  4.64 Código para realizar un ajuste fino de la red generada con los            
% autocodificadores apilados y la capa clasificadora
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%
% Las imágenes de entrenamiento ya se tiene como vectores para generar 
% las variables que se usarán como entrada para entrenar la red 
% profunda 
deepnet = train(deepnet,Xtrain,Ytrain);
y = deepnet(Xtest);
plotconfusion(Ytest,y);

