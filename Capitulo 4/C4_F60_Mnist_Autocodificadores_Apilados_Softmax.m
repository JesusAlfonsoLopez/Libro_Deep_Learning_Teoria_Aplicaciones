%%
% Figura  4.60 Código para apilar los autocodificadores ya entrenados y entrenar una  
% capa clasificadora tipo softmax
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%
% Generación de las características que se obtienen en la capa oculta 
% del segundo autocodificador
feat2 = encode(autoenc2,feat1);
% Entrenamiento de la capa clasificadora.
softnet = trainSoftmaxLayer(feat2,Ytrain,'MaxEpochs',400);
% Apilamiento de las tres capas obtenidas para formar la red profunda.
deepnet = stack(autoenc1,autoenc2,softnet);
view(deepnet)
%%

