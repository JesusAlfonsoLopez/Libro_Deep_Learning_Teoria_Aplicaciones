%%
% Figura  5.48 Código para realizar transfer learning con la CNN AlexNet
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%

% Cargamos las imágenes como una objeto ImageDataStore. Pasamos la 
% carpeta
clear
close all
FloresDatasetPath ='FloresData/';
FloresData = imageDatastore(FloresDatasetPath, ...
     'IncludeSubfolders',true,'LabelSource','foldernames');

%%
% Verificamos el número de imágenes por categoría, clase o etiqueta
% NumeroEtiquetas es una tabla con las etiquetas, que son el mismo 
% nombre de las carpetas donde se guardan las imágenes, y con la 
% cantidad de ejemplos que hay por cada etiqueta o clase. 
NumeroEtiquetas = countEachLabel(FloresData)

%%
% Partimos el data set en dos datastore. Uno para el entrenamiento y el 
% otro para la validación. En nuestro caso vamos a usar 80% para 
% entrenar y un 20% para validar
[trainFloresData,testFloresData] =splitEachLabel(FloresData,0.8,'randomize');
 
%%
% Visualizamos algunas imágenes del data set
figure
numImages = numel(trainFloresData.Files);
idx = randperm(numImages,20);
for i = 1:20
    subplot(4,5,i)
    
    I = readimage(trainFloresData, idx(i));
    
    imshow(I)
end
 
%%
% Cargamos la red preentrenada, en este caso AlexNet
Red = alexnet
Red.Layers
Tam = Red.Layers(1).InputSize 
 
 
%%
% Extraemos las capas convolucionales de la red que se usarán como
% extractoras de características.
% Extraemos todas las capas de la red menos las tres últimas que
% corresponden a las capas clasificadores original
CapasTransferidas = Red.Layers(1:end-3);
 
%%
% Determinamos el número de clases del conjunto de entrenamiento
numClasses = numel(categories(trainFloresData.Labels))
 
%%
% Creamos la nueva red con las capas convolucionales de AlexNet y la
% capa clasificadora nueva 
NuevaRed = [...
    CapasTransferidas
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20)
    softmaxLayer
    classificationLayer];
 
%%
%Definimos los parámetros de entrenamiento para las capas transferidas
% a la nueva red. Para que estas capas se modifiquen poco trabajamos 
% una razón de aprendizaje pequeña. Para la capa clasificadora nueva 
% definimos un factor de aprendizaje mucho mayor en dicha capa lo que 
% provocará que dichas conexiones se modifiquen para lograr la 
% clasificación deseada
 
opciones = trainingOptions('sgdm',...
    'MaxEpochs',10, ...
    'MiniBatchSize',30,...
    'InitialLearnRate', 0.0000100,...
    'L2Regularization', 1.0000e-03,...
    'Momentum', 0.99,...
    'Verbose',true,...
    'VerboseFrequency',50,...
    'ValidationData',testFloresData, ...
    'ValidationFrequency',10, ...
    'ValidationPatience',Inf, ...
    'Plots','training-progress');
%%
% Entrenamos la red.
NuevaRed = trainNetwork(trainFloresData,NuevaRed,opciones);
 
%%
% Con la red entrenada verificamos su comportamiento con imágenes de 
% prueba
EtiquetasEstimadas = classify(NuevaRed,testFloresData);
 
%%
%Visualizamos algunas imágenes de prueba con la etiqueta generada de
%acuerdo a la clasificación obtenida
Nt=length(testFloresData.Files);
Indices = randperm(Nt,9);
figure
for i = 1:numel(Indices)
    subplot(3,3,i)
    
    I = readimage(testFloresData,Indices(i));
    Etiqueta = EtiquetasEstimadas(Indices(i));
    
    imshow(I)
    title(char(Etiqueta))
    drawnow
end
 
%% 
% Verificamos el comportamiento de la red con las imágenes de prueba
SalidaPrueba = classify(NuevaRed,testFloresData);
DeseadaPrueba = testFloresData.Labels;
% Calculamos la precisión de la red con las imágenes de prueba
Precision = sum(SalidaPrueba == DeseadaPrueba)/numel(DeseadaPrueba)   
 
%%
%Visualización de la matriz de confusión
YpredOneHot = full(ind2vec(double(SalidaPrueba)'));
YtestOneHot = full(ind2vec(double(testFloresData.Labels)'));
plotconfusion(YtestOneHot,YpredOneHot);
 
