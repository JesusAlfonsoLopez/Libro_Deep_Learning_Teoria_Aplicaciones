%%
% Figura  4.58 Código para entrenar el segundo autocodificador
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%
% Generación de las características que se obtienen en la capa oculta 
% del primer autocodificador
feat1 = encode(autoenc1,Xtrain);
% Entrenamiento del segundo autocodificador.
hiddenSize2 = 75;
autoenc2 = trainAutoencoder(feat1,hiddenSize2, ...
    'MaxEpochs',100, ...
    'L2WeightRegularization',0.002, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.1, ...
    'ScaleData', false);
view(autoenc2)

