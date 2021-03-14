%%
% Figura  4.54 Código para entrenar el primer autocodificador
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%
% Entrenamiento del primer autocodificador.
hiddenSize1 = 150;
autoenc1 = trainAutoencoder(Xtrain,hiddenSize1, ...
    'MaxEpochs',200, ...
    'L2WeightRegularization',0.004, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.15, ...
    'ScaleData', false);
view(autoenc1)
%%
