%%
% Código para crear una CNN y su entrenamiento 
% con el data set Fashion MNIST
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%

% Entrenamiento de una CNN para reconocimiento de caracteres 
% del data set Fashion MNIST
%
% Autor:
%       jalopez@uao.edu.co
 
%%
%
% Carga el data set como un objeto ImageDataStore. Para esto se define
% el nombre de la carpeta con las imágenes.
% Con esta estructura de datos se puede trabajar eficientemente por 
% lotes para entrenar y validar redes convolucionales
clear
close all
%Este primer datastore almacenará las imágenes de entrenamiento
MnistTrainDatasetPath='FashionMnistTrainingData/';
MnistTrainData = imageDatastore(MnistTrainDatasetPath,...
    'IncludeSubfolders',true,'LabelSource','foldernames');
%Este segundo datastore almacenará las imágenes de prueba
MnistTestDatasetPath='FashionMnistTestData/';
MnistTestData = imageDatastore(MnistTestDatasetPath,...
    'IncludeSubfolders',true,'LabelSource','foldernames');
 
%%
% Se visualizan 20 imágenes del data set
figure;
perm = randperm(60000,20);
for i = 1:20
    subplot(4,5,i);
    imshow(MnistTrainData.Files{perm(i)});
end
 
%%
 
% Verificamos el número de imágenes por categoría, clase o etiqueta
% NumeroEtiquetas es una tabla con las etiquetas, que son el mismo 
% nombre de las carpetas donde se guardan las imágenes, y con la
% cantidad de ejemplos que hay por cada etiqueta o clase. 
NumeroEtiquetas = countEachLabel(MnistTrainData)
 
%%
% Verificamos el tamaño de las imágenes. Todas las imágenes deben ser 
% del mismo tamaño. Tomamos como referencia el tamaño de la primera
% imagen. 
% Para el data set Mnist sabemos que cada imagen es de 
% 28x28x1 pixeles.
img = readimage(MnistTrainData,1);
size(img)
 
 
%% 
% Definimos la arquitectura de la red convolucional
% La capa de entrada trabajará en este caso con imágenes de 28x28 por
%  un canal, es decir en escala de grises
% imageInputLayer([28 28 1])
 
% Capa convolucional en 2D con filtros de tamaño 3x3. Se definen 16 
% filtros por defecto el stride es 1 y se definen un zero padding 
% de uno para garantizar que la salida de la capa conserve el tamaño 
% de la entrada
% convolution2dLayer(3,16,'Padding',1)
% Después de la convolución se aplica la operación de batch 
% normalization para posteriormente aplicar la función de activación 
% ReLU
% batchNormalizationLayer
% reluLayer
% Especificamos que se va a realizar un maxpooling En este caso se 
% usarán ventanas de 2x2 con un desplazamiento (stride) de 2
% maxPooling2dLayer(2,'Stride',2)
 
% Se crean tres capas convolucionales adicionales de filtros del mismo
% tamaño 3x3 pero una con 32 filtros, la otra con 64 filtros y la última
% con 128 filtros
 
% Definimos una capa totalmente conectada con 10 neuronas. Esta capa
% toma como entrada la salida de la capa anterior
% fullyConnectedLayer(10)
% Especificamos que la capa totalmente conectada es del tipo softmax
% softmaxLayer
% Definimos que la capa softmax corresponde a la capa de salida o
% clasificadora
% classificationLayer()
capas = [
    imageInputLayer([28 28 1])
    
    convolution2dLayer(3,16,'Padding',1)
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding',1)
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,64,'Padding',1)
    batchNormalizationLayer
    reluLayer
 
    convolution2dLayer(3,128,'Padding',1)
    batchNormalizationLayer
    reluLayer

    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];
 
 
%% 
% Definimos las opciones de entrenamiento
% Definimos la máxima cantidad de épocas a 2. Una época se define como
% una pasada por todos los datos de entrenamiento
% El método de entrenamiento es el gradiente descendente estocástico 
% con momentum. El tamaño del lote es de 64 
opciones = trainingOptions('sgdm',...
    'MaxEpochs',2, ...
    'MiniBatchSize',64,...
    'Verbose',true,...
    'VerboseFrequency',50,...
    'Plots','training-progress');
 
% Podemos visualizar las diferentes opciones de entrenamiento
%                      Momentum: 0.9000
%              InitialLearnRate: 0.0100
%     LearnRateScheduleSettings: [1x1 struct]
%              L2Regularization: 1.0000e-04
%                     MaxEpochs: 20
%                 MiniBatchSize: 64
%                       Verbose: 1
%              VerboseFrequency: 50
%                ValidationData: []
%           ValidationFrequency: 50
%            ValidationPatience: 5
%                       Shuffle: 'once'
%                CheckpointPath: ''
%          ExecutionEnvironment: 'auto'
%                    WorkerLoad: []
%                     OutputFcn: []
%                         Plots: 'training-progress'
%                SequenceLength: 'longest'
%          SequencePaddingValue: 0
 
%% 
% Con la estructura y opciones definidas procedemos a entrenar la red
% neuronal.
% Si se tiene una GPU compatible, Matlab la usa para hacer el 
% entrenamiento de la red neuronal (se requiere el toolbox de 
% computación paralela (Parallel Computing Toolbox).

% En el entrenamiento se muestra una gráfica con la evolución del 
% mismo donde podemos visualizar la precisión y la pérdida de cada 
% mini-lote

CNNRed = trainNetwork(MnistTrainData,capas,opciones);
 
%% 
% Verificamos el comportamiento de la red con las imágenes de prueba
SalidaPrueba = classify(CNNRed,MnistTestData);
DeseadaPrueba = MnistTestData.Labels;
% Calculamos la precisión de la red con las imágenes de prueba
Precision = sum(SalidaPrueba == DeseadaPrueba)/numel(DeseadaPrueba)   
 
%%
%Visualización de la matriz de confusión
 
YpredOneHot = full(ind2vec(double(SalidaPrueba)'));
YtestOneHot = full(ind2vec(double(MnistTestData.Labels)'));
plotconfusion(YtestOneHot,YpredOneHot);

